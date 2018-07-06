

function test-EVE-ESI-Result ($result) {
    $VerbosePreference = $global:VerbosePreference

    if ($result.Headers.'X-Esi-Error-Limit-Remain' -lt 10) { 
        Write-Verbose "Error Limit reached, throttling" 
        start-sleep -Seconds $([int]$($result.Headers.'X-Esi-Error-Limit-Reset') + 2) -Verbose
    }


    # Is Result Valid
    if ($result.StatusCode -ne 200) {
        Write-Verbose "ErrorCode: $($result.Statuscode)  ErrorMsg: $($result.StatusDescription)" ; 
        Write-Verbose "ErrorCode: $($result.Statuscode)  ErrorMsg: $($result.StatusDescription)" ; 
        return $false
        break
    }
    if ($result.StatusCode -eq 200) {
        $VerifyResult = $true
        Write-Verbose "ErrorCode: $($result.Statuscode)  ErrorMsg: $($result.StatusDescription)" ;
        Write-Verbose "VerifyResult: $VerifyResult" 
    }

    # Is Result Data stale and should be refreshed? 
    if ($result.Headers.Expires -ne $null) {
        if ($(get-date $result.Headers.Expires).ToUniversalTime() -gt $(get-date).ToUniversalTime()) { 
            $VerifyResult = $true
            Write-Verbose "Expire Value: $($result.Headers.Expires)" ; 
            Write-Verbose "Data Cached - No need to get new data"
            Write-Verbose "VerifyResult: $VerifyResult" 
        }
        else { 
            $VerifyResult = $false
            Write-Verbose "Expire Value: $($result.Headers.Expires)" ; 
            Write-Verbose "Cache Expired - Get new Data"
            Write-Verbose "VerifyResult: $VerifyResult"
        }
    }
    else { 
        $VerifyResult = $true
        Write-Verbose "Expire Value: No Expire value" ; 
        Write-Verbose "VerifyResult: $VerifyResult"
    }

    return $VerifyResult
}


function out-EVE-ESI ($result, $OutputType) {
    $VerbosePreference = $global:VerbosePreference

    Write-Verbose  "OutPut Format: $OutputType"
    Write-Verbose  "$result"
    if ($OutputType -eq "json") { $newformat = $result } 
    if ($OutputType -eq "PS") { $newformat = $result.content | ConvertFrom-Json  } 

    return $newformat
}


function set-verbose {
    Param(
        [ValidateSet("continue", "SilentlyContinue")]
        [String]
        $verbose
    ) 

    $VerbosePreference = $verbose 
    Write-Host "Verbose set to: $global:VerbosePreference" -ForegroundColor Green
    Write-Verbose "Verbose Enabled"
}


function get-EveEsiStatus {
    Param( 
        [string]
        $URI = 'https://esi.evetech.net/status.json?',
        [Parameter(Mandatory = $false, HelpMessage = "The version of metrics to request. Note that alternate versions are grouped together.")]
        [ValidateSet("latest", "dev", "legacy", "meta")]
        [string]
        $version = "latest",
        [Parameter(Mandatory = $false, HelpMessage = "Output Format of Result")]
        [ValidateSet("PS", "json","PSfull")]
        $OutputType = "PS"
    ) #End of Param
    
    $URI = $URI + "version=$($version)"
    invoke-EVEWebRequest -Uri $URI -Method Get -OutputType $OutputType   
}


function invoke-EVEWebRequest { 
    Param( 
        $uri,
        [Parameter(Mandatory = $false)]
        $header,
        [Parameter(Mandatory = $false)]
        $body,
        [Parameter(Mandatory = $false)]
        $Method,
        [Parameter(Mandatory = $false)]
        $OutputType = "PS"
    ) #End of Param

    # Build Body Paramter
    $newbody = $Null
    if ($body.item_ids -notlike "") { 
        $newbody = "[" + $($body.item_ids -join ",") + "]"
    }
    if (($body.ids | Measure-Object).count -gt 0 ) { 
        $newbody = $Null
        $body = "[" + $($body.ids -join ",") + "]"
    }
    else { 
        #$body 
    }

    try {
        $ESIReply = Invoke-WebRequest -Uri $uri -Method $Method -Body $body -ContentType "application/json" 
    }
    catch {
#        $ESIMetaStatuses = get-EveEsiStatus -version latest -OutputType PS 
        write-host "$($_ | format-list)"
        $ESIReply = Invoke-WebRequest -Uri $uri -Method $Method -Body $body -ContentType "application/json" 
        #$($_ | Format-List )
        #$(get-EveEsiStatus -OutputType PS | Where-Object status -NotLike "green")
        #start-sleep -Seconds 30
    }
    finally { 
    }

    if ($ESIReply.Headers.Warning -ne $null) { 
        write-host "$($ESIReply.Headers.Warning) $($ESIReply.BaseResponse.ResponseUri.AbsolutePath) " -ForegroundColor Red
    }

    if ([int]$ESIReply.Headers.'X-Esi-Error-Limit-Remain' -lt 20) {
        Write-Host "X-Esi-Error-Limit-Remain at $($ESIReply.Headers.'X-Esi-Error-Limit-Remain') sleeping ($([int]$ESIReply.Headers.'X-Esi-Error-Limit-Reset'+2)) seconds" -ForegroundColor "Yellow"
        Write-host "Affected Call: $($ESIReply.BaseResponse.ResponseUri.AbsolutePath)" -ForegroundColor "Yellow"
        Start-Sleep -Seconds $([int]$ESIReply.Headers.'X-Esi-Error-Limit-Reset'+2)
    }
        

    if ($OutputType -eq "PS") {
        return $($ESIReply.content | ConvertFrom-Json) 
    }
    if ($OutputType -eq "PSfull") {
        $preOutput = @{
        Content = $ESIReply.content | ConvertFrom-Json
        Headers = $ESIReply.Headers
        }
        $NewOutPut = New-Object -TypeName psobject -Property $preOutput

        $NewOutPut.Headers.Date = $NewOutPut.Headers.Date | get-date -Format "yyyy-MM-dd HH:mm:ss"
        $NewOutPut.Headers.Expires = $NewOutPut.Headers.Expires | get-date -Format "yyyy-MM-dd HH:mm:ss"
        $NewOutPut.Headers.'Last-Modified' = $NewOutPut.Headers.'Last-Modified' | get-date -Format "yyyy-MM-dd HH:mm:ss"

        return $NewOutPut
    }
    else {
        return $ESIReply
    }
}


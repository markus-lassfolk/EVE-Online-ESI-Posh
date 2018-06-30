

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
        [ValidateSet("PS", "json")]
        $OutputType = "PS"
    ) #End of Param
    
    $URI = $URI + "version=$($version)"
    
    #Write-Host $URI
    invoke-EVEWebRequest -Uri $URI -Method Get 
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

    if ($OutputType -eq "PS") {
        return $($ESIReply.content | ConvertFrom-Json) 
    }
    else {
        return $ESIReply
    }

}



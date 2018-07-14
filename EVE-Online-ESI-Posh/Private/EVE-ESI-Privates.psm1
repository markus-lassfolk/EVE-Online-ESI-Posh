

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
        $body = $newbody
    }
    if (($body.ids | Measure-Object).count -gt 0 ) {
        $body = "[" + $($body.ids -join ",") + "]"
    }
    else {
        #$body
    }

    $ESIReply = $Null
    try {
        Write-Verbose "Executing: Invoke-WebRequest -Uri '$($uri)' -Method '$($Method)' -Body '$($body)' -ContentType $("application/json")"
        $ESIReply = Invoke-WebRequest -Uri $uri -Method $Method -Body $body -ContentType "application/json"
    }
    catch {

        $Global:ESIError = $_
        if ($_.Exception.Response.Headers["X-Esi-Error-Limit-Remain"] -ne $null -and [int]$_.Exception.Response.Headers["X-Esi-Error-Limit-Remain"] -lt 20) {
            Write-Host "$($_.ErrorDetails.Message | ConvertFrom-Json)" -ForegroundColor Yellow
            Write-Host "Exception Message: $($_.Exception.Message)" -ForegroundColor Yellow
            Write-Host "URL Requested: $($_.Exception.Response.ResponseUri.AbsoluteUri)" -ForegroundColor Yellow
            Write-host "Error Limit less than 20 - sleep" -ForegroundColor Yellow
            Start-Sleep -Seconds $([int]$_.Exception.Response.Headers["X-Esi-Error-Limit-Reset"] + 2) -Verbose
        }

        if (($_.ErrorDetails.Message | ConvertFrom-Json).error -eq "expired" -and ($_.ErrorDetails.Message | ConvertFrom-Json).sso_status -eq "400") {
            Write-Host "$($_.ErrorDetails.Message | ConvertFrom-Json)" -ForegroundColor Yellow
            Write-Host "Exception Message: $($_.Exception.Message)" -ForegroundColor Yellow
            Write-Host "URL Requested: $($_.Exception.Response.ResponseUri.AbsoluteUri)" -ForegroundColor Yellow
            Write-host "Token Expired" -ForegroundColor Yellow
            return ($_.ErrorDetails.Message | ConvertFrom-Json).error ; break
        }
        if (($_.ErrorDetails.Message | ConvertFrom-Json).error -eq "Forbidden") {
            Write-Host "$($_.ErrorDetails.Message | ConvertFrom-Json)" -ForegroundColor Yellow
            Write-Host "Exception Message: $($_.Exception.Message)" -ForegroundColor Yellow
            Write-Host "URL Requested: $($_.Exception.Response.ResponseUri.AbsoluteUri)" -ForegroundColor Yellow
            Write-Host "Token has no Access" -ForegroundColor Yellow
            return ($_.ErrorDetails.Message | ConvertFrom-Json).error ; break
        }


        #if (($Global:ESIError.ErrorDetails.Message | ConvertFrom-Json).error -like "Timeout contacting*" -and ($Global:ESIError.ErrorDetails.Message | ConvertFrom-Json).Timeout -gt 0) {
        #   EVE-ESI-Privates\get-EveEsiStatus -version latest | where method -eq $Global:ESIError.Exception.Response.Method | where route -Match $Global:ESIError.Exception.Response.ResponseUri.Segments[2] | where status -ne "green"
        #}

        else {
            Write-Host "$($_.ErrorDetails.Message | ConvertFrom-Json)" -ForegroundColor Yellow
            Write-Host "Exception Message: $($_.Exception.Message)" -ForegroundColor Yellow
            Write-Host "URL Requested: $($_.Exception.Response.ResponseUri.AbsoluteUri)" -ForegroundColor Yellow
            return ($_.ErrorDetails.Message | ConvertFrom-Json).error ; break
        }
    }
    finally {
    }

    # Altert if EndPoints got a Warning Message
    if ($ESIReply.Headers.Warning -ne $null) {
        write-host "$($ESIReply.Headers.Warning) $($ESIReply.BaseResponse.ResponseUri.AbsolutePath) " -ForegroundColor Red
    }

    # Sleep if Error Limit is below 20.
    if ($ESIReply.Headers -ne $null -and [int]$ESIReply.Headers.'X-Esi-Error-Limit-Remain' -lt 20) {
        Write-Host "X-Esi-Error-Limit-Remain at $($ESIReply.Headers.'X-Esi-Error-Limit-Remain') sleeping ($([int]$ESIReply.Headers.'X-Esi-Error-Limit-Reset'+2)) seconds" -ForegroundColor "Yellow"
        Write-host "Affected Call: $($ESIReply.BaseResponse.ResponseUri.AbsolutePath)" -ForegroundColor "Yellow"
        Start-Sleep -Seconds $([int]$ESIReply.Headers.'X-Esi-Error-Limit-Reset' + 2)
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




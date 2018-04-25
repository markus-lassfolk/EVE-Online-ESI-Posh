

function test-EVE-ESI-Result ($result) {
$VerbosePreference = $global:VerbosePreference

    if ($result.Headers.'X-Esi-Error-Limit-Remain' -lt 10) { 
        Write-Verbose "Error Limit reached, throttling" 
        start-sleep -Seconds $([int]$($result.Headers.'X-Esi-Error-Limit-Reset')+2) -Verbose
    }


    # Is Result Valid
    if ($result.StatusCode -ne 200) {
        Write-Verbose "ErrorCode: $($result.Statuscode)  ErrorMsg: $($result.StatusDescription)" ; 
        Write-Output  "ErrorCode: $($result.Statuscode)  ErrorMsg: $($result.StatusDescription)" ; 
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


function out-EVE-ESI ($result,$outformat) {
    $VerbosePreference = $global:VerbosePreference

    Write-Verbose  "OutPut Format: $outformat"
    if ($outformat -eq "json") { return $result } 
    if ($outformat -eq "PS") { return ($result | ConvertFrom-Json) } 
}


function set-verbose {
    Param(
        [ValidateSet("continue","SilentlyContinue")]
        [String]
        $verbose
    ) 

    $VerbosePreference = $verbose 
    Write-Host "Verbose set to: $global:VerbosePreference" -ForegroundColor Green
    Write-Verbose "Verbose Enabled"
}



function invoke-EVEWebRequest ($Uri, $headers, $Method, $body, $parameters, $retrycount, $outformat) { 

    $result = Invoke-WebRequest -Uri $uri -Method $Method -Headers $headers

#    $testresult = test-EVE-ESI-Result -result $result

    return $result
}



function test-EVE-ESI-Result ($result) {
    # Is Result Valid
    if ($result.StatusCode -ne 200) {
        Write-Output  "ErrorCode: $($result.Statuscode)  ErrorMsg: $($result.StatusDescription)" ; 
        retuen $false
        break
    }
    if ($result.StatusCode -eq 200) {
       $VerifyResult = $true
    }

    # Is Result Data stale and should be refreshed? 
    if ($(get-date $result.Headers.Expires).ToUniversalTime() -gt $(get-date).ToUniversalTime()) { 
        $VerifyResult = $true
    }
    return $VerifyResult

}

function out-EVE-ESI ($result,$outformat) {
     if ($outformat -eq "json") { return $result } 
    if ($outformat -eq "PS") { return ($result | ConvertFrom-Json) } 
}



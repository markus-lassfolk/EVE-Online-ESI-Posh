
function get-eve-meta-ping  {
    Param(
        [ValidateSet("json")]
        [String]
        $outformat
    ) 
#   Example URI
#   https://esi.tech.ccp.is/ping

    $uri = $baseUri+"ping"
    $header = @{
        'Accept' = 'application/json'
    }

    $result = Invoke-WebRequest -Uri $uri -Method Get -Headers $header
    test-EVE-ESI-Result $result
    return (out-EVE-ESI -outformat $outformat -result $result)
}


function get-eve-meta-status  {
    Param(
        [ValidateSet("latest","dev","legacy","meta")]
        [String]
        $version,
        [ValidateSet("PS","json")]
        [String]
        $outformat
    ) 
#   Example URI
#   https://esi.tech.ccp.is/status.json?version=latest
    $uri = $baseUri+"status.json?version="+$version
    $header = @{
        'Accept' = 'application/json'
    }
    $result = Invoke-WebRequest -Uri $uri -Method Get -Headers $header
    $testresult = test-EVE-ESI-Result $result
    return (out-EVE-ESI -outformat $outformat -result $result) 
}



function get-eve-meta-verify  {
#Work in Progress not done
    Param(
        [ValidateSet("Tranquility","singularity")]
        [String]
        $datasource,
        [String]
        $token,
        [String]
        $Authorization,
        [ValidateSet("PS","json")]
        [String]
        $outformat
    ) 
break ; 
#   Example URI
#   https://esi.tech.ccp.is/verify/?datasource=tranquility
    $uri = $baseUri+"verify?datasource="+$datasource+"&token="+$token+"&Authorization="+$Authorization
    $header = @{
        'Accept' = 'application/json'
    }
    $result = Invoke-WebRequest -Uri $uri -Method Get -Headers $header
    $testresult = test-EVE-ESI-Result $result
    return (out-EVE-ESI -outformat $outformat -result $result) 
}


function get-eve-meta-versions  {
        Param(
            [ValidateSet("PS","json")]
            [String]
            $outformat
        ) 
    #   Example URI
    #   https://esi.tech.ccp.is/versions/
        $uri = $baseUri+"versions"
        $header = @{
            'Accept' = 'application/json'
        }
        $result = Invoke-WebRequest -Uri $uri -Method Get -Headers $header
        $testresult = test-EVE-ESI-Result $result
        return (out-EVE-ESI -outformat $outformat -result $result) 
    }


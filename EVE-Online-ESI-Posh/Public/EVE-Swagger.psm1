

function get-eve-swagger-specifics  {
    Param(
        [ValidateSet("latest","dev","legacy","_latest","_dev","_legacy")]
        [String]
        $Swagger,
        [ValidateSet("tranquility","singularity")]
        [String]
        $datasource,
        [ValidateSet("PS","json")]
        [String]
        $outformat
    ) 
#   Example URI
#   https://esi.tech.ccp.is/_latest/swagger.json?datasource=tranquility
    $uri = $baseUri+$swagger+"/swagger.json?datasource="+$datasource
    $header = @{
        'Accept' = 'application/json'
    }
    $result = Invoke-WebRequest -Uri $uri -Method Get -Headers $header
    $testresult = test-EVE-ESI-Result $result
    return (out-EVE-ESI -outformat $outformat -result $result) 
}


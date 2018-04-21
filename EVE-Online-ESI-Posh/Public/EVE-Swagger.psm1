

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

$LatestJSON = get-eve-swagger-specifics -Swagger latest -datasource tranquility -outformat json
$Latest_JSON = get-eve-swagger-specifics -Swagger _latest -datasource tranquility -outformat json

$LatestPS | select -first 1
$Latest_PS | select -first 1

$LatestJSON.Content | ConvertFrom-Json | select basepath
($LatestJSON.Content | ConvertFrom-Json).definitions.bad_request
($LatestJSON.Content | ConvertFrom-Json).host
($LatestJSON.Content | ConvertFrom-Json).info

$EVESSODataSources = ($LatestJSON.Content | ConvertFrom-Json).parameters.datasource.enum 
$EVEESILanguages = ($LatestJSON.Content | ConvertFrom-Json).parameters.language.enum
$EVESSOAuthorizationURL = ($LatestJSON.Content | ConvertFrom-Json).securitydefinitions.evesso.authorizationurl
$EVESSOScopes = ($LatestJSON.Content | ConvertFrom-Json).securitydefinitions.evesso.scopes

$EVEESIPaths = ($LatestJSON.Content | ConvertFrom-Json).paths
$EVEESIPaths | % { $_ | Get-Member  }

$EVEESIPaths.'/alliances/'.get.tags

($LatestJSON.Content | ConvertFrom-Json).paths.'/wars/'.get.responses
($LatestJSON.Content | ConvertFrom-Json).produces
($LatestJSON.Content | ConvertFrom-Json).schemes

$LatestJSON.Content | ConvertFrom-Json | select swagger





$Latest_JSON.Content | ConvertFrom-Json | ft paths


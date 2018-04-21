$baseUri = "https://esi.tech.ccp.is/"

function get-eve-universe-ancestries  {
    Param(
        [ValidateSet("Tranquility","singularity")]
        [String]
        $datasource,
        [ValidateSet("en-us","ru","de","fr","ja","zh")]
        [String]
        $language,
        [ValidateSet("PS","json")]
        [String]
        $outformat
    ) 
#   Example URI
#   https://esi.tech.ccp.is/latest/universe/ancestries/?datasource=tranquility&language=en-us

    $uri = $baseUri+"latest/universe/ancestries/?Datasource="+$datasource+"&language="+$language
    $header = @{
        'Accept' = 'application/json'
    }

    $result = Invoke-WebRequest -Uri $uri -Method Get -Headers $header
    test-EVE-ESI-Result $result
    return (out-EVE-ESI -outformat $outformat -result $result)
}

$eveuniverseancestriesjson = get-eve-universe-ancestries -datasource Tranquility -language en-us -outformat json
$eveuniverseancestriesPS = get-eve-universe-ancestries -datasource Tranquility -language en-us -outformat PS







    function get-ccpUniverseStructures ($locationID, $token) {


        $uri = "https://esi.tech.ccp.is/latest/universe/structures/$($locationID)/?datasource=tranquility"
        $header = @{
              'Authorization' = "Bearer "+ ($token)
              'Accept' = 'application/json'
              'User-Agent' = 'markus@lassfolk.net'
        }
    
        Invoke-RestMethod -Uri $uri -Method Get -Headers $header
    }



    function get-eveuniversetypeid ($typeid) {

        $uri = "https://esi.tech.ccp.is/latest/universe/types/$($typeid)/?language=en-us&datasource=tranquility"
         Invoke-RestMethod -Uri $uri -Method Get
    }
    
    
    
function get-eveuniversefactions () {
    
        $uri = "https://esi.tech.ccp.is/latest/universe/factions/?datasource=tranquility&language=en-us"
         Invoke-RestMethod -Uri $uri -Method Get
    }
    
    
function get-evecorpnpccorps () {
    
        $uri = "https://esi.tech.ccp.is/latest/corporations/npccorps/?datasource=tranquility"
         Invoke-RestMethod -Uri $uri -Method Get
    }
    
    
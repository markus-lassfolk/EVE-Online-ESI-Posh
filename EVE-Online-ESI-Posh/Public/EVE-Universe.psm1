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






language 
 - de
 - en-us

user_agent 
 - Client identifier, takes precedence over headers

X-User-Agent
 - Client identifier, takes precedence over User-Agent

 curl -X GET "https://esi.tech.ccp.is/latest/universe/ancestries/?datasource=tranquility&language=en-us" -H  "accept: application/json"


 function get-eveitemmovingaverage ($typeid,$region,$AverageDays) {

    #    $typeid = "23919"
    
        if ($typeid -eq $Null) { break }
        if ($region -eq $Null) { $marketregion = "10000002" }  # The Forge 
        if ($region -ne $Null) { $marketregion = $region }
        if ($AverageDays -eq $Null) { [int]$MovingAverageDays = "10" } 
        if ($AverageDays -ne $Null) { [int]$MovingAverageDays = "$AverageDays" } 
    
        # Get Price History for "The Forge" 
        $header = @{ 'Content-Type' = "application/json" }
        $uri = "https://esi.tech.ccp.is/latest/markets/"+$marketregion+"/history/?type_id="+$typeid+"&datasource=tranquility"
        $itempricehistory = $Null
        $itempricehistory = Invoke-RestMethod -Uri $uri -Method Get -Headers $header -TimeoutSec 60
    
    
        if ($itempricehistory -eq $Null) { 
        [int]$retry = 0
        
        do {
        $retry += 1
        Start-Sleep -Seconds (10*$retry)
        $itempricehistory = Invoke-RestMethod -Uri $uri -Method Get -Headers $header -TimeoutSec 60
        } until ($retry -gt "2")  
        }
    
        if ($itempricehistory -eq $Null) { 
        Write-Output "Missing: $typeid $marketregion $MovingAverageDays" | Out-File "C:\temp\eveprices-log\test.txt" -Append
        }
    
            
        [decimal]$SMA = ($itempricehistory | Sort-Object date | select -last $MovingAverageDays | Measure-Object 'highest' -Average).Average
        $Multiplier = (2/($MovingAverageDays+1)) 
        $Close = ($itempricehistory | Sort-Object date | select -last 1).Average 
        $ItemMovingAverage = ($Close-$SMA)*$Multiplier+$SMA
        
        $ItemMovingAverage
        
    }
    

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
    
    
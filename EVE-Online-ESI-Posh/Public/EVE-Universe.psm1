
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
    $testresult = test-EVE-ESI-Result -result $result
    return (out-EVE-ESI -outformat $outformat -result $result)
}


function get-eve-universe-asteroid_belts  {
    Param(
        [ValidateSet("Tranquility","singularity")]
        [String]
        $datasource,
        [INT32]
        $asteroid_belt_id,
        [ValidateSet("PS","json")]
        [String]
        $outformat
    ) 
#   Example URI
#   https://esi.tech.ccp.is/latest/universe/asteroid_belts/11111111/?datasource=tranquility

    $uri = $baseUri+"latest/universe/asteroid_belts/"+$asteroid_belt_id+"/?Datasource="+$datasource
    $header = @{
        'Accept' = 'application/json'
    }

    $result = Invoke-WebRequest -Uri $uri -Method Get -Headers $header
    $testresult = test-EVE-ESI-Result -result $result
    return (out-EVE-ESI -outformat $outformat -result $result)
}


function get-eve-universe-bloodlines {
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
#   https://esi.tech.ccp.is/latest/universe/bloodlines/


    $uri = $baseUri+"latest/universe/bloodlines/?Datasource="+$datasource+"&language="+$language
    $header = @{
        'Accept' = 'application/json'
    }

    $result = Invoke-WebRequest -Uri $uri -Method Get -Headers $header
    $testresult = test-EVE-ESI-Result -result $result
    return (out-EVE-ESI -outformat $outformat -result $result)
}


function get-eve-universe-categories {
    Param(
        [ValidateSet("Tranquility","singularity")]
        [String]
        $datasource,
        [ValidateSet("PS","json")]
        [String]
        $outformat
    ) 
#   Example URI
#   https://esi.tech.ccp.is/latest/universe/categories/?datasource=tranquility


    $uri = $baseUri+"latest/universe/categories/?Datasource="+$datasource
    $header = @{
        'Accept' = 'application/json'
    }

    $result = Invoke-WebRequest -Uri $uri -Method Get -Headers $header
    $testresult = test-EVE-ESI-Result -result $result
    return (out-EVE-ESI -outformat $outformat -result $result)
}


function get-eve-universe-categories-details {
    Param(
        [ValidateSet("Tranquility","singularity")]
        [String]
        $datasource,
        [INT32]
        $category_id,
        [ValidateSet("en-us","ru","de","fr","ja","zh")]
        [String]
        $language,
        [ValidateSet("PS","json")]
        [String]
        $outformat
    ) 
#   Example URI
#   https://esi.tech.ccp.is/latest/universe/categories/91/?datasource=tranquility&language=en-us

    $uri = $baseUri+"latest/universe/categories/"+$category_id+"?Datasource="+$datasource+"&language="+$language
    $header = @{
        'Accept' = 'application/json'
    }

    $result = Invoke-WebRequest -Uri $uri -Method Get -Headers $header
    $testresult = test-EVE-ESI-Result -result $result
    return (out-EVE-ESI -outformat $outformat -result $result)
}


function get-eve-universe-constellations {
    Param(
        [ValidateSet("Tranquility","singularity")]
        [String]
        $datasource,
        [ValidateSet("PS","json")]
        [String]
        $outformat
    ) 
#   Example URI
#   https://esi.tech.ccp.is/latest/universe/constellations/?datasource=tranquility


    $uri = $baseUri+"latest/universe/constellations/?Datasource="+$datasource
    $header = @{
        'Accept' = 'application/json'
    }

    $result = Invoke-WebRequest -Uri $uri -Method Get -Headers $header
    $testresult = test-EVE-ESI-Result -result $result
    return (out-EVE-ESI -outformat $outformat -result $result)
}


function get-eve-universe-constellation-details {
    Param(
        [ValidateSet("Tranquility","singularity")]
        [String]
        $datasource,
        [INT32]
        $constellation_id,
        [ValidateSet("en-us","ru","de","fr","ja","zh")]
        [String]
        $language,
        [ValidateSet("PS","json")]
        [String]
        $outformat
    ) 
#   Example URI
#   https://esi.tech.ccp.is/latest/universe/constellations/21000314/?datasource=tranquility&language=en-us

    $uri = $baseUri+"latest/universe/constellations/"+$constellation_id+"?Datasource="+$datasource+"&language="+$language
    $header = @{
        'Accept' = 'application/json'
    }

    $result = Invoke-WebRequest -Uri $uri -Method Get -Headers $header
    $testresult = test-EVE-ESI-Result -result $result
    return (out-EVE-ESI -outformat $outformat -result $result)
}

function get-eve-universe-factions {
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
#   https://esi.tech.ccp.is/latest/universe/factions/?datasource=tranquility&language=en-us
    $uri = $baseUri+"latest/universe/factions/?Datasource="+$datasource+"&language="+$language
    $header = @{
        'Accept' = 'application/json'
    }

    $result = Invoke-WebRequest -Uri $uri -Method Get -Headers $header
    $testresult = test-EVE-ESI-Result -result $result
    return (out-EVE-ESI -outformat $outformat -result $result)
}





function get-eve-universe-graphics {
    Param(
        [ValidateSet("Tranquility","singularity")]
        [String]
        $datasource,
        [ValidateSet("PS","json")]
        [String]
        $outformat
    ) 
#   Example URI
#   https://esi.tech.ccp.is/latest/universe/graphics/?datasource=tranquility


    $uri = $baseUri+"latest/universe/graphics/?Datasource="+$datasource
    $header = @{
        'Accept' = 'application/json'
    }

    $result = Invoke-WebRequest -Uri $uri -Method Get -Headers $header
    $testresult = test-EVE-ESI-Result -result $result
    return (out-EVE-ESI -outformat $outformat -result $result)
}




function get-eve-universe-graphics-details {
    Param(
        [ValidateSet("Tranquility","singularity")]
        [String]
        $datasource,
        [INT32]
        $graphics_id,
        [ValidateSet("PS","json")]
        [String]
        $outformat
    ) 
#   Example URI
#   https://esi.tech.ccp.is/latest/universe/graphics/20505/?datasource=tranquility

    $uri = $baseUri+"latest/universe/graphics/"+$graphics_id+"?Datasource="+$datasource
    $header = @{
        'Accept' = 'application/json'
    }

    $result = Invoke-WebRequest -Uri $uri -Method Get -Headers $header
    $testresult = test-EVE-ESI-Result -result $result
    return (out-EVE-ESI -outformat $outformat -result $result)
}


function get-eve-universe-groups {
    Param(
        [ValidateSet("Tranquility","singularity")]
        [String]
        $datasource,
        [ValidateSet("PS","json")]
        [String]
        $outformat
    ) 
#   Example URI
#   https://esi.tech.ccp.is/latest/universe/groups/?datasource=tranquility&page=1

    [int]$Page = "1" 
    $uri = $baseUri+"latest/universe/groups/?Datasource="+$datasource+"&page="+$Page
    $header = @{
        'Accept' = 'application/json'
    }

    $result = Invoke-WebRequest -Uri $uri -Method Get -Headers $header
    test-EVE-ESI-Result -result $result

    if ($result.Headers.'X-Pages' -gt $Page) { 
        $temporaryResult = @()
        $temporaryResult += $result | convertfrom-json
        
        do { 
        $Page = $Page+1
        $uri = $baseUri+"latest/universe/groups/?Datasource="+$datasource+"&page="+$Page
        $result = Invoke-WebRequest -Uri $uri -Method Get -Headers $header
        test-EVE-ESI-Result -result $result
        $temporaryResult += $result | convertfrom-json
        } until ($result.Headers.'X-Pages' -eq $Page )

     
    }
    $result = $temporaryResult | select -Unique | Sort-Object | ConvertTo-Json
    return (out-EVE-ESI -outformat $outformat -result $result)
}


function get-eve-universe-group-details {
    Param(
        [ValidateSet("Tranquility","singularity")]
        [String]
        $datasource,
        [INT32]
        $group_id,
        [ValidateSet("en-us","ru","de","fr","ja","zh")]
        [String]
        $language,
        [ValidateSet("PS","json")]
        [String]
        $outformat
    ) 
#   Example URI
#   https://esi.tech.ccp.is/latest/universe/groups/1886/?datasource=tranquility&language=en-us

    $uri = $baseUri+"latest/universe/groups/"+$group_id+"/?Datasource="+$datasource+"&language="+$language
    $header = @{
        'Accept' = 'application/json'
    }

    $result = Invoke-WebRequest -Uri $uri -Method Get -Headers $header
    $testresult = test-EVE-ESI-Result -result $result
    return (out-EVE-ESI -outformat $outformat -result $result)
}

Get-Verb

function find-eve-universe-ids {
    Param(
        [ValidateSet("Tranquility","singularity")]
        [String]
        $datasource,
        [PSObject]
        $names,
        [ValidateSet("en-us","ru","de","fr","ja","zh")]
        [String]
        $language,
        [ValidateSet("PS","json")]
        [String]
        $outformat
    ) 
#   Example URI
#   https://esi.tech.ccp.is/latest/universe/groups/1886/?datasource=tranquility&language=en-us

    $uri = $baseUri+"latest/universe/ids/?Datasource="+$datasource+"&language="+$language
    $header = @{
        'Accept' = 'application/json'
    }


    $testing2 = New-Object System.Object

    $testing2 | Add-Member -MemberType NoteProperty -Name Names -Value "Vipeer" -Force
    $testing2 | ConvertTo-Json

    $postParams = @{names='vipeer'}
    Invoke-WebRequest -Uri $uri -Method POST -Body $postParams -ContentType "application/json" 
    Invoke-RestMethod -Method Post -Uri $uri -Body $postParams -ContentType "application/json" -Verbose

    Invoke-WebRequest -Uri $uri -Method Post -Headers $header  -Body ($testing2 | ConvertTo-Json)

    Invoke-WebRequest $uri -ContentType "application/json" -Method POST -Body "{ 'Names':'Vipeer', 'Names':'Ripeer'}"


    $result =   Invoke-WebRequest -Uri $uri -Method Post -Headers $header  -Body $parameters
    $testresult = test-EVE-ESI-Result -result $result
    return (out-EVE-ESI -outformat $outformat -result $result)
}


curl -X POST "https://esi.tech.ccp.is/latest/universe/ids/?datasource=tranquility&language=en-us" -H  "accept: application/json" -H  "Content-Type: application/json" -d "[  \"Ripeer\",\"Vipeer\"]"
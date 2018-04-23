


$ModSwagger = get-content 'C:\SwaggerSpecs\LatestTranq2.json' | ConvertFrom-Json
$ESIHost = $ModSwagger.host


$AllPathEndpoints = $ModSwagger.paths | get-member | where MemberType -eq "NoteProperty" 

$Teeest = foreach ($PathEndpoint in $AllPathEndpoints) { 

    $CurrentEndPoint = $ModSwagger.paths.($PathEndpoint.name)
    $Method = ($CurrentEndPoint | get-member | where MemberType -like NoteProperty).Name 
    $CurrentEndPointDetails = $ModSwagger.paths.($PathEndpoint.name).$Method

    $ESIName = ($PathEndpoint.Name).TrimStart("/").TrimEnd("/").replace("/"," ")
    $ESIName = (Get-Culture).TextInfo.ToTitleCase( $ESIName )
    $ESIFunctionName = $Method+"-EVE"+$ESIName.trim().replace(" ","").replace("{","").Replace("}","")

    $ESIParameters = foreach ($ESIParameter in $CurrentEndPointDetails.parameters) { 
        if ($ESIParameter.'$ref' -like "*#/parameters/*") { 
        $ModSwagger.parameters.$($ESIParameter.'$ref'.ToString().split("/")[-1])
        }
        else {$ESIParameter}
    } 

    $NewFunction = @{
    'FunctionName' = $ESIFunctionName 
    'ESIMethod' = $Method
    'ESIPath' = $PathEndpoint.Name
    'ESIParameters' = $ESIParameters
    'ESITags' = $CurrentEndPointDetails.tags
    'ESISummary' = $CurrentEndPointDetails.summary
    'ESIDescription' = $CurrentEndPointDetails.description
    'ESIOperationsID' = $CurrentEndPointDetails.operationId
    }
   New-Object -TypeName PSObject -ArgumentList $NewFunction

}


$NewFunction = ($Teeest | where ESITags -like "*Unive*" | select -Skip 1 -first 1)
$NewFunctionPSM1File = ($NewFunction.ESITags).ToString() +".psm1"
$NewFunction.ESIParameters | where required -eq $true



$NewESIFunctionFile = New-Item -ItemType File -Name ($($NewFunction.ESITags)+".psm1") -Force
Add-Content $NewESIFunctionFile "function $($NewFunction.FunctionName) { "
Add-Content $NewESIFunctionFile " "
Add-Content $NewESIFunctionFile "        Param( "




[int]$NewFunctionParamterNumber = "0"
foreach ($NewFunctionParameter in $NewFunction.ESIParameters){ 
    $NewFunctionParamterNumber = $NewFunctionParamterNumber+1

    # [Validateset]
    if ($NewFunctionParameter.enum -notlike "") { 
        $NewParamValidateSet = "[ValidateSet("+ $NewFunctionParameter.enum.join(",") + "])"
    Add-Content $NewESIFunctionFile "             $($NewParamValidateSet)"
    }   

    # [int32]
    if (($NewFunctionParameter).type -eq "integer") { 
    $NewParamType = "["+$(($NewFunctionParameter).format)+"]"
     Add-Content $NewESIFunctionFile "            $($NewParamType)"   
    }
    else { 
        $NewParamType = "["+$(($NewFunctionParameter).type)+"]"
        Add-Content $NewESIFunctionFile "            $($NewParamType)"   
    }

     # $parametername
     if ($NewFunctionParamterNumber -ne ($NewFunction.ESIParameters | Measure-Object).Count) { 
        $NewFunctionParameterName = "$" + $($NewFunctionParameter.name) + ","
     }
     else {
        $NewFunctionParameterName = "$" + $($NewFunctionParameter.name) 
     }
     Add-Content $NewESIFunctionFile "            $($NewFunctionParameterName)"  
}
Add-Content $NewESIFunctionFile "    ) "



function $($NewFunction.FunctionName) { 

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


}



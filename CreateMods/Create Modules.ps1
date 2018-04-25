


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
$NewESIFunctionFile = New-Item -ItemType File -Name ($($NewFunction.ESITags)+".psm1") -Force


# Build Function
Add-Content $NewESIFunctionFile "function $($NewFunction.FunctionName) { "
Add-Content $NewESIFunctionFile " "


# Build ParamBlock 
Add-Content $NewESIFunctionFile "        Param( "
[int]$NewFunctionParamterNumber = "0"
foreach ($NewFunctionParameter in $NewFunction.ESIParameters){ 
    $NewFunctionParamterNumber = $NewFunctionParamterNumber+1

    # [Parameter(Mandatory)]
    if ($NewFunctionParameter.required -eq $True) {
    Add-Content $NewESIFunctionFile '            [Parameter(Mandatory=$true)]'
    }

    # [Validateset]
    if ($NewFunctionParameter.Enum) {
    $NewParamValidateSet = '[ValidateSet("'+((($NewFunctionParameter).Enum).trim() -join '","')+'")]'
    Add-Content $NewESIFunctionFile "            $($NewParamValidateSet)"
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
     $NewFunctionParameterName = "$" + $($NewFunctionParameter.name -replace "-","_")

     if ( ($NewFunctionParameter.default | Measure-Object).count -gt 0 ) {
        $NewFunctionParameterName = $NewFunctionParameterName + ' = "'+ $NewFunctionParameter.default +'"'
     }

     if ($NewFunctionParamterNumber -ne ($NewFunction.ESIParameters | Measure-Object).Count) { 
        $NewFunctionParameterName = $NewFunctionParameterName + ","
     }

     Add-Content $NewESIFunctionFile "            $($NewFunctionParameterName)"  
}
Add-Content $NewESIFunctionFile "    ) #End of Param"
Add-Content $NewESIFunctionFile " "
Add-Content $NewESIFunctionFile "#  Example URI"
Add-Content $NewESIFunctionFile "#  https://esi.tech.ccp.is/latest$($NewFunction.ESIPath)"
Add-Content $NewESIFunctionFile " "

$TempURI = "https://esi.tech.ccp.is/latest$($NewFunction.ESIPath)" -replace "{","$" -replace "}",""
$newstring = '$URI' + ' = "' + $TempURI +'"'
Add-Content $NewESIFunctionFile $newstring




# Add Query Parameters 
# curl -X GET "https://esi.tech.ccp.is/latest/universe/asteroid_belts/11111/?datasource=tranquility&user_agent=111" -H  "accept: application/json"
if (($NewFunction.ESIParameters | where { $_.in -eq "query" -and $_.required -eq $true } | Measure-Object).count -gt 0) { $URI = $URI+"?" }
foreach ($RequiredParameter in $NewFunction.ESIParameters | where { $_.in -eq "query" -and $_.type -eq "string" } | select -first 1 ) {
    
    if ($RequiredParameter -ne $null) {  $URI = $URI+"($RequiredParameter.Name) = $"+$RequiredParameter.Name  }

    
    
    }



($Teeest | where { $_.ESIParameters.in -eq "query"}  | select -First 3).ESIParameters | where name -NotMatch "datasource|user_agent|x-user-agent" 



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



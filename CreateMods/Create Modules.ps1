


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
Add-Content $NewESIFunctionFile "<# "
Add-Content $NewESIFunctionFile ".SYNOPSIS"
Add-Content $NewESIFunctionFile $NewFunction.ESISummary
Add-Content $NewESIFunctionFile " "
Add-Content $NewESIFunctionFile ".DESCRIPTION"
Add-Content $NewESIFunctionFile $NewFunction.ESIDescription
Add-Content $NewESIFunctionFile " "
Add-Content $NewESIFunctionFile "#>"
Add-Content $NewESIFunctionFile " "

# Build ParamBlock 
Add-Content $NewESIFunctionFile "    Param( "

$Newstring = '            [string]'
Add-Content $NewESIFunctionFile $Newstring
$Newstring = '            $URI = "https://esi.tech.ccp.is/latest'+$($NewFunction.ESIPath)+'",'
Add-Content $NewESIFunctionFile $Newstring

[int]$NewFunctionParamterNumber = "0"
foreach ($NewFunctionParameter in $NewFunction.ESIParameters){ 
    $NewFunctionParamterNumber = $NewFunctionParamterNumber+1

    # [Parameter(Mandatory)]
    if ($NewFunctionParameter.required -eq $True) {
        Add-Content $NewESIFunctionFile ("            [Parameter(Mandatory=$"+"true, HelpMessage="+'"'+ $($NewFunctionParameter.description) +'")]') 
    }
    else {
        Add-Content $NewESIFunctionFile ("            [Parameter(Mandatory=$"+"false, HelpMessage="+'"'+ $($NewFunctionParameter.description) +'")]') 
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

$Newstring = '      $Method = "' + $NewFunction.ESIMethod + '"'
Add-Content $NewESIFunctionFile $newstring

#$TempURI = "$URI" -replace "{","$" -replace "}",""
#$newstring = '      $URI' + ' = "' + $TempURI +'"'
$Newstring = '      $URI = $URI -replace "{","$" -replace "}",""'
Add-Content $NewESIFunctionFile $newstring
Add-Content $NewESIFunctionFile " "
Add-Content $NewESIFunctionFile " "

# Add Query Parameters 
# curl -X GET "https://esi.tech.ccp.is/latest/universe/asteroid_belts/11111/?datasource=tranquility&user_agent=111" -H  "accept: application/json"


foreach ($RequiredParameter in $NewFunction.ESIParameters | where { $_.in -eq "query" }) {

    $newstring = "        if ($"+$($RequiredParameter.name).Trim() + ' -ne "") { '
    Add-Content $NewESIFunctionFile $newstring
        
        $newstring = "            if ($"+"URI.Contains('?') -eq $"+"false) {  "
        Add-Content $NewESIFunctionFile $newstring

        $newstring = '            $URI = $URI + "?" + "' + $($RequiredParameter.name).Trim() + '=" + $' + $($RequiredParameter.name).Trim() 
        Add-Content $NewESIFunctionFile $newstring
        Add-Content $NewESIFunctionFile '            }' 

        $newstring = '            elseif ($'+"URI.Contains('?') -eq $"+"True) {"  
        Add-Content $NewESIFunctionFile $newstring
 
        $newstring = '            $URI = $URI + "&" + "' + $($RequiredParameter.name).Trim() + '=" + $' + $($RequiredParameter.name).Trim() 
        Add-Content $NewESIFunctionFile $newstring
        Add-Content $NewESIFunctionFile "            }"
        Add-Content $NewESIFunctionFile "        }"
}

# Build Headers
if (($NewFunction.ESIParameters | where { $_.in -eq "header" } | Measure-Object).Count -gt 0) { 

    $Newstring = '        $Header = @{'
    Add-Content $NewESIFunctionFile $newstring

    foreach ($RequiredParameter in $NewFunction.ESIParameters | where { $_.in -eq "header" }) {
        $Newstring = '        '+"'"+$RequiredParameter.name +"'"+ ' = "$' + ($RequiredParameter.name -replace "-","_") +'"'
        Add-Content $NewESIFunctionFile $newstring
    }
    $Newstring = '        }'
    Add-Content $NewESIFunctionFile $newstring
}

# Build Body
if (($NewFunction.ESIParameters | where { $_.in -eq "body" } | Measure-Object).Count -gt 0) { 

    $Newstring = '        $Body = @{'
    Add-Content $NewESIFunctionFile $newstring

    foreach ($RequiredParameter in $NewFunction.ESIParameters | where { $_.in -eq "body" }) {

        $Newstring = '        '+"'"+$RequiredParameter.name +"'"+ ' = "$' + ($RequiredParameter.name -replace "-","_") +'"'
        Add-Content $NewESIFunctionFile $newstring
    }
    $Newstring = '        }'
    Add-Content $NewESIFunctionFile $newstring
}

# Replace Paths
foreach ($RequiredParameter in $NewFunction.ESIParameters | where { $_.in -eq "path" }) {
    $Newstring = ' '
    Add-Content $NewESIFunctionFile $newstring
    $newstring = "        if ($"+$($RequiredParameter.name).Trim() + ' -ne "") { '
    Add-Content $NewESIFunctionFile $newstring
        
        $newstring = '            $URI = $URI -replace ''\$'+$($RequiredParameter.name).Trim() +"',"+'"$'+$($RequiredParameter.name).Trim()+'"'
        Add-Content $NewESIFunctionFile $newstring
        $Newstring = '        }'
        Add-Content $NewESIFunctionFile $newstring
}

$newstring = ' '
Add-Content $NewESIFunctionFile $newstring

$newstring = '$invokecommandline = "-uri $uri"'
Add-Content $NewESIFunctionFile $newstring

$newstring = 'if (($header.'+"'"+'X-User-Agent'+"'"+') -ne "") { '
Add-Content $NewESIFunctionFile $newstring

$newstring = '$invokecommandline = $invokecommandline + " -headers $header"'
Add-Content $NewESIFunctionFile $newstring
$newstring = '}'
Add-Content $NewESIFunctionFile $newstring

$newstring = 'if ($body -ne $null) { '
Add-Content $NewESIFunctionFile $newstring
$newstring = '    $invokecommandline = $invokecommandline + " -body $body"'
Add-Content $NewESIFunctionFile $newstring
$newstring = '}'
Add-Content $NewESIFunctionFile $newstring

$newstring = '$invokecommandline = $invokecommandline + " -method $method"'
Add-Content $NewESIFunctionFile $newstring

$newstring = 'write-host $invokecommandline'
Add-Content $NewESIFunctionFile $newstring

# End of function 
$Newstring = '}'
Add-Content $NewESIFunctionFile $newstring







if (($NewFunction.ESIParameters | where { $_.in -eq "query" -and $_.required -eq $true } | Measure-Object).count -gt 0) { $URI = $URI+"?" }
foreach ($RequiredParameter in $NewFunction.ESIParameters | where { $_.in -eq "query" -and $_.type -eq "string" } | select -first 1 ) {
    
    if ($RequiredParameter -ne $null) {  $URI = $URI+"($RequiredParameter.Name) = $"+$RequiredParameter.Name  }

}



$Teeest | select -last 1

.ESIParameters | where schema -ne $null | select schema).schema


($Teeest | where { $_.ESIParameters.in -ne "query"}  | select -First 3).ESIParameters | where name -NotMatch "datasource|user_agent|x-user-agent" 



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



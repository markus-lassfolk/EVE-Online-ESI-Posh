Set-Location "$ENV:USERPROFILE\Documents\GitHub\EVE-Online-ESI-Posh"



$ModSwagger = Invoke-WebRequest -ContentType "application/json" -Uri https://esi.tech.ccp.is/latest/swagger.json?datasource=tranquility -Verbose | ConvertFrom-Json 
$ESIHost = $ModSwagger.host


$AllPathEndpoints = $ModSwagger.paths | get-member | where MemberType -eq "NoteProperty" 

$BuildFunctions = foreach ($PathEndpoint in $AllPathEndpoints) { 

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



($BuildFunctions).ESITags | select -Unique | Sort-Object | % { 

    $_
    $NewESIFunctionFile = New-Item -Path .\EVE-Online-ESI-Posh\Public -Name $(($_)+".psm1") -ItemType File -Force -verbose

    foreach ($NewFunction in $BuildFunctions | where ESITags -like "$_" ) {

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

    # [Type]
    if (($NewFunctionParameter).type -eq "integer") { 
    $NewParamType = "["+$(($NewFunctionParameter).format)+"]"
     Add-Content $NewESIFunctionFile "            $($NewParamType)"   
    }
    else { 
        $NewParamType = "["+$(($NewFunctionParameter).type)+"]"

        if ($NewParamType -eq "[]") {
            $NewParamType = "["+$(($NewFunctionParameter).schema.type)+"]"
        } 

        if ($NewParamType -ne "[]") {
            Add-Content $NewESIFunctionFile "            $($NewParamType)"   
        } 
    }

     # $parametername
     $NewFunctionParameterName = "$" + $($NewFunctionParameter.name -replace "-","_")

     if ( ($NewFunctionParameter.default | Measure-Object).count -gt 0 ) {

        if ($NewFunctionParameter.type -eq "boolean") { 
            Add-Content $NewESIFunctionFile '            [ValidateSet($True,$False)]'  
            #$NewFunctionParameterName = '$'+ $NewFunctionParameter.default  
        }
        
        $NewFunctionParameterName = ($NewFunctionParameterName + ' = "'+ $NewFunctionParameter.default +'"') -replace '"True"','$True' -replace '"False"','$false'

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

$newstring = '$URI = $URI -replace "$True","True" -replace "$False","False"'
Add-Content $NewESIFunctionFile $newstring

$newstring = 'invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body'
Add-Content $NewESIFunctionFile $newstring

# End of function 
$Newstring = '}'
Add-Content $NewESIFunctionFile $newstring
$Newstring = ' '
Add-Content $NewESIFunctionFile $newstring
$Newstring = ' '
Add-Content $NewESIFunctionFile $newstring

  }
}


Get-ChildItem .\EVE-Online-ESI-Posh\Public\*.psm1 | Import-Module -Force

get-EVEUniverseAncestries
get-EVESearch -categories character -search vipeer -strict $false







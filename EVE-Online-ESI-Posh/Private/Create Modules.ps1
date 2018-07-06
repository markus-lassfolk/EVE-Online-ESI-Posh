Set-Location "$ENV:USERPROFILE\Documents\GitHub\EVE-Online-ESI-Posh"



$ModSwagger = Invoke-WebRequest -ContentType "application/json" -Uri https://esi.tech.ccp.is/_latest/swagger.json?datasource=tranquility -Verbose | ConvertFrom-Json 
$ESIHost = $ModSwagger.host


$AllPathEndpoints = $ModSwagger.paths | get-member | where MemberType -eq "NoteProperty" 

$BuildFunctions = foreach ($PathEndpoint in $AllPathEndpoints) { 

    $CurrentEndPoint = $ModSwagger.paths.($PathEndpoint.name)
    $Methods = ($CurrentEndPoint | get-member | where MemberType -like NoteProperty).Name 

    foreach ($Method in $Methods) {
        $CurrentEndPointDetails = $ModSwagger.paths.($PathEndpoint.name).$Method

        $ESIName = ($PathEndpoint.Name).TrimStart("/").TrimEnd("/").replace("/"," ")
        $ESIName = (Get-Culture).TextInfo.ToTitleCase( $ESIName )

        $ESIFunctionName = $CurrentEndPointDetails.operationId -replace "$($Method)_","$($Method)-EVE"
    #    $ESIFunctionName = $Method+"-EVE"+$ESIName.trim().replace(" ","").replace("{","").Replace("}","")

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

}


($BuildFunctions).ESITags | select -Unique | Sort-Object | % { 

    $_
    $NewESIFunctionFile = New-Item -Path .\EVE-Online-ESI-Posh\Public -Name $(($_)+".psm1") -ItemType File -Force -verbose

    foreach ($NewFunction in $BuildFunctions | where ESITags -like "$_" | Sort-Object { $_.FunctionName } ) {

        # Build Function
        Add-Content $NewESIFunctionFile "function $($NewFunction.FunctionName) { "
        Add-Content $NewESIFunctionFile "<# "
        Add-Content $NewESIFunctionFile ".SYNOPSIS"
        Add-Content $NewESIFunctionFile $NewFunction.ESISummary
        Add-Content $NewESIFunctionFile ".DESCRIPTION"
        Add-Content $NewESIFunctionFile $NewFunction.ESIDescription
        Add-Content $NewESIFunctionFile "#>"

        # Build ParamBlock 
        Add-Content $NewESIFunctionFile "    Param( "

        $Newstring = '            [string]'
        Add-Content $NewESIFunctionFile $Newstring
        $Newstring = '            $URI = "https://esi.tech.ccp.is'+$($NewFunction.ESIPath)+'",'
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

            #if ($NewFunctionParamterNumber -ne ($NewFunction.ESIParameters | Measure-Object).Count) { 
                $NewFunctionParameterName = $NewFunctionParameterName + ","
            #}

            Add-Content $NewESIFunctionFile "            $($NewFunctionParameterName)"  
        }
        Add-Content $NewESIFunctionFile '            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]'
        Add-Content $NewESIFunctionFile '            [ValidateSet("PS","json","PSfull")]'
        Add-Content $NewESIFunctionFile '            $OutputType = "PS"'
        Add-Content $NewESIFunctionFile "    ) #End of Param"
        Add-Content $NewESIFunctionFile "    #  Example URI"
        Add-Content $NewESIFunctionFile "    #  https://esi.tech.ccp.is$($NewFunction.ESIPath)"

        $Newstring = '    $Method = "' + $NewFunction.ESIMethod + '"'
        Add-Content $NewESIFunctionFile $newstring

        #$TempURI = "$URI" -replace "{","$" -replace "}",""
        #$newstring = '    $URI' + ' = "' + $TempURI +'"'
        $Newstring = '    $URI = $URI -replace "{","$" -replace "}",""'
        Add-Content $NewESIFunctionFile $newstring
        Add-Content $NewESIFunctionFile " "

        # Add Query Parameters 
        # curl -X GET "https://esi.tech.ccp.is/latest/universe/asteroid_belts/11111/?datasource=tranquility&user_agent=111" -H  "accept: application/json"


        foreach ($RequiredParameter in $NewFunction.ESIParameters | where { $_.in -eq "query" }) {

            $newstring = "    if ($"+$($RequiredParameter.name).Trim() + ' -ne "") { '
            Add-Content $NewESIFunctionFile $newstring
                
            $newstring = "        if ($"+"URI.Contains('?') -eq $"+"false) {  "
            Add-Content $NewESIFunctionFile $newstring

            $newstring = '            $URI = $URI + "?" + "' + $($RequiredParameter.name).Trim() + '=" + $' + $($RequiredParameter.name).Trim() 
            Add-Content $NewESIFunctionFile $newstring
            Add-Content $NewESIFunctionFile '        }' 

            $newstring = '        elseif ($'+"URI.Contains('?') -eq $"+"True) {"  
            Add-Content $NewESIFunctionFile $newstring
    
            $newstring = '            $URI = $URI + "&" + "' + $($RequiredParameter.name).Trim() + '=" + $' + $($RequiredParameter.name).Trim() 
            Add-Content $NewESIFunctionFile $newstring
            Add-Content $NewESIFunctionFile "        }"
            Add-Content $NewESIFunctionFile "    }"
        }

        # Build Headers
        if (($NewFunction.ESIParameters | where { $_.in -eq "header" } | Measure-Object).Count -gt 0) { 

            $Newstring = '    $Header = @{'
            Add-Content $NewESIFunctionFile $newstring

            foreach ($RequiredParameter in $NewFunction.ESIParameters | where { $_.in -eq "header" }) {
                $Newstring = '        '+"'"+$RequiredParameter.name +"'"+ ' = "$' + ($RequiredParameter.name -replace "-","_") +'"'
                Add-Content $NewESIFunctionFile $newstring
            }
            $Newstring = '    }'
            Add-Content $NewESIFunctionFile $newstring
        }

        # Build Body
        if (($NewFunction.ESIParameters | where { $_.in -eq "body" } | Measure-Object).Count -gt 0) { 

            $Newstring = '    $Body = @{'
            Add-Content $NewESIFunctionFile $newstring

            foreach ($RequiredParameter in $NewFunction.ESIParameters | where { $_.in -eq "body" }) {

                $Newstring = '        '+"'"+$RequiredParameter.name +"'"+ ' = "$' + ($RequiredParameter.name -replace "-","_") +'"'
                Add-Content $NewESIFunctionFile $newstring
            }
            $Newstring = '    }'
            Add-Content $NewESIFunctionFile $newstring
        }

        # Replace Paths
        foreach ($RequiredParameter in $NewFunction.ESIParameters | where { $_.in -eq "path" }) {
            $Newstring = ' '
            Add-Content $NewESIFunctionFile $newstring
            $newstring = "    if ($"+$($RequiredParameter.name).Trim() + ' -ne "") { '
            Add-Content $NewESIFunctionFile $newstring
                
                $newstring = '        $URI = $URI -replace ''\$'+$($RequiredParameter.name).Trim() +"',"+'"$'+$($RequiredParameter.name).Trim()+'"'
                Add-Content $NewESIFunctionFile $newstring
                $Newstring = '    }'
                Add-Content $NewESIFunctionFile $newstring
        }

        $newstring = '    $URI = $URI -replace "$True","True" -replace "$False","False"'
        Add-Content $NewESIFunctionFile $newstring

        $newstring = '    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType' 
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





$AllPathEndpoints


$BuildFunctions | where FunctionName -like "*1*" | select -first 1


$ModSwagger = Invoke-WebRequest -ContentType "application/json" -Uri https://esi.tech.ccp.is/_latest/swagger.json?datasource=tranquility -Verbose | ConvertFrom-Json 
$ESIHost = $ModSwagger.host

$AllPathEndpoints = $ModSwagger.paths | get-member | where MemberType -eq "NoteProperty" 


$BuildFunctions3 = foreach ($PathEndpoint in $AllPathEndpoints | where name -Match "/v1/alliances/{alliance_id}/corporations/|/v1/characters/{character_id}/mail/" ) { 

    $CurrentEndPoint = $ModSwagger.paths.($PathEndpoint.name)
    $Methods = ($CurrentEndPoint | get-member | where MemberType -like NoteProperty).Name 

    foreach ($Method in $Methods) {
        $CurrentEndPointDetails = $ModSwagger.paths.($PathEndpoint.name).$Method

        $ESIName = ($PathEndpoint.Name).TrimStart("/").TrimEnd("/").replace("/"," ")
        $ESIName = (Get-Culture).TextInfo.ToTitleCase( $ESIName )

        $ESIFunctionName = $CurrentEndPointDetails.operationId -replace "$($Method)_","$($Method)-EVE"
    #    $ESIFunctionName = $Method+"-EVE"+$ESIName.trim().replace(" ","").replace("{","").Replace("}","")

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
}


$BuildFunctions2 | where FunctionName -like ""

$AllPathEndpoints | where name -Match "/v1/alliances/{alliance_id}/corporations/|/v1/characters/{character_id}/mail/" 

$AllPathEndpoints | where name -eq "/v1/characters/{character_id}/mail/" 

$ModSwagger.paths.'/v1/characters/{character_id}/mail/'.get

where name -eq "/v1/characters/{character_id}/mail/" 
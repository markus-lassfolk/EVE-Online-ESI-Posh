function delete-EVEcharacters_character_id_fittings_fitting_id {
<#
.SYNOPSIS
Delete fitting
.DESCRIPTION
Delete a fitting from a character

---

#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/characters/{character_id}/fittings/{fitting_id}/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE character ID")]
            [int32]
            $character_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$true, HelpMessage="ID for a fitting of this character")]
            [int32]
            $fitting_id,
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v1/characters/{character_id}/fittings/{fitting_id}/
    $Method = "delete"
    $URI = $URI -replace "{","$" -replace "}",""

    if ($datasource -ne "") {
        if ($URI.Contains('?') -eq $false) {
            $URI = $URI + "?" + "datasource=" + $datasource
        }
        elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "datasource=" + $datasource
        }
    }
    if ($token -ne "") {
        if ($URI.Contains('?') -eq $false) {
            $URI = $URI + "?" + "token=" + $token
        }
        elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "token=" + $token
        }
    }

    if ($character_id -ne "") {
        $URI = $URI -replace '\$character_id',"$character_id"
    }

    if ($fitting_id -ne "") {
        $URI = $URI -replace '\$fitting_id',"$fitting_id"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function delete-EVEcharacters_character_id_fittings_fitting_id


function get-EVEcharacters_character_id_fittings {
<#
.SYNOPSIS
Get fittings
.DESCRIPTION
Return fittings of a character

---

This route is cached for up to 300 seconds
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v2/characters/{character_id}/fittings/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE character ID")]
            [int32]
            $character_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v2/characters/{character_id}/fittings/
    $Method = "get"
    $URI = $URI -replace "{","$" -replace "}",""

    if ($datasource -ne "") {
        if ($URI.Contains('?') -eq $false) {
            $URI = $URI + "?" + "datasource=" + $datasource
        }
        elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "datasource=" + $datasource
        }
    }
    if ($token -ne "") {
        if ($URI.Contains('?') -eq $false) {
            $URI = $URI + "?" + "token=" + $token
        }
        elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "token=" + $token
        }
    }
    $Header = @{
        'If-None-Match' = "$If_None_Match"
    }

    if ($character_id -ne "") {
        $URI = $URI -replace '\$character_id',"$character_id"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEcharacters_character_id_fittings


function post-EVEcharacters_character_id_fittings {
<#
.SYNOPSIS
Create fitting
.DESCRIPTION
Save a new fitting for a character

---

#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v2/characters/{character_id}/fittings/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE character ID")]
            [int32]
            $character_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$true, HelpMessage="Details about the new fitting")]
            [object]
            $fitting,
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v2/characters/{character_id}/fittings/
    $Method = "post"
    $URI = $URI -replace "{","$" -replace "}",""

    if ($datasource -ne "") {
        if ($URI.Contains('?') -eq $false) {
            $URI = $URI + "?" + "datasource=" + $datasource
        }
        elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "datasource=" + $datasource
        }
    }
    if ($token -ne "") {
        if ($URI.Contains('?') -eq $false) {
            $URI = $URI + "?" + "token=" + $token
        }
        elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "token=" + $token
        }
    }
    $Body = @{
        'fitting' = "$fitting"
    }

    if ($character_id -ne "") {
        $URI = $URI -replace '\$character_id',"$character_id"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function post-EVEcharacters_character_id_fittings



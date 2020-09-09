function get-EVEcharacters_character_id_clones {
<#
.SYNOPSIS
Get clones
.DESCRIPTION
A list of the character's clones

---

This route is cached for up to 120 seconds
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v3/characters/{character_id}/clones/",
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
    #  https://esi.evetech.net/v3/characters/{character_id}/clones/
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
Export-ModuleMember -Function get-EVEcharacters_character_id_clones


function get-EVEcharacters_character_id_implants {
<#
.SYNOPSIS
Get active implants
.DESCRIPTION
Return implants on the active clone of a character

---

This route is cached for up to 120 seconds
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/characters/{character_id}/implants/",
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
    #  https://esi.evetech.net/v1/characters/{character_id}/implants/
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
Export-ModuleMember -Function get-EVEcharacters_character_id_implants



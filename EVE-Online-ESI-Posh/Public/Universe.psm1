function get-EVEuniverse_ancestries {
<#
.SYNOPSIS
Get ancestries
.DESCRIPTION
Get all character ancestries

---

This route expires daily at 11:05
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/universe/ancestries/",
            [Parameter(Mandatory=$false, HelpMessage="Language to use in the response")]
            [ValidateSet("en","en-us","de","fr","ja","ru","zh","ko","es")]
            [string]
            $Accept_Language = "en",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Language to use in the response, takes precedence over Accept-Language")]
            [ValidateSet("en","en-us","de","fr","ja","ru","zh","ko","es")]
            [string]
            $language = "en",
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v1/universe/ancestries/
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
    if ($language -ne "") {
        if ($URI.Contains('?') -eq $false) {
            $URI = $URI + "?" + "language=" + $language
        }
        elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "language=" + $language
        }
    }
    $Header = @{
        'Accept-Language' = "$Accept_Language"
        'If-None-Match' = "$If_None_Match"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEuniverse_ancestries


function get-EVEuniverse_asteroid_belts_asteroid_belt_id {
<#
.SYNOPSIS
Get asteroid belt information
.DESCRIPTION
Get information on an asteroid belt

---

This route expires daily at 11:05
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/universe/asteroid_belts/{asteroid_belt_id}/",
            [Parameter(Mandatory=$true, HelpMessage="asteroid_belt_id integer")]
            [int32]
            $asteroid_belt_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v1/universe/asteroid_belts/{asteroid_belt_id}/
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
    $Header = @{
        'If-None-Match' = "$If_None_Match"
    }

    if ($asteroid_belt_id -ne "") {
        $URI = $URI -replace '\$asteroid_belt_id',"$asteroid_belt_id"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEuniverse_asteroid_belts_asteroid_belt_id


function get-EVEuniverse_bloodlines {
<#
.SYNOPSIS
Get bloodlines
.DESCRIPTION
Get a list of bloodlines

---

This route expires daily at 11:05
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/universe/bloodlines/",
            [Parameter(Mandatory=$false, HelpMessage="Language to use in the response")]
            [ValidateSet("en","en-us","de","fr","ja","ru","zh","ko","es")]
            [string]
            $Accept_Language = "en",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Language to use in the response, takes precedence over Accept-Language")]
            [ValidateSet("en","en-us","de","fr","ja","ru","zh","ko","es")]
            [string]
            $language = "en",
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v1/universe/bloodlines/
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
    if ($language -ne "") {
        if ($URI.Contains('?') -eq $false) {
            $URI = $URI + "?" + "language=" + $language
        }
        elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "language=" + $language
        }
    }
    $Header = @{
        'Accept-Language' = "$Accept_Language"
        'If-None-Match' = "$If_None_Match"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEuniverse_bloodlines


function get-EVEuniverse_categories {
<#
.SYNOPSIS
Get item categories
.DESCRIPTION
Get a list of item categories

---

This route expires daily at 11:05
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/universe/categories/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v1/universe/categories/
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
    $Header = @{
        'If-None-Match' = "$If_None_Match"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEuniverse_categories


function get-EVEuniverse_categories_category_id {
<#
.SYNOPSIS
Get item category information
.DESCRIPTION
Get information of an item category

---

This route expires daily at 11:05
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/universe/categories/{category_id}/",
            [Parameter(Mandatory=$false, HelpMessage="Language to use in the response")]
            [ValidateSet("en","en-us","de","fr","ja","ru","zh","ko","es")]
            [string]
            $Accept_Language = "en",
            [Parameter(Mandatory=$true, HelpMessage="An Eve item category ID")]
            [int32]
            $category_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Language to use in the response, takes precedence over Accept-Language")]
            [ValidateSet("en","en-us","de","fr","ja","ru","zh","ko","es")]
            [string]
            $language = "en",
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v1/universe/categories/{category_id}/
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
    if ($language -ne "") {
        if ($URI.Contains('?') -eq $false) {
            $URI = $URI + "?" + "language=" + $language
        }
        elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "language=" + $language
        }
    }
    $Header = @{
        'Accept-Language' = "$Accept_Language"
        'If-None-Match' = "$If_None_Match"
    }

    if ($category_id -ne "") {
        $URI = $URI -replace '\$category_id',"$category_id"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEuniverse_categories_category_id


function get-EVEuniverse_constellations {
<#
.SYNOPSIS
Get constellations
.DESCRIPTION
Get a list of constellations

---

This route expires daily at 11:05
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/universe/constellations/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v1/universe/constellations/
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
    $Header = @{
        'If-None-Match' = "$If_None_Match"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEuniverse_constellations


function get-EVEuniverse_constellations_constellation_id {
<#
.SYNOPSIS
Get constellation information
.DESCRIPTION
Get information on a constellation

---

This route expires daily at 11:05
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/universe/constellations/{constellation_id}/",
            [Parameter(Mandatory=$false, HelpMessage="Language to use in the response")]
            [ValidateSet("en","en-us","de","fr","ja","ru","zh","ko","es")]
            [string]
            $Accept_Language = "en",
            [Parameter(Mandatory=$true, HelpMessage="constellation_id integer")]
            [int32]
            $constellation_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Language to use in the response, takes precedence over Accept-Language")]
            [ValidateSet("en","en-us","de","fr","ja","ru","zh","ko","es")]
            [string]
            $language = "en",
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v1/universe/constellations/{constellation_id}/
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
    if ($language -ne "") {
        if ($URI.Contains('?') -eq $false) {
            $URI = $URI + "?" + "language=" + $language
        }
        elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "language=" + $language
        }
    }
    $Header = @{
        'Accept-Language' = "$Accept_Language"
        'If-None-Match' = "$If_None_Match"
    }

    if ($constellation_id -ne "") {
        $URI = $URI -replace '\$constellation_id',"$constellation_id"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEuniverse_constellations_constellation_id


function get-EVEuniverse_factions {
<#
.SYNOPSIS
Get factions
.DESCRIPTION
Get a list of factions

---

This route expires daily at 11:05
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v2/universe/factions/",
            [Parameter(Mandatory=$false, HelpMessage="Language to use in the response")]
            [ValidateSet("en","en-us","de","fr","ja","ru","zh","ko","es")]
            [string]
            $Accept_Language = "en",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Language to use in the response, takes precedence over Accept-Language")]
            [ValidateSet("en","en-us","de","fr","ja","ru","zh","ko","es")]
            [string]
            $language = "en",
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v2/universe/factions/
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
    if ($language -ne "") {
        if ($URI.Contains('?') -eq $false) {
            $URI = $URI + "?" + "language=" + $language
        }
        elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "language=" + $language
        }
    }
    $Header = @{
        'Accept-Language' = "$Accept_Language"
        'If-None-Match' = "$If_None_Match"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEuniverse_factions


function get-EVEuniverse_graphics {
<#
.SYNOPSIS
Get graphics
.DESCRIPTION
Get a list of graphics

---

This route expires daily at 11:05
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/universe/graphics/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v1/universe/graphics/
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
    $Header = @{
        'If-None-Match' = "$If_None_Match"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEuniverse_graphics


function get-EVEuniverse_graphics_graphic_id {
<#
.SYNOPSIS
Get graphic information
.DESCRIPTION
Get information on a graphic

---

This route expires daily at 11:05
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/universe/graphics/{graphic_id}/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$true, HelpMessage="graphic_id integer")]
            [int32]
            $graphic_id,
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v1/universe/graphics/{graphic_id}/
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
    $Header = @{
        'If-None-Match' = "$If_None_Match"
    }

    if ($graphic_id -ne "") {
        $URI = $URI -replace '\$graphic_id',"$graphic_id"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEuniverse_graphics_graphic_id


function get-EVEuniverse_groups {
<#
.SYNOPSIS
Get item groups
.DESCRIPTION
Get a list of item groups

---

This route expires daily at 11:05
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/universe/groups/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Which page of results to return")]
            [int32]
            $page = "1",
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v1/universe/groups/
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
    if ($page -ne "") {
        if ($URI.Contains('?') -eq $false) {
            $URI = $URI + "?" + "page=" + $page
        }
        elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "page=" + $page
        }
    }
    $Header = @{
        'If-None-Match' = "$If_None_Match"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEuniverse_groups


function get-EVEuniverse_groups_group_id {
<#
.SYNOPSIS
Get item group information
.DESCRIPTION
Get information on an item group

---

This route expires daily at 11:05
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/universe/groups/{group_id}/",
            [Parameter(Mandatory=$false, HelpMessage="Language to use in the response")]
            [ValidateSet("en","en-us","de","fr","ja","ru","zh","ko","es")]
            [string]
            $Accept_Language = "en",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$true, HelpMessage="An Eve item group ID")]
            [int32]
            $group_id,
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Language to use in the response, takes precedence over Accept-Language")]
            [ValidateSet("en","en-us","de","fr","ja","ru","zh","ko","es")]
            [string]
            $language = "en",
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v1/universe/groups/{group_id}/
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
    if ($language -ne "") {
        if ($URI.Contains('?') -eq $false) {
            $URI = $URI + "?" + "language=" + $language
        }
        elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "language=" + $language
        }
    }
    $Header = @{
        'Accept-Language' = "$Accept_Language"
        'If-None-Match' = "$If_None_Match"
    }

    if ($group_id -ne "") {
        $URI = $URI -replace '\$group_id',"$group_id"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEuniverse_groups_group_id


function get-EVEuniverse_moons_moon_id {
<#
.SYNOPSIS
Get moon information
.DESCRIPTION
Get information on a moon

---

This route expires daily at 11:05
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/universe/moons/{moon_id}/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$true, HelpMessage="moon_id integer")]
            [int32]
            $moon_id,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v1/universe/moons/{moon_id}/
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
    $Header = @{
        'If-None-Match' = "$If_None_Match"
    }

    if ($moon_id -ne "") {
        $URI = $URI -replace '\$moon_id',"$moon_id"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEuniverse_moons_moon_id


function get-EVEuniverse_planets_planet_id {
<#
.SYNOPSIS
Get planet information
.DESCRIPTION
Get information on a planet

---

This route expires daily at 11:05
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/universe/planets/{planet_id}/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$true, HelpMessage="planet_id integer")]
            [int32]
            $planet_id,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v1/universe/planets/{planet_id}/
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
    $Header = @{
        'If-None-Match' = "$If_None_Match"
    }

    if ($planet_id -ne "") {
        $URI = $URI -replace '\$planet_id',"$planet_id"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEuniverse_planets_planet_id


function get-EVEuniverse_races {
<#
.SYNOPSIS
Get character races
.DESCRIPTION
Get a list of character races

---

This route expires daily at 11:05
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/universe/races/",
            [Parameter(Mandatory=$false, HelpMessage="Language to use in the response")]
            [ValidateSet("en","en-us","de","fr","ja","ru","zh","ko","es")]
            [string]
            $Accept_Language = "en",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Language to use in the response, takes precedence over Accept-Language")]
            [ValidateSet("en","en-us","de","fr","ja","ru","zh","ko","es")]
            [string]
            $language = "en",
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v1/universe/races/
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
    if ($language -ne "") {
        if ($URI.Contains('?') -eq $false) {
            $URI = $URI + "?" + "language=" + $language
        }
        elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "language=" + $language
        }
    }
    $Header = @{
        'Accept-Language' = "$Accept_Language"
        'If-None-Match' = "$If_None_Match"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEuniverse_races


function get-EVEuniverse_regions {
<#
.SYNOPSIS
Get regions
.DESCRIPTION
Get a list of regions

---

This route expires daily at 11:05
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/universe/regions/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v1/universe/regions/
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
    $Header = @{
        'If-None-Match' = "$If_None_Match"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEuniverse_regions


function get-EVEuniverse_regions_region_id {
<#
.SYNOPSIS
Get region information
.DESCRIPTION
Get information on a region

---

This route expires daily at 11:05
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/universe/regions/{region_id}/",
            [Parameter(Mandatory=$false, HelpMessage="Language to use in the response")]
            [ValidateSet("en","en-us","de","fr","ja","ru","zh","ko","es")]
            [string]
            $Accept_Language = "en",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Language to use in the response, takes precedence over Accept-Language")]
            [ValidateSet("en","en-us","de","fr","ja","ru","zh","ko","es")]
            [string]
            $language = "en",
            [Parameter(Mandatory=$true, HelpMessage="region_id integer")]
            [int32]
            $region_id,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v1/universe/regions/{region_id}/
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
    if ($language -ne "") {
        if ($URI.Contains('?') -eq $false) {
            $URI = $URI + "?" + "language=" + $language
        }
        elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "language=" + $language
        }
    }
    $Header = @{
        'Accept-Language' = "$Accept_Language"
        'If-None-Match' = "$If_None_Match"
    }

    if ($region_id -ne "") {
        $URI = $URI -replace '\$region_id',"$region_id"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEuniverse_regions_region_id


function get-EVEuniverse_stargates_stargate_id {
<#
.SYNOPSIS
Get stargate information
.DESCRIPTION
Get information on a stargate

---

This route expires daily at 11:05
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/universe/stargates/{stargate_id}/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$true, HelpMessage="stargate_id integer")]
            [int32]
            $stargate_id,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v1/universe/stargates/{stargate_id}/
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
    $Header = @{
        'If-None-Match' = "$If_None_Match"
    }

    if ($stargate_id -ne "") {
        $URI = $URI -replace '\$stargate_id',"$stargate_id"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEuniverse_stargates_stargate_id


function get-EVEuniverse_stars_star_id {
<#
.SYNOPSIS
Get star information
.DESCRIPTION
Get information on a star

---

This route expires daily at 11:05
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/universe/stars/{star_id}/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$true, HelpMessage="star_id integer")]
            [int32]
            $star_id,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v1/universe/stars/{star_id}/
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
    $Header = @{
        'If-None-Match' = "$If_None_Match"
    }

    if ($star_id -ne "") {
        $URI = $URI -replace '\$star_id',"$star_id"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEuniverse_stars_star_id


function get-EVEuniverse_stations_station_id {
<#
.SYNOPSIS
Get station information
.DESCRIPTION
Get information on a station

---

This route expires daily at 11:05
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v2/universe/stations/{station_id}/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$true, HelpMessage="station_id integer")]
            [int32]
            $station_id,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v2/universe/stations/{station_id}/
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
    $Header = @{
        'If-None-Match' = "$If_None_Match"
    }

    if ($station_id -ne "") {
        $URI = $URI -replace '\$station_id',"$station_id"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEuniverse_stations_station_id


function get-EVEuniverse_structures {
<#
.SYNOPSIS
List all public structures
.DESCRIPTION
List all public structures

---

This route is cached for up to 3600 seconds
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/universe/structures/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="Only list public structures that have this service online")]
            [ValidateSet("market","manufacturing_basic")]
            [string]
            $filter,
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v1/universe/structures/
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
    if ($filter -ne "") {
        if ($URI.Contains('?') -eq $false) {
            $URI = $URI + "?" + "filter=" + $filter
        }
        elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "filter=" + $filter
        }
    }
    $Header = @{
        'If-None-Match' = "$If_None_Match"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEuniverse_structures


function get-EVEuniverse_structures_structure_id {
<#
.SYNOPSIS
Get structure information
.DESCRIPTION
Returns information on requested structure if you are on the ACL. Otherwise, returns "Forbidden" for all inputs.

---

This route is cached for up to 3600 seconds
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v2/universe/structures/{structure_id}/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$true, HelpMessage="An Eve structure ID")]
            [int64]
            $structure_id,
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v2/universe/structures/{structure_id}/
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

    if ($structure_id -ne "") {
        $URI = $URI -replace '\$structure_id',"$structure_id"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEuniverse_structures_structure_id


function get-EVEuniverse_system_jumps {
<#
.SYNOPSIS
Get system jumps
.DESCRIPTION
Get the number of jumps in solar systems within the last hour ending at the timestamp of the Last-Modified header, excluding wormhole space. Only systems with jumps will be listed

---

This route is cached for up to 3600 seconds
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/universe/system_jumps/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v1/universe/system_jumps/
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
    $Header = @{
        'If-None-Match' = "$If_None_Match"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEuniverse_system_jumps


function get-EVEuniverse_system_kills {
<#
.SYNOPSIS
Get system kills
.DESCRIPTION
Get the number of ship, pod and NPC kills per solar system within the last hour ending at the timestamp of the Last-Modified header, excluding wormhole space. Only systems with kills will be listed

---

This route is cached for up to 3600 seconds
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v2/universe/system_kills/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v2/universe/system_kills/
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
    $Header = @{
        'If-None-Match' = "$If_None_Match"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEuniverse_system_kills


function get-EVEuniverse_systems {
<#
.SYNOPSIS
Get solar systems
.DESCRIPTION
Get a list of solar systems

---

This route expires daily at 11:05
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/universe/systems/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v1/universe/systems/
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
    $Header = @{
        'If-None-Match' = "$If_None_Match"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEuniverse_systems


function get-EVEuniverse_systems_system_id {
<#
.SYNOPSIS
Get solar system information
.DESCRIPTION
Get information on a solar system.

---

This route expires daily at 11:05
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v4/universe/systems/{system_id}/",
            [Parameter(Mandatory=$false, HelpMessage="Language to use in the response")]
            [ValidateSet("en","en-us","de","fr","ja","ru","zh","ko","es")]
            [string]
            $Accept_Language = "en",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Language to use in the response, takes precedence over Accept-Language")]
            [ValidateSet("en","en-us","de","fr","ja","ru","zh","ko","es")]
            [string]
            $language = "en",
            [Parameter(Mandatory=$true, HelpMessage="system_id integer")]
            [int32]
            $system_id,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v4/universe/systems/{system_id}/
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
    if ($language -ne "") {
        if ($URI.Contains('?') -eq $false) {
            $URI = $URI + "?" + "language=" + $language
        }
        elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "language=" + $language
        }
    }
    $Header = @{
        'Accept-Language' = "$Accept_Language"
        'If-None-Match' = "$If_None_Match"
    }

    if ($system_id -ne "") {
        $URI = $URI -replace '\$system_id',"$system_id"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEuniverse_systems_system_id


function get-EVEuniverse_types {
<#
.SYNOPSIS
Get types
.DESCRIPTION
Get a list of type ids

---

This route expires daily at 11:05
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/universe/types/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Which page of results to return")]
            [int32]
            $page = "1",
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v1/universe/types/
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
    if ($page -ne "") {
        if ($URI.Contains('?') -eq $false) {
            $URI = $URI + "?" + "page=" + $page
        }
        elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "page=" + $page
        }
    }
    $Header = @{
        'If-None-Match' = "$If_None_Match"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEuniverse_types


function get-EVEuniverse_types_type_id {
<#
.SYNOPSIS
Get type information
.DESCRIPTION
Get information on a type

---

This route expires daily at 11:05
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v3/universe/types/{type_id}/",
            [Parameter(Mandatory=$false, HelpMessage="Language to use in the response")]
            [ValidateSet("en","en-us","de","fr","ja","ru","zh","ko","es")]
            [string]
            $Accept_Language = "en",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Language to use in the response, takes precedence over Accept-Language")]
            [ValidateSet("en","en-us","de","fr","ja","ru","zh","ko","es")]
            [string]
            $language = "en",
            [Parameter(Mandatory=$true, HelpMessage="An Eve item type ID")]
            [int32]
            $type_id,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v3/universe/types/{type_id}/
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
    if ($language -ne "") {
        if ($URI.Contains('?') -eq $false) {
            $URI = $URI + "?" + "language=" + $language
        }
        elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "language=" + $language
        }
    }
    $Header = @{
        'Accept-Language' = "$Accept_Language"
        'If-None-Match' = "$If_None_Match"
    }

    if ($type_id -ne "") {
        $URI = $URI -replace '\$type_id',"$type_id"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEuniverse_types_type_id


function post-EVEuniverse_ids {
<#
.SYNOPSIS
Bulk names to IDs
.DESCRIPTION
Resolve a set of names to IDs in the following categories: agents, alliances, characters, constellations, corporations factions, inventory_types, regions, stations, and systems. Only exact matches will be returned. All names searched for are cached for 12 hours

---

#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/universe/ids/",
            [Parameter(Mandatory=$false, HelpMessage="Language to use in the response")]
            [ValidateSet("en","en-us","de","fr","ja","ru","zh","ko","es")]
            [string]
            $Accept_Language = "en",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="Language to use in the response, takes precedence over Accept-Language")]
            [ValidateSet("en","en-us","de","fr","ja","ru","zh","ko","es")]
            [string]
            $language = "en",
            [Parameter(Mandatory=$true, HelpMessage="The names to resolve")]
            [array]
            $names,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v1/universe/ids/
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
    if ($language -ne "") {
        if ($URI.Contains('?') -eq $false) {
            $URI = $URI + "?" + "language=" + $language
        }
        elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "language=" + $language
        }
    }
    $Header = @{
        'Accept-Language' = "$Accept_Language"
    }
    $Body = @{
        'names' = "$names"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function post-EVEuniverse_ids


function post-EVEuniverse_names {
<#
.SYNOPSIS
Get names and categories for a set of IDs
.DESCRIPTION
Resolve a set of IDs to names and categories. Supported ID's for resolving are: Characters, Corporations, Alliances, Stations, Solar Systems, Constellations, Regions, Types, Factions

---

#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v3/universe/names/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$true, HelpMessage="The ids to resolve")]
            [array]
            $ids,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v3/universe/names/
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
    $Body = @{
        'ids' = "$ids"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function post-EVEuniverse_names



function get-EVEcharacters_character_id_search {
<#
.SYNOPSIS
Search on a string
.DESCRIPTION
Search for entities that match a given sub-string.

---

This route is cached for up to 3600 seconds
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v3/characters/{character_id}/search/",
            [Parameter(Mandatory=$false, HelpMessage="Language to use in the response")]
            [ValidateSet("en","en-us","de","fr","ja","ru","zh","ko","es")]
            [string]
            $Accept_Language = "en",
            [Parameter(Mandatory=$true, HelpMessage="Type of entities to search for")]
            [array]
            $categories,
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
            [Parameter(Mandatory=$false, HelpMessage="Language to use in the response, takes precedence over Accept-Language")]
            [ValidateSet("en","en-us","de","fr","ja","ru","zh","ko","es")]
            [string]
            $language = "en",
            [Parameter(Mandatory=$true, HelpMessage="The string to search on")]
            [string]
            $search,
            [Parameter(Mandatory=$false, HelpMessage="Whether the search should be a strict match")]
            [boolean]
            [ValidateSet($True,$False)]
            $strict = $false,
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v3/characters/{character_id}/search/
    $Method = "get"
    $URI = $URI -replace "{","$" -replace "}",""

    if ($categories -ne "") {
        if ($URI.Contains('?') -eq $false) {
            $URI = $URI + "?" + "categories=" + $categories
        }
        elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "categories=" + $categories
        }
    }
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
    if ($search -ne "") {
        if ($URI.Contains('?') -eq $false) {
            $URI = $URI + "?" + "search=" + $search
        }
        elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "search=" + $search
        }
    }
    if ($strict -ne "") {
        if ($URI.Contains('?') -eq $false) {
            $URI = $URI + "?" + "strict=" + $strict
        }
        elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "strict=" + $strict
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
        'Accept-Language' = "$Accept_Language"
        'If-None-Match' = "$If_None_Match"
    }

    if ($character_id -ne "") {
        $URI = $URI -replace '\$character_id',"$character_id"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEcharacters_character_id_search


function get-EVEsearch {
<#
.SYNOPSIS
Search on a string
.DESCRIPTION
Search for entities that match a given sub-string.

---

This route is cached for up to 3600 seconds
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v2/search/",
            [Parameter(Mandatory=$false, HelpMessage="Language to use in the response")]
            [ValidateSet("en","en-us","de","fr","ja","ru","zh","ko","es")]
            [string]
            $Accept_Language = "en",
            [Parameter(Mandatory=$true, HelpMessage="Type of entities to search for")]
            [array]
            $categories,
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
            [Parameter(Mandatory=$true, HelpMessage="The string to search on")]
            [string]
            $search,
            [Parameter(Mandatory=$false, HelpMessage="Whether the search should be a strict match")]
            [boolean]
            [ValidateSet($True,$False)]
            $strict = $false,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v2/search/
    $Method = "get"
    $URI = $URI -replace "{","$" -replace "}",""

    if ($categories -ne "") {
        if ($URI.Contains('?') -eq $false) {
            $URI = $URI + "?" + "categories=" + $categories
        }
        elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "categories=" + $categories
        }
    }
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
    if ($search -ne "") {
        if ($URI.Contains('?') -eq $false) {
            $URI = $URI + "?" + "search=" + $search
        }
        elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "search=" + $search
        }
    }
    if ($strict -ne "") {
        if ($URI.Contains('?') -eq $false) {
            $URI = $URI + "?" + "strict=" + $strict
        }
        elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "strict=" + $strict
        }
    }
    $Header = @{
        'Accept-Language' = "$Accept_Language"
        'If-None-Match' = "$If_None_Match"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEsearch



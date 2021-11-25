function get-EVEinsurance_prices {
<#
.SYNOPSIS
List insurance levels
.DESCRIPTION
Return available insurance levels for all ship types

---

This route is cached for up to 3600 seconds
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/insurance/prices/",
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
    #  https://esi.evetech.net/v1/insurance/prices/
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
Export-ModuleMember -Function get-EVEinsurance_prices



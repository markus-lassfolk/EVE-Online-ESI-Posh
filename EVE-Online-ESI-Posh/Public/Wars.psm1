function get-EVEwars {
<#
.SYNOPSIS
List wars
.DESCRIPTION
Return a list of wars

---

This route is cached for up to 3600 seconds
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/wars/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Only return wars with ID smaller than this")]
            [int32]
            $max_war_id,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v1/wars/
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
    if ($max_war_id -ne "") {
        if ($URI.Contains('?') -eq $false) {
            $URI = $URI + "?" + "max_war_id=" + $max_war_id
        }
        elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "max_war_id=" + $max_war_id
        }
    }
    $Header = @{
        'If-None-Match' = "$If_None_Match"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEwars


function get-EVEwars_war_id {
<#
.SYNOPSIS
Get war information
.DESCRIPTION
Return details about a war

---

This route is cached for up to 3600 seconds
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/wars/{war_id}/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$true, HelpMessage="ID for a war")]
            [int32]
            $war_id,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v1/wars/{war_id}/
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

    if ($war_id -ne "") {
        $URI = $URI -replace '\$war_id',"$war_id"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEwars_war_id


function get-EVEwars_war_id_killmails {
<#
.SYNOPSIS
List kills for a war
.DESCRIPTION
Return a list of kills related to a war

---

This route is cached for up to 3600 seconds
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/wars/{war_id}/killmails/",
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
            [Parameter(Mandatory=$true, HelpMessage="A valid war ID")]
            [int32]
            $war_id,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v1/wars/{war_id}/killmails/
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

    if ($war_id -ne "") {
        $URI = $URI -replace '\$war_id',"$war_id"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEwars_war_id_killmails



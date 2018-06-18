function get-EVEAlliances { 
 
<# 
.SYNOPSIS
List all alliances
 
.DESCRIPTION
List all active player alliances

---
Alternate route: `/dev/alliances/`

Alternate route: `/legacy/alliances/`

Alternate route: `/v1/alliances/`

---
This route is cached for up to 3600 seconds
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/alliances/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
 
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/alliances/
 
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
 
 
function get-EVEAlliancesNames { 
 
<# 
.SYNOPSIS
Get alliance names
 
.DESCRIPTION
Resolve a set of alliance IDs to alliance names

---
Alternate route: `/dev/alliances/names/`

Alternate route: `/v2/alliances/names/`

---
This route is cached for up to 3600 seconds
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/alliances/names/",
            [Parameter(Mandatory=$true, HelpMessage="A comma separated list of alliance IDs")]
            [array]
            $alliance_ids,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
 
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/alliances/names/
 
      $Method = "get"
      $URI = $URI -replace "{","$" -replace "}",""
 
 
        if ($alliance_ids -ne "") { 
            if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "alliance_ids=" + $alliance_ids
            }
            elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "alliance_ids=" + $alliance_ids
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
        $Header = @{
        'If-None-Match' = "$If_None_Match"
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 
function get-EVEAlliancesAlliance_Id { 
 
<# 
.SYNOPSIS
Get alliance information
 
.DESCRIPTION
Public information about an alliance

---
Alternate route: `/dev/alliances/{alliance_id}/`

Alternate route: `/v3/alliances/{alliance_id}/`

---
This route is cached for up to 3600 seconds
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/alliances/{alliance_id}/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE alliance ID")]
            [int32]
            $alliance_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
 
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/alliances/{alliance_id}/
 
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
 
        if ($alliance_id -ne "") { 
            $URI = $URI -replace '\$alliance_id',"$alliance_id"
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 
function get-EVEAlliancesAlliance_IdCorporations { 
 
<# 
.SYNOPSIS
List alliance's corporations
 
.DESCRIPTION
List all current member corporations of an alliance

---
Alternate route: `/dev/alliances/{alliance_id}/corporations/`

Alternate route: `/legacy/alliances/{alliance_id}/corporations/`

Alternate route: `/v1/alliances/{alliance_id}/corporations/`

---
This route is cached for up to 3600 seconds
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/alliances/{alliance_id}/corporations/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE alliance ID")]
            [int32]
            $alliance_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
 
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/alliances/{alliance_id}/corporations/
 
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
 
        if ($alliance_id -ne "") { 
            $URI = $URI -replace '\$alliance_id',"$alliance_id"
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 
function get-EVEAlliancesAlliance_IdIcons { 
 
<# 
.SYNOPSIS
Get alliance icon
 
.DESCRIPTION
Get the icon urls for a alliance

---
Alternate route: `/dev/alliances/{alliance_id}/icons/`

Alternate route: `/legacy/alliances/{alliance_id}/icons/`

Alternate route: `/v1/alliances/{alliance_id}/icons/`

---
This route is cached for up to 3600 seconds
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/alliances/{alliance_id}/icons/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE alliance ID")]
            [int32]
            $alliance_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
 
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/alliances/{alliance_id}/icons/
 
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
 
        if ($alliance_id -ne "") { 
            $URI = $URI -replace '\$alliance_id',"$alliance_id"
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 

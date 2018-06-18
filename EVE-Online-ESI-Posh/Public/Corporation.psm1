function get-EVECorporationsNames { 
 
<# 
.SYNOPSIS
Get corporation names
 
.DESCRIPTION
Resolve a set of corporation IDs to corporation names

---
Alternate route: `/dev/corporations/names/`

Alternate route: `/v2/corporations/names/`

---
This route is cached for up to 3600 seconds
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/names/",
            [Parameter(Mandatory=$true, HelpMessage="A comma separated list of corporation IDs")]
            [array]
            $corporation_ids,
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
#  https://esi.tech.ccp.is/latest/corporations/names/
 
      $Method = "get"
      $URI = $URI -replace "{","$" -replace "}",""
 
 
        if ($corporation_ids -ne "") { 
            if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "corporation_ids=" + $corporation_ids
            }
            elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "corporation_ids=" + $corporation_ids
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
 
 
function get-EVECorporationsNpccorps { 
 
<# 
.SYNOPSIS
Get npc corporations
 
.DESCRIPTION
Get a list of npc corporations

---
Alternate route: `/dev/corporations/npccorps/`

Alternate route: `/legacy/corporations/npccorps/`

Alternate route: `/v1/corporations/npccorps/`

---
This route expires daily at 11:05
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/npccorps/",
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
#  https://esi.tech.ccp.is/latest/corporations/npccorps/
 
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
 
 
function get-EVECorporationsCorporation_Id { 
 
<# 
.SYNOPSIS
Get corporation information
 
.DESCRIPTION
Public information about a corporation

---
Alternate route: `/dev/corporations/{corporation_id}/`

Alternate route: `/v4/corporations/{corporation_id}/`

---
This route is cached for up to 3600 seconds
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/{corporation_id}/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE corporation ID")]
            [int32]
            $corporation_id,
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
#  https://esi.tech.ccp.is/latest/corporations/{corporation_id}/
 
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
 
        if ($corporation_id -ne "") { 
            $URI = $URI -replace '\$corporation_id',"$corporation_id"
        }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
    
}
 
 
function get-EVECorporationsCorporation_IdAlliancehistory { 
 
<# 
.SYNOPSIS
Get alliance history
 
.DESCRIPTION
Get a list of all the alliances a corporation has been a member of

---
Alternate route: `/dev/corporations/{corporation_id}/alliancehistory/`

Alternate route: `/v2/corporations/{corporation_id}/alliancehistory/`

---
This route is cached for up to 3600 seconds
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/{corporation_id}/alliancehistory/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE corporation ID")]
            [int32]
            $corporation_id,
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
#  https://esi.tech.ccp.is/latest/corporations/{corporation_id}/alliancehistory/
 
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
 
        if ($corporation_id -ne "") { 
            $URI = $URI -replace '\$corporation_id',"$corporation_id"
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 
function get-EVECorporationsCorporation_IdBlueprints { 
 
<# 
.SYNOPSIS
Get corporation blueprints
 
.DESCRIPTION
Returns a list of blueprints the corporation owns

---
Alternate route: `/dev/corporations/{corporation_id}/blueprints/`

Alternate route: `/v2/corporations/{corporation_id}/blueprints/`

---
This route is cached for up to 3600 seconds

---
Requires one of the following EVE corporation role(s): Director

 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/{corporation_id}/blueprints/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE corporation ID")]
            [int32]
            $corporation_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Which page of results to return")]
            [int32]
            $page = "1",
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
 
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/corporations/{corporation_id}/blueprints/
 
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
 
        if ($corporation_id -ne "") { 
            $URI = $URI -replace '\$corporation_id',"$corporation_id"
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 
function get-EVECorporationsCorporation_IdContainersLogs { 
 
<# 
.SYNOPSIS
Get all corporation ALSC logs
 
.DESCRIPTION
Returns logs recorded in the past seven days from all audit log secure containers (ALSC) owned by a given corporation

---
Alternate route: `/dev/corporations/{corporation_id}/containers/logs/`

Alternate route: `/v2/corporations/{corporation_id}/containers/logs/`

---
This route is cached for up to 600 seconds

---
Requires one of the following EVE corporation role(s): Director

 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/{corporation_id}/containers/logs/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE corporation ID")]
            [int32]
            $corporation_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Which page of results to return")]
            [int32]
            $page = "1",
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
 
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/corporations/{corporation_id}/containers/logs/
 
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
 
        if ($corporation_id -ne "") { 
            $URI = $URI -replace '\$corporation_id',"$corporation_id"
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 
function get-EVECorporationsCorporation_IdDivisions { 
 
<# 
.SYNOPSIS
Get corporation divisions
 
.DESCRIPTION
Return corporation hangar and wallet division names, only show if a division is not using the default name

---
Alternate route: `/dev/corporations/{corporation_id}/divisions/`

Alternate route: `/legacy/corporations/{corporation_id}/divisions/`

Alternate route: `/v1/corporations/{corporation_id}/divisions/`

---
This route is cached for up to 3600 seconds

---
Requires one of the following EVE corporation role(s): Director

 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/{corporation_id}/divisions/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE corporation ID")]
            [int32]
            $corporation_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
 
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/corporations/{corporation_id}/divisions/
 
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
 
        if ($corporation_id -ne "") { 
            $URI = $URI -replace '\$corporation_id',"$corporation_id"
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 
function get-EVECorporationsCorporation_IdFacilities { 
 
<# 
.SYNOPSIS
Get corporation facilities
 
.DESCRIPTION
Return a corporation's facilities

---
Alternate route: `/dev/corporations/{corporation_id}/facilities/`

Alternate route: `/legacy/corporations/{corporation_id}/facilities/`

Alternate route: `/v1/corporations/{corporation_id}/facilities/`

---
This route is cached for up to 3600 seconds

---
Requires one of the following EVE corporation role(s): Factory_Manager

 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/{corporation_id}/facilities/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE corporation ID")]
            [int32]
            $corporation_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
 
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/corporations/{corporation_id}/facilities/
 
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
 
        if ($corporation_id -ne "") { 
            $URI = $URI -replace '\$corporation_id',"$corporation_id"
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 
function get-EVECorporationsCorporation_IdIcons { 
 
<# 
.SYNOPSIS
Get corporation icon
 
.DESCRIPTION
Get the icon urls for a corporation

---
Alternate route: `/dev/corporations/{corporation_id}/icons/`

Alternate route: `/legacy/corporations/{corporation_id}/icons/`

Alternate route: `/v1/corporations/{corporation_id}/icons/`

---
This route is cached for up to 3600 seconds
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/{corporation_id}/icons/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE corporation ID")]
            [int32]
            $corporation_id,
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
#  https://esi.tech.ccp.is/latest/corporations/{corporation_id}/icons/
 
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
 
        if ($corporation_id -ne "") { 
            $URI = $URI -replace '\$corporation_id',"$corporation_id"
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 
function get-EVECorporationsCorporation_IdMedals { 
 
<# 
.SYNOPSIS
Get corporation medals
 
.DESCRIPTION
Returns a corporation's medals

---
Alternate route: `/dev/corporations/{corporation_id}/medals/`

Alternate route: `/legacy/corporations/{corporation_id}/medals/`

Alternate route: `/v1/corporations/{corporation_id}/medals/`

---
This route is cached for up to 3600 seconds
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/{corporation_id}/medals/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE corporation ID")]
            [int32]
            $corporation_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Which page of results to return")]
            [int32]
            $page = "1",
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
 
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/corporations/{corporation_id}/medals/
 
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
 
        if ($corporation_id -ne "") { 
            $URI = $URI -replace '\$corporation_id',"$corporation_id"
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 
function get-EVECorporationsCorporation_IdMedalsIssued { 
 
<# 
.SYNOPSIS
Get corporation issued medals
 
.DESCRIPTION
Returns medals issued by a corporation

---
Alternate route: `/dev/corporations/{corporation_id}/medals/issued/`

Alternate route: `/legacy/corporations/{corporation_id}/medals/issued/`

Alternate route: `/v1/corporations/{corporation_id}/medals/issued/`

---
This route is cached for up to 3600 seconds

---
Requires one of the following EVE corporation role(s): Director

 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/{corporation_id}/medals/issued/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE corporation ID")]
            [int32]
            $corporation_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Which page of results to return")]
            [int32]
            $page = "1",
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
 
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/corporations/{corporation_id}/medals/issued/
 
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
 
        if ($corporation_id -ne "") { 
            $URI = $URI -replace '\$corporation_id',"$corporation_id"
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 
function get-EVECorporationsCorporation_IdMembers { 
 
<# 
.SYNOPSIS
Get corporation members
 
.DESCRIPTION
Return the current member list of a corporation, the token's character need to be a member of the corporation.

---
Alternate route: `/dev/corporations/{corporation_id}/members/`

Alternate route: `/v3/corporations/{corporation_id}/members/`

---
This route is cached for up to 3600 seconds
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/{corporation_id}/members/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE corporation ID")]
            [int32]
            $corporation_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
 
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/corporations/{corporation_id}/members/
 
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
 
        if ($corporation_id -ne "") { 
            $URI = $URI -replace '\$corporation_id',"$corporation_id"
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 
function get-EVECorporationsCorporation_IdMembersLimit { 
 
<# 
.SYNOPSIS
Get corporation member limit
 
.DESCRIPTION
Return a corporation's member limit, not including CEO himself

---
Alternate route: `/dev/corporations/{corporation_id}/members/limit/`

Alternate route: `/legacy/corporations/{corporation_id}/members/limit/`

Alternate route: `/v1/corporations/{corporation_id}/members/limit/`

---
This route is cached for up to 3600 seconds

---
Requires one of the following EVE corporation role(s): Director

 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/{corporation_id}/members/limit/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE corporation ID")]
            [int32]
            $corporation_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
 
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/corporations/{corporation_id}/members/limit/
 
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
 
        if ($corporation_id -ne "") { 
            $URI = $URI -replace '\$corporation_id',"$corporation_id"
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 
function get-EVECorporationsCorporation_IdMembersTitles { 
 
<# 
.SYNOPSIS
Get corporation's members' titles
 
.DESCRIPTION
Returns a corporation's members' titles

---
Alternate route: `/dev/corporations/{corporation_id}/members/titles/`

Alternate route: `/legacy/corporations/{corporation_id}/members/titles/`

Alternate route: `/v1/corporations/{corporation_id}/members/titles/`

---
This route is cached for up to 3600 seconds

---
Requires one of the following EVE corporation role(s): Director

 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/{corporation_id}/members/titles/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE corporation ID")]
            [int32]
            $corporation_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
 
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/corporations/{corporation_id}/members/titles/
 
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
 
        if ($corporation_id -ne "") { 
            $URI = $URI -replace '\$corporation_id',"$corporation_id"
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 
function get-EVECorporationsCorporation_IdMembertracking { 
 
<# 
.SYNOPSIS
Track corporation members
 
.DESCRIPTION
Returns additional information about a corporation's members which helps tracking their activities

---
Alternate route: `/dev/corporations/{corporation_id}/membertracking/`

Alternate route: `/legacy/corporations/{corporation_id}/membertracking/`

Alternate route: `/v1/corporations/{corporation_id}/membertracking/`

---
This route is cached for up to 3600 seconds

---
Requires one of the following EVE corporation role(s): Director

 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/{corporation_id}/membertracking/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE corporation ID")]
            [int32]
            $corporation_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
 
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/corporations/{corporation_id}/membertracking/
 
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
 
        if ($corporation_id -ne "") { 
            $URI = $URI -replace '\$corporation_id',"$corporation_id"
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 
function get-EVECorporationsCorporation_IdOutposts { 
 
<# 
.SYNOPSIS
Get corporation outposts
 
.DESCRIPTION
Get a list of corporation outpost IDs Note: This endpoint will be removed once outposts are migrated to Citadels as talked about in this blog: https://community.eveonline.com/news/dev-blogs/the-next-steps-in-structure-transition/

---
Alternate route: `/dev/corporations/{corporation_id}/outposts/`

Alternate route: `/legacy/corporations/{corporation_id}/outposts/`

Alternate route: `/v1/corporations/{corporation_id}/outposts/`

---
This route is cached for up to 3600 seconds

---
Requires one of the following EVE corporation role(s): Director

 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/{corporation_id}/outposts/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE corporation ID")]
            [int32]
            $corporation_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Which page of results to return")]
            [int32]
            $page = "1",
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
 
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/corporations/{corporation_id}/outposts/
 
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
 
        if ($corporation_id -ne "") { 
            $URI = $URI -replace '\$corporation_id',"$corporation_id"
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 
function get-EVECorporationsCorporation_IdOutpostsOutpost_Id { 
 
<# 
.SYNOPSIS
Get corporation outpost details
 
.DESCRIPTION
Get details about a given outpost. Note: This endpoint will be removed once outposts are migrated to Citadels as talked about in this blog: https://community.eveonline.com/news/dev-blogs/the-next-steps-in-structure-transition/

---
Alternate route: `/dev/corporations/{corporation_id}/outposts/{outpost_id}/`

Alternate route: `/legacy/corporations/{corporation_id}/outposts/{outpost_id}/`

Alternate route: `/v1/corporations/{corporation_id}/outposts/{outpost_id}/`

---
This route is cached for up to 3600 seconds

---
Requires one of the following EVE corporation role(s): Director

 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/{corporation_id}/outposts/{outpost_id}/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE corporation ID")]
            [int32]
            $corporation_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$true, HelpMessage="A station (outpost) ID")]
            [int32]
            $outpost_id,
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
 
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/corporations/{corporation_id}/outposts/{outpost_id}/
 
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
 
        if ($corporation_id -ne "") { 
            $URI = $URI -replace '\$corporation_id',"$corporation_id"
        }
 
        if ($outpost_id -ne "") { 
            $URI = $URI -replace '\$outpost_id',"$outpost_id"
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 
function get-EVECorporationsCorporation_IdRoles { 
 
<# 
.SYNOPSIS
Get corporation member roles
 
.DESCRIPTION
Return the roles of all members if the character has the personnel manager role or any grantable role.

---
Alternate route: `/dev/corporations/{corporation_id}/roles/`

Alternate route: `/legacy/corporations/{corporation_id}/roles/`

Alternate route: `/v1/corporations/{corporation_id}/roles/`

---
This route is cached for up to 3600 seconds
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/{corporation_id}/roles/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE corporation ID")]
            [int32]
            $corporation_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
 
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/corporations/{corporation_id}/roles/
 
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
 
        if ($corporation_id -ne "") { 
            $URI = $URI -replace '\$corporation_id',"$corporation_id"
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 
function get-EVECorporationsCorporation_IdRolesHistory { 
 
<# 
.SYNOPSIS
Get corporation member roles history
 
.DESCRIPTION
Return how roles have changed for a coporation's members, up to a month

---
Alternate route: `/dev/corporations/{corporation_id}/roles/history/`

Alternate route: `/legacy/corporations/{corporation_id}/roles/history/`

Alternate route: `/v1/corporations/{corporation_id}/roles/history/`

---
This route is cached for up to 3600 seconds

---
Requires one of the following EVE corporation role(s): Director

 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/{corporation_id}/roles/history/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE corporation ID")]
            [int32]
            $corporation_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Which page of results to return")]
            [int32]
            $page = "1",
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
 
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/corporations/{corporation_id}/roles/history/
 
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
 
        if ($corporation_id -ne "") { 
            $URI = $URI -replace '\$corporation_id',"$corporation_id"
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 
function get-EVECorporationsCorporation_IdShareholders { 
 
<# 
.SYNOPSIS
Get corporation shareholders
 
.DESCRIPTION
Return the current shareholders of a corporation.

---
Alternate route: `/dev/corporations/{corporation_id}/shareholders/`

Alternate route: `/legacy/corporations/{corporation_id}/shareholders/`

Alternate route: `/v1/corporations/{corporation_id}/shareholders/`

---
This route is cached for up to 3600 seconds

---
Requires one of the following EVE corporation role(s): Director

 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/{corporation_id}/shareholders/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE corporation ID")]
            [int32]
            $corporation_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Which page of results to return")]
            [int32]
            $page = "1",
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
 
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/corporations/{corporation_id}/shareholders/
 
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
 
        if ($corporation_id -ne "") { 
            $URI = $URI -replace '\$corporation_id',"$corporation_id"
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 
function get-EVECorporationsCorporation_IdStandings { 
 
<# 
.SYNOPSIS
Get corporation standings
 
.DESCRIPTION
Return corporation standings from agents, NPC corporations, and factions

---
Alternate route: `/dev/corporations/{corporation_id}/standings/`

Alternate route: `/legacy/corporations/{corporation_id}/standings/`

Alternate route: `/v1/corporations/{corporation_id}/standings/`

---
This route is cached for up to 3600 seconds
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/{corporation_id}/standings/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE corporation ID")]
            [int32]
            $corporation_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Which page of results to return")]
            [int32]
            $page = "1",
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
 
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/corporations/{corporation_id}/standings/
 
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
 
        if ($corporation_id -ne "") { 
            $URI = $URI -replace '\$corporation_id',"$corporation_id"
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 
function get-EVECorporationsCorporation_IdStarbases { 
 
<# 
.SYNOPSIS
Get corporation starbases (POSes)
 
.DESCRIPTION
Returns list of corporation starbases (POSes)

---
Alternate route: `/dev/corporations/{corporation_id}/starbases/`

Alternate route: `/legacy/corporations/{corporation_id}/starbases/`

Alternate route: `/v1/corporations/{corporation_id}/starbases/`

---
This route is cached for up to 3600 seconds

---
Requires one of the following EVE corporation role(s): Director

 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/{corporation_id}/starbases/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE corporation ID")]
            [int32]
            $corporation_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Which page of results to return")]
            [int32]
            $page = "1",
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
 
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/corporations/{corporation_id}/starbases/
 
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
 
        if ($corporation_id -ne "") { 
            $URI = $URI -replace '\$corporation_id',"$corporation_id"
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 
function get-EVECorporationsCorporation_IdStarbasesStarbase_Id { 
 
<# 
.SYNOPSIS
Get starbase (POS) detail
 
.DESCRIPTION
Returns various settings and fuels of a starbase (POS)

---
Alternate route: `/dev/corporations/{corporation_id}/starbases/{starbase_id}/`

Alternate route: `/legacy/corporations/{corporation_id}/starbases/{starbase_id}/`

Alternate route: `/v1/corporations/{corporation_id}/starbases/{starbase_id}/`

---
This route is cached for up to 3600 seconds

---
Requires one of the following EVE corporation role(s): Director

 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/{corporation_id}/starbases/{starbase_id}/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE corporation ID")]
            [int32]
            $corporation_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$true, HelpMessage="An EVE starbase (POS) ID")]
            [int64]
            $starbase_id,
            [Parameter(Mandatory=$true, HelpMessage="The solar system this starbase (POS) is located in,")]
            [int32]
            $system_id,
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
 
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/corporations/{corporation_id}/starbases/{starbase_id}/
 
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
        if ($system_id -ne "") { 
            if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "system_id=" + $system_id
            }
            elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "system_id=" + $system_id
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
 
        if ($corporation_id -ne "") { 
            $URI = $URI -replace '\$corporation_id',"$corporation_id"
        }
 
        if ($starbase_id -ne "") { 
            $URI = $URI -replace '\$starbase_id',"$starbase_id"
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 
function get-EVECorporationsCorporation_IdStructures { 
 
<# 
.SYNOPSIS
Get corporation structures
 
.DESCRIPTION
Get a list of corporation structures. This route's version includes the changes to structures detailed in this blog: https://www.eveonline.com/article/upwell-2.0-structures-changes-coming-on-february-13th

---
Alternate route: `/dev/corporations/{corporation_id}/structures/`

Alternate route: `/v2/corporations/{corporation_id}/structures/`

---
This route is cached for up to 3600 seconds

---
Requires one of the following EVE corporation role(s): StationManager

 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/{corporation_id}/structures/",
            [Parameter(Mandatory=$false, HelpMessage="Language to use in the response")]
            [ValidateSet("de","en-us","fr","ja","ru","zh")]
            [string]
            $Accept_Language = "en-us",
            [Parameter(Mandatory=$true, HelpMessage="An EVE corporation ID")]
            [int32]
            $corporation_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Language to use in the response, takes precedence over Accept-Language")]
            [ValidateSet("de","en-us","fr","ja","ru","zh")]
            [string]
            $language = "en-us",
            [Parameter(Mandatory=$false, HelpMessage="Which page of results to return")]
            [int32]
            $page = "1",
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
 
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/corporations/{corporation_id}/structures/
 
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
        if ($page -ne "") { 
            if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "page=" + $page
            }
            elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "page=" + $page
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
 
        if ($corporation_id -ne "") { 
            $URI = $URI -replace '\$corporation_id',"$corporation_id"
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 
function get-EVECorporationsCorporation_IdTitles { 
 
<# 
.SYNOPSIS
Get corporation titles
 
.DESCRIPTION
Returns a corporation's titles

---
Alternate route: `/dev/corporations/{corporation_id}/titles/`

Alternate route: `/legacy/corporations/{corporation_id}/titles/`

Alternate route: `/v1/corporations/{corporation_id}/titles/`

---
This route is cached for up to 3600 seconds

---
Requires one of the following EVE corporation role(s): Director

 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/{corporation_id}/titles/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE corporation ID")]
            [int32]
            $corporation_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
 
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/corporations/{corporation_id}/titles/
 
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
 
        if ($corporation_id -ne "") { 
            $URI = $URI -replace '\$corporation_id',"$corporation_id"
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 

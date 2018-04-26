function get-EVECharactersCharacter_IdAssets { 
 
<# 
.SYNOPSIS
Get character assets
 
.DESCRIPTION
Return a list of the characters assets

---
Alternate route: `/dev/characters/{character_id}/assets/`

Alternate route: `/v3/characters/{character_id}/assets/`

---
This route is cached for up to 3600 seconds
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/characters/{character_id}/assets/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE character ID")]
            [int32]
            $character_id,
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
            [Parameter(Mandatory=$false, HelpMessage="Client identifier, takes precedence over headers")]
            [string]
            $user_agent,
            [Parameter(Mandatory=$false, HelpMessage="Client identifier, takes precedence over User-Agent")]
            [string]
            $X_User_Agent
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/characters/{character_id}/assets/
 
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
        if ($user_agent -ne "") { 
            if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "user_agent=" + $user_agent
            }
            elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "user_agent=" + $user_agent
            }
        }
        $Header = @{
        'If-None-Match' = "$If_None_Match"
        'X-User-Agent' = "$X_User_Agent"
        }
 
        if ($character_id -ne "") { 
            $URI = $URI -replace '\$character_id',"$character_id"
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body
}
 
 
function post-EVECharactersCharacter_IdAssetsLocations { 
 
<# 
.SYNOPSIS
Get character asset locations
 
.DESCRIPTION
Return locations for a set of item ids, which you can get from character assets endpoint. Coordinates for items in hangars or stations are set to (0,0,0)

---
Alternate route: `/dev/characters/{character_id}/assets/locations/`

Alternate route: `/v2/characters/{character_id}/assets/locations/`

 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/characters/{character_id}/assets/locations/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE character ID")]
            [int32]
            $character_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$true, HelpMessage="A list of item ids")]
            [array]
            $item_ids,
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Client identifier, takes precedence over headers")]
            [string]
            $user_agent,
            [Parameter(Mandatory=$false, HelpMessage="Client identifier, takes precedence over User-Agent")]
            [string]
            $X_User_Agent
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/characters/{character_id}/assets/locations/
 
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
        if ($user_agent -ne "") { 
            if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "user_agent=" + $user_agent
            }
            elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "user_agent=" + $user_agent
            }
        }
        $Header = @{
        'X-User-Agent' = "$X_User_Agent"
        }
        $Body = @{
        'item_ids' = "$item_ids"
        }
 
        if ($character_id -ne "") { 
            $URI = $URI -replace '\$character_id',"$character_id"
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body
}
 
 
function post-EVECharactersCharacter_IdAssetsNames { 
 
<# 
.SYNOPSIS
Get character asset names
 
.DESCRIPTION
Return names for a set of item ids, which you can get from character assets endpoint. Typically used for items that can customize names, like containers or ships.

---
Alternate route: `/dev/characters/{character_id}/assets/names/`

Alternate route: `/legacy/characters/{character_id}/assets/names/`

Alternate route: `/v1/characters/{character_id}/assets/names/`

 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/characters/{character_id}/assets/names/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE character ID")]
            [int32]
            $character_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$true, HelpMessage="A list of item ids")]
            [array]
            $item_ids,
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Client identifier, takes precedence over headers")]
            [string]
            $user_agent,
            [Parameter(Mandatory=$false, HelpMessage="Client identifier, takes precedence over User-Agent")]
            [string]
            $X_User_Agent
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/characters/{character_id}/assets/names/
 
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
        if ($user_agent -ne "") { 
            if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "user_agent=" + $user_agent
            }
            elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "user_agent=" + $user_agent
            }
        }
        $Header = @{
        'X-User-Agent' = "$X_User_Agent"
        }
        $Body = @{
        'item_ids' = "$item_ids"
        }
 
        if ($character_id -ne "") { 
            $URI = $URI -replace '\$character_id',"$character_id"
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body
}
 
 
function get-EVECorporationsCorporation_IdAssets { 
 
<# 
.SYNOPSIS
Get corporation assets
 
.DESCRIPTION
Return a list of the corporation assets

---
Alternate route: `/dev/corporations/{corporation_id}/assets/`

Alternate route: `/v3/corporations/{corporation_id}/assets/`

---
This route is cached for up to 3600 seconds

---
Requires one of the following EVE corporation role(s): Director

 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/{corporation_id}/assets/",
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
            [Parameter(Mandatory=$false, HelpMessage="Client identifier, takes precedence over headers")]
            [string]
            $user_agent,
            [Parameter(Mandatory=$false, HelpMessage="Client identifier, takes precedence over User-Agent")]
            [string]
            $X_User_Agent
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/corporations/{corporation_id}/assets/
 
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
        if ($user_agent -ne "") { 
            if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "user_agent=" + $user_agent
            }
            elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "user_agent=" + $user_agent
            }
        }
        $Header = @{
        'If-None-Match' = "$If_None_Match"
        'X-User-Agent' = "$X_User_Agent"
        }
 
        if ($corporation_id -ne "") { 
            $URI = $URI -replace '\$corporation_id',"$corporation_id"
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body
}
 
 
function post-EVECorporationsCorporation_IdAssetsLocations { 
 
<# 
.SYNOPSIS
Get corporation asset locations
 
.DESCRIPTION
Return locations for a set of item ids, which you can get from corporation assets endpoint. Coordinates for items in hangars or stations are set to (0,0,0)

---
Alternate route: `/dev/corporations/{corporation_id}/assets/locations/`

Alternate route: `/v2/corporations/{corporation_id}/assets/locations/`


---
Requires one of the following EVE corporation role(s): Director

 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/{corporation_id}/assets/locations/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE corporation ID")]
            [int32]
            $corporation_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$true, HelpMessage="A list of item ids")]
            [array]
            $item_ids,
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Client identifier, takes precedence over headers")]
            [string]
            $user_agent,
            [Parameter(Mandatory=$false, HelpMessage="Client identifier, takes precedence over User-Agent")]
            [string]
            $X_User_Agent
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/corporations/{corporation_id}/assets/locations/
 
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
        if ($user_agent -ne "") { 
            if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "user_agent=" + $user_agent
            }
            elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "user_agent=" + $user_agent
            }
        }
        $Header = @{
        'X-User-Agent' = "$X_User_Agent"
        }
        $Body = @{
        'item_ids' = "$item_ids"
        }
 
        if ($corporation_id -ne "") { 
            $URI = $URI -replace '\$corporation_id',"$corporation_id"
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body
}
 
 
function post-EVECorporationsCorporation_IdAssetsNames { 
 
<# 
.SYNOPSIS
Get coporation asset names
 
.DESCRIPTION
Return names for a set of item ids, which you can get from corporation assets endpoint. Only valid for items that can customize names, like containers or ships.

---
Alternate route: `/dev/corporations/{corporation_id}/assets/names/`

Alternate route: `/legacy/corporations/{corporation_id}/assets/names/`

Alternate route: `/v1/corporations/{corporation_id}/assets/names/`


---
Requires one of the following EVE corporation role(s): Director

 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/{corporation_id}/assets/names/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE corporation ID")]
            [int32]
            $corporation_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$true, HelpMessage="A list of item ids")]
            [array]
            $item_ids,
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Client identifier, takes precedence over headers")]
            [string]
            $user_agent,
            [Parameter(Mandatory=$false, HelpMessage="Client identifier, takes precedence over User-Agent")]
            [string]
            $X_User_Agent
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/corporations/{corporation_id}/assets/names/
 
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
        if ($user_agent -ne "") { 
            if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "user_agent=" + $user_agent
            }
            elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "user_agent=" + $user_agent
            }
        }
        $Header = @{
        'X-User-Agent' = "$X_User_Agent"
        }
        $Body = @{
        'item_ids' = "$item_ids"
        }
 
        if ($corporation_id -ne "") { 
            $URI = $URI -replace '\$corporation_id',"$corporation_id"
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body
}
 
 

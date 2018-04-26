function get-EVECharactersCharacter_IdOrders { 
 
<# 
.SYNOPSIS
List open orders from a character
 
.DESCRIPTION
List open market orders placed by a character

---
Alternate route: `/dev/characters/{character_id}/orders/`

Alternate route: `/v2/characters/{character_id}/orders/`

---
This route is cached for up to 1200 seconds
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/characters/{character_id}/orders/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE character ID")]
            [int32]
            $character_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
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
#  https://esi.tech.ccp.is/latest/characters/{character_id}/orders/
 
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
 
        if ($character_id -ne "") { 
            $URI = $URI -replace '\$character_id',"$character_id"
        }
 
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body
}
 
 
function get-EVECharactersCharacter_IdOrdersHistory { 
 
<# 
.SYNOPSIS
List historical orders by a character
 
.DESCRIPTION
List cancelled and expired market orders placed by a character up to 90 days in the past.

---
Alternate route: `/dev/characters/{character_id}/orders/history/`

Alternate route: `/legacy/characters/{character_id}/orders/history/`

Alternate route: `/v1/characters/{character_id}/orders/history/`

---
This route is cached for up to 3600 seconds
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/characters/{character_id}/orders/history/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE character ID")]
            [int32]
            $character_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
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
#  https://esi.tech.ccp.is/latest/characters/{character_id}/orders/history/
 
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
        'X-User-Agent' = "$X_User_Agent"
        }
 
        if ($character_id -ne "") { 
            $URI = $URI -replace '\$character_id',"$character_id"
        }
 
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body
}
 
 
function get-EVECorporationsCorporation_IdOrders { 
 
<# 
.SYNOPSIS
List open orders from a corporation
 
.DESCRIPTION
List open market orders placed on behalf of a corporation

---
Alternate route: `/dev/corporations/{corporation_id}/orders/`

Alternate route: `/v2/corporations/{corporation_id}/orders/`

---
This route is cached for up to 1200 seconds

---
Requires one of the following EVE corporation role(s): Accountant, Trader

 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/{corporation_id}/orders/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE corporation ID")]
            [int32]
            $corporation_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
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
#  https://esi.tech.ccp.is/latest/corporations/{corporation_id}/orders/
 
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
        'X-User-Agent' = "$X_User_Agent"
        }
 
        if ($corporation_id -ne "") { 
            $URI = $URI -replace '\$corporation_id',"$corporation_id"
        }
 
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body
}
 
 
function get-EVECorporationsCorporation_IdOrdersHistory { 
 
<# 
.SYNOPSIS
List historical orders from a corporation
 
.DESCRIPTION
List cancelled and expired market orders placed on behalf of a corporation up to 90 days in the past.

---
Alternate route: `/dev/corporations/{corporation_id}/orders/history/`

Alternate route: `/legacy/corporations/{corporation_id}/orders/history/`

Alternate route: `/v1/corporations/{corporation_id}/orders/history/`

---
This route is cached for up to 3600 seconds

---
Requires one of the following EVE corporation role(s): Accountant, Trader

 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/{corporation_id}/orders/history/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE corporation ID")]
            [int32]
            $corporation_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
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
#  https://esi.tech.ccp.is/latest/corporations/{corporation_id}/orders/history/
 
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
        'X-User-Agent' = "$X_User_Agent"
        }
 
        if ($corporation_id -ne "") { 
            $URI = $URI -replace '\$corporation_id',"$corporation_id"
        }
 
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body
}
 
 
function get-EVEMarketsGroups { 
 
<# 
.SYNOPSIS
Get item groups
 
.DESCRIPTION
Get a list of item groups

---
Alternate route: `/dev/markets/groups/`

Alternate route: `/legacy/markets/groups/`

Alternate route: `/v1/markets/groups/`

---
This route expires daily at 11:05
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/markets/groups/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="Client identifier, takes precedence over headers")]
            [string]
            $user_agent,
            [Parameter(Mandatory=$false, HelpMessage="Client identifier, takes precedence over User-Agent")]
            [string]
            $X_User_Agent
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/markets/groups/
 
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
 
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body
}
 
 
function get-EVEMarketsGroupsMarket_Group_Id { 
 
<# 
.SYNOPSIS
Get item group information
 
.DESCRIPTION
Get information on an item group

---
Alternate route: `/dev/markets/groups/{market_group_id}/`

Alternate route: `/legacy/markets/groups/{market_group_id}/`

Alternate route: `/v1/markets/groups/{market_group_id}/`

---
This route expires daily at 11:05
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/markets/groups/{market_group_id}/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="Language to use in the response")]
            [ValidateSet("de","en-us","fr","ja","ru","zh")]
            [string]
            $language = "en-us",
            [Parameter(Mandatory=$true, HelpMessage="An Eve item group ID")]
            [int32]
            $market_group_id,
            [Parameter(Mandatory=$false, HelpMessage="Client identifier, takes precedence over headers")]
            [string]
            $user_agent,
            [Parameter(Mandatory=$false, HelpMessage="Client identifier, takes precedence over User-Agent")]
            [string]
            $X_User_Agent
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/markets/groups/{market_group_id}/
 
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
 
        if ($market_group_id -ne "") { 
            $URI = $URI -replace '\$market_group_id',"$market_group_id"
        }
 
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body
}
 
 
function get-EVEMarketsPrices { 
 
<# 
.SYNOPSIS
List market prices
 
.DESCRIPTION
Return a list of prices

---
Alternate route: `/dev/markets/prices/`

Alternate route: `/legacy/markets/prices/`

Alternate route: `/v1/markets/prices/`

---
This route is cached for up to 3600 seconds
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/markets/prices/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="Client identifier, takes precedence over headers")]
            [string]
            $user_agent,
            [Parameter(Mandatory=$false, HelpMessage="Client identifier, takes precedence over User-Agent")]
            [string]
            $X_User_Agent
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/markets/prices/
 
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
 
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body
}
 
 
function get-EVEMarketsStructuresStructure_Id { 
 
<# 
.SYNOPSIS
List orders in a structure
 
.DESCRIPTION
Return all orders in a structure

---
Alternate route: `/dev/markets/structures/{structure_id}/`

Alternate route: `/legacy/markets/structures/{structure_id}/`

Alternate route: `/v1/markets/structures/{structure_id}/`

---
This route is cached for up to 300 seconds
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/markets/structures/{structure_id}/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="Which page of results to return")]
            [int32]
            $page = "1",
            [Parameter(Mandatory=$true, HelpMessage="Return orders in this structure")]
            [int64]
            $structure_id,
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
#  https://esi.tech.ccp.is/latest/markets/structures/{structure_id}/
 
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
        'X-User-Agent' = "$X_User_Agent"
        }
 
        if ($structure_id -ne "") { 
            $URI = $URI -replace '\$structure_id',"$structure_id"
        }
 
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body
}
 
 
function get-EVEMarketsRegion_IdHistory { 
 
<# 
.SYNOPSIS
List historical market statistics in a region
 
.DESCRIPTION
Return a list of historical market statistics for the specified type in a region

---
Alternate route: `/dev/markets/{region_id}/history/`

Alternate route: `/legacy/markets/{region_id}/history/`

Alternate route: `/v1/markets/{region_id}/history/`

---
This route is cached for up to 3600 seconds
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/markets/{region_id}/history/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$true, HelpMessage="Return statistics in this region")]
            [int32]
            $region_id,
            [Parameter(Mandatory=$true, HelpMessage="Return statistics for this type")]
            [int32]
            $type_id,
            [Parameter(Mandatory=$false, HelpMessage="Client identifier, takes precedence over headers")]
            [string]
            $user_agent,
            [Parameter(Mandatory=$false, HelpMessage="Client identifier, takes precedence over User-Agent")]
            [string]
            $X_User_Agent
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/markets/{region_id}/history/
 
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
        if ($type_id -ne "") { 
            if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "type_id=" + $type_id
            }
            elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "type_id=" + $type_id
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
 
        if ($region_id -ne "") { 
            $URI = $URI -replace '\$region_id',"$region_id"
        }
 
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body
}
 
 
function get-EVEMarketsRegion_IdOrders { 
 
<# 
.SYNOPSIS
List orders in a region
 
.DESCRIPTION
Return a list of orders in a region

---
Alternate route: `/dev/markets/{region_id}/orders/`

Alternate route: `/legacy/markets/{region_id}/orders/`

Alternate route: `/v1/markets/{region_id}/orders/`

---
This route is cached for up to 300 seconds
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/markets/{region_id}/orders/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$true, HelpMessage="Filter buy/sell orders, return all orders by default. If you query without type_id, we always return both buy and sell orders.")]
            [ValidateSet("buy","sell","all")]
            [string]
            $order_type = "all",
            [Parameter(Mandatory=$false, HelpMessage="Which page of results to return")]
            [int32]
            $page = "1",
            [Parameter(Mandatory=$true, HelpMessage="Return orders in this region")]
            [int32]
            $region_id,
            [Parameter(Mandatory=$false, HelpMessage="Return orders only for this type")]
            [int32]
            $type_id,
            [Parameter(Mandatory=$false, HelpMessage="Client identifier, takes precedence over headers")]
            [string]
            $user_agent,
            [Parameter(Mandatory=$false, HelpMessage="Client identifier, takes precedence over User-Agent")]
            [string]
            $X_User_Agent
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/markets/{region_id}/orders/
 
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
        if ($order_type -ne "") { 
            if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "order_type=" + $order_type
            }
            elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "order_type=" + $order_type
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
        if ($type_id -ne "") { 
            if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "type_id=" + $type_id
            }
            elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "type_id=" + $type_id
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
 
        if ($region_id -ne "") { 
            $URI = $URI -replace '\$region_id',"$region_id"
        }
 
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body
}
 
 
function get-EVEMarketsRegion_IdTypes { 
 
<# 
.SYNOPSIS
List type IDs relevant to a market
 
.DESCRIPTION
Return a list of type IDs that have active orders in the region, for efficient market indexing.

---
Alternate route: `/dev/markets/{region_id}/types/`

Alternate route: `/legacy/markets/{region_id}/types/`

Alternate route: `/v1/markets/{region_id}/types/`

---
This route is cached for up to 600 seconds
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/markets/{region_id}/types/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="Which page of results to return")]
            [int32]
            $page = "1",
            [Parameter(Mandatory=$true, HelpMessage="Return statistics in this region")]
            [int32]
            $region_id,
            [Parameter(Mandatory=$false, HelpMessage="Client identifier, takes precedence over headers")]
            [string]
            $user_agent,
            [Parameter(Mandatory=$false, HelpMessage="Client identifier, takes precedence over User-Agent")]
            [string]
            $X_User_Agent
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/markets/{region_id}/types/
 
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
 
        if ($region_id -ne "") { 
            $URI = $URI -replace '\$region_id',"$region_id"
        }
 
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body
}
 
 

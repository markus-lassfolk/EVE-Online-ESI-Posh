function get-EVECharactersCharacter_IdLoyaltyPoints { 
 
<# 
.SYNOPSIS
Get loyalty points
 
.DESCRIPTION
Return a list of loyalty points for all corporations the character has worked for

---
Alternate route: `/dev/characters/{character_id}/loyalty/points/`

Alternate route: `/legacy/characters/{character_id}/loyalty/points/`

Alternate route: `/v1/characters/{character_id}/loyalty/points/`

---
This route is cached for up to 3600 seconds
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/characters/{character_id}/loyalty/points/",
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
#  https://esi.tech.ccp.is/latest/characters/{character_id}/loyalty/points/
 
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
 
 
function get-EVELoyaltyStoresCorporation_IdOffers { 
 
<# 
.SYNOPSIS
List loyalty store offers
 
.DESCRIPTION
Return a list of offers from a specific corporation's loyalty store

---
Alternate route: `/dev/loyalty/stores/{corporation_id}/offers/`

Alternate route: `/legacy/loyalty/stores/{corporation_id}/offers/`

Alternate route: `/v1/loyalty/stores/{corporation_id}/offers/`

---
This route expires daily at 11:05
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/loyalty/stores/{corporation_id}/offers/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE corporation ID")]
            [int32]
            $corporation_id,
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
#  https://esi.tech.ccp.is/latest/loyalty/stores/{corporation_id}/offers/
 
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
 
        if ($corporation_id -ne "") { 
            $URI = $URI -replace '\$corporation_id',"$corporation_id"
        }
 
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body
}
 
 

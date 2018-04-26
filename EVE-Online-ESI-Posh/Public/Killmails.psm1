function get-EVECharactersCharacter_IdKillmailsRecent { 
 
<# 
.SYNOPSIS
Get character kills and losses
 
.DESCRIPTION
Return a list of character's recent kills and losses

---
Alternate route: `/dev/characters/{character_id}/killmails/recent/`

Alternate route: `/legacy/characters/{character_id}/killmails/recent/`

Alternate route: `/v1/characters/{character_id}/killmails/recent/`

---
This route is cached for up to 120 seconds
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/characters/{character_id}/killmails/recent/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE character ID")]
            [int32]
            $character_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="How many killmails to return at maximum")]
            [int32]
            $max_count = "50",
            [Parameter(Mandatory=$false, HelpMessage="Only return killmails with ID smaller than this.
")]
            [int32]
            $max_kill_id,
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
#  https://esi.tech.ccp.is/latest/characters/{character_id}/killmails/recent/
 
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
        if ($max_count -ne "") { 
            if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "max_count=" + $max_count
            }
            elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "max_count=" + $max_count
            }
        }
        if ($max_kill_id -ne "") { 
            if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "max_kill_id=" + $max_kill_id
            }
            elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "max_kill_id=" + $max_kill_id
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
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body
}
 
 
function get-EVECorporationsCorporation_IdKillmailsRecent { 
 
<# 
.SYNOPSIS
Get corporation kills and losses
 
.DESCRIPTION
Get a list of corporation's recent kills and losses

---
Alternate route: `/dev/corporations/{corporation_id}/killmails/recent/`

Alternate route: `/legacy/corporations/{corporation_id}/killmails/recent/`

Alternate route: `/v1/corporations/{corporation_id}/killmails/recent/`

---
This route is cached for up to 300 seconds

---
Requires one of the following EVE corporation role(s): Director

 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/{corporation_id}/killmails/recent/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE corporation ID")]
            [int32]
            $corporation_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="Only return killmails with ID smaller than this")]
            [int32]
            $max_kill_id,
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
#  https://esi.tech.ccp.is/latest/corporations/{corporation_id}/killmails/recent/
 
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
        if ($max_kill_id -ne "") { 
            if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "max_kill_id=" + $max_kill_id
            }
            elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "max_kill_id=" + $max_kill_id
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
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body
}
 
 
function get-EVEKillmailsKillmail_IdKillmail_Hash { 
 
<# 
.SYNOPSIS
Get a single killmail
 
.DESCRIPTION
Return a single killmail from its ID and hash

---
Alternate route: `/dev/killmails/{killmail_id}/{killmail_hash}/`

Alternate route: `/legacy/killmails/{killmail_id}/{killmail_hash}/`

Alternate route: `/v1/killmails/{killmail_id}/{killmail_hash}/`

---
This route is cached for up to 1209600 seconds
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/killmails/{killmail_id}/{killmail_hash}/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$true, HelpMessage="The killmail hash for verification")]
            [string]
            $killmail_hash,
            [Parameter(Mandatory=$true, HelpMessage="The killmail ID to be queried")]
            [int32]
            $killmail_id,
            [Parameter(Mandatory=$false, HelpMessage="Client identifier, takes precedence over headers")]
            [string]
            $user_agent,
            [Parameter(Mandatory=$false, HelpMessage="Client identifier, takes precedence over User-Agent")]
            [string]
            $X_User_Agent
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/killmails/{killmail_id}/{killmail_hash}/
 
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
 
        if ($killmail_hash -ne "") { 
            $URI = $URI -replace '\$killmail_hash',"$killmail_hash"
        }
 
        if ($killmail_id -ne "") { 
            $URI = $URI -replace '\$killmail_id',"$killmail_id"
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body
}
 
 

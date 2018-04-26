function delete-EVECharactersCharacter_IdFittingsFitting_Id { 
 
<# 
.SYNOPSIS
Delete fitting
 
.DESCRIPTION
Delete a fitting from a character

---
Alternate route: `/dev/characters/{character_id}/fittings/{fitting_id}/`

Alternate route: `/legacy/characters/{character_id}/fittings/{fitting_id}/`

Alternate route: `/v1/characters/{character_id}/fittings/{fitting_id}/`

 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/characters/{character_id}/fittings/{fitting_id}/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE character ID")]
            [int32]
            $character_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$true, HelpMessage="ID for a fitting of this character")]
            [int32]
            $fitting_id,
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
#  https://esi.tech.ccp.is/latest/characters/{character_id}/fittings/{fitting_id}/
 
      $Method = "delete"
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
 
        if ($fitting_id -ne "") { 
            $URI = $URI -replace '\$fitting_id',"$fitting_id"
        }
 
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body
}
 
 

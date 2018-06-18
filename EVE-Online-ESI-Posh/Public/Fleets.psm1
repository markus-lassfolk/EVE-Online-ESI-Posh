function get-EVECharactersCharacter_IdFleet { 
 
<# 
.SYNOPSIS
Get character fleet info
 
.DESCRIPTION
Return the fleet ID the character is in, if any.

---
Alternate route: `/dev/characters/{character_id}/fleet/`

Alternate route: `/legacy/characters/{character_id}/fleet/`

Alternate route: `/v1/characters/{character_id}/fleet/`

---
This route is cached for up to 60 seconds
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/characters/{character_id}/fleet/",
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
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
 
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/characters/{character_id}/fleet/
 
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
 
        if ($character_id -ne "") { 
            $URI = $URI -replace '\$character_id',"$character_id"
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 
function post-EVEFleetsFleet_IdWingsWing_IdSquads { 
 
<# 
.SYNOPSIS
Create fleet squad
 
.DESCRIPTION
Create a new squad in a fleet

---
Alternate route: `/dev/fleets/{fleet_id}/wings/{wing_id}/squads/`

Alternate route: `/legacy/fleets/{fleet_id}/wings/{wing_id}/squads/`

Alternate route: `/v1/fleets/{fleet_id}/wings/{wing_id}/squads/`

 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/fleets/{fleet_id}/wings/{wing_id}/squads/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$true, HelpMessage="ID for a fleet")]
            [int64]
            $fleet_id,
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$true, HelpMessage="The wing_id to create squad in")]
            [int64]
            $wing_id,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
 
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/fleets/{fleet_id}/wings/{wing_id}/squads/
 
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
 
        if ($fleet_id -ne "") { 
            $URI = $URI -replace '\$fleet_id',"$fleet_id"
        }
 
        if ($wing_id -ne "") { 
            $URI = $URI -replace '\$wing_id',"$wing_id"
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 

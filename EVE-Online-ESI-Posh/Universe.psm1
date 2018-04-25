function get-EVEUniverseAsteroid_BeltsAsteroid_Belt_Id { 
 
<# 
.SYNOPSIS
Get asteroid belt information
 
.DESCRIPTION
Get information on an asteroid belt

---
Alternate route: `/dev/universe/asteroid_belts/{asteroid_belt_id}/`

Alternate route: `/legacy/universe/asteroid_belts/{asteroid_belt_id}/`

Alternate route: `/v1/universe/asteroid_belts/{asteroid_belt_id}/`

---
This route expires daily at 11:05
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/universe/asteroid_belts/{asteroid_belt_id}/",
            [Parameter(Mandatory=$true, HelpMessage="asteroid_belt_id integer")]
            [int32]
            $asteroid_belt_id,
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
#  https://esi.tech.ccp.is/latest/universe/asteroid_belts/{asteroid_belt_id}/
 
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
        if ($asteroid_belt_id -ne "") { 
            $URI = $URI -replace '\$asteroid_belt_id',"$asteroid_belt_id"
        }


        $Header
        $body

        Write-Host $URI
 }

get-EVEUniverseAsteroid_BeltsAsteroid_Belt_Id -asteroid_belt_id 12345


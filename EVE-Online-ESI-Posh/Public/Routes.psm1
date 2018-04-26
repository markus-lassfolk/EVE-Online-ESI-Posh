function get-EVERouteOriginDestination { 
 
<# 
.SYNOPSIS
Get route
 
.DESCRIPTION
Get the systems between origin and destination

---
Alternate route: `/dev/route/{origin}/{destination}/`

Alternate route: `/legacy/route/{origin}/{destination}/`

Alternate route: `/v1/route/{origin}/{destination}/`

---
This route is cached for up to 86400 seconds
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/route/{origin}/{destination}/",
            [Parameter(Mandatory=$false, HelpMessage="avoid solar system ID(s)")]
            [array]
            $avoid,
            [Parameter(Mandatory=$false, HelpMessage="connected solar system pairs")]
            [array]
            $connections,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$true, HelpMessage="destination solar system ID")]
            [int32]
            $destination,
            [Parameter(Mandatory=$false, HelpMessage="route security preference")]
            [ValidateSet("shortest","secure","insecure")]
            [string]
            $flag = "shortest",
            [Parameter(Mandatory=$true, HelpMessage="origin solar system ID")]
            [int32]
            $origin,
            [Parameter(Mandatory=$false, HelpMessage="Client identifier, takes precedence over headers")]
            [string]
            $user_agent,
            [Parameter(Mandatory=$false, HelpMessage="Client identifier, takes precedence over User-Agent")]
            [string]
            $X_User_Agent
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/route/{origin}/{destination}/
 
      $Method = "get"
      $URI = $URI -replace "{","$" -replace "}",""
 
 
        if ($avoid -ne "") { 
            if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "avoid=" + $avoid
            }
            elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "avoid=" + $avoid
            }
        }
        if ($connections -ne "") { 
            if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "connections=" + $connections
            }
            elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "connections=" + $connections
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
        if ($flag -ne "") { 
            if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "flag=" + $flag
            }
            elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "flag=" + $flag
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
 
        if ($destination -ne "") { 
            $URI = $URI -replace '\$destination',"$destination"
        }
 
        if ($origin -ne "") { 
            $URI = $URI -replace '\$origin',"$origin"
        }
 
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body
}
 
 

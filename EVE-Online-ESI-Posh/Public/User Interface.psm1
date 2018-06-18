function post-EVEUiAutopilotWaypoint { 
 
<# 
.SYNOPSIS
Set Autopilot Waypoint
 
.DESCRIPTION
Set a solar system as autopilot waypoint

---
Alternate route: `/dev/ui/autopilot/waypoint/`

Alternate route: `/v2/ui/autopilot/waypoint/`

 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/ui/autopilot/waypoint/",
            [Parameter(Mandatory=$true, HelpMessage="Whether this solar system should be added to the beginning of all waypoints")]
            [boolean]
            [ValidateSet($True,$False)]
            $add_to_beginning = $false,
            [Parameter(Mandatory=$true, HelpMessage="Whether clean other waypoints beforing adding this one")]
            [boolean]
            [ValidateSet($True,$False)]
            $clear_other_waypoints = $false,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$true, HelpMessage="The destination to travel to, can be solar system, station or structure's id")]
            [int64]
            $destination_id,
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
 
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/ui/autopilot/waypoint/
 
      $Method = "post"
      $URI = $URI -replace "{","$" -replace "}",""
 
 
        if ($add_to_beginning -ne "") { 
            if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "add_to_beginning=" + $add_to_beginning
            }
            elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "add_to_beginning=" + $add_to_beginning
            }
        }
        if ($clear_other_waypoints -ne "") { 
            if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "clear_other_waypoints=" + $clear_other_waypoints
            }
            elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "clear_other_waypoints=" + $clear_other_waypoints
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
        if ($destination_id -ne "") { 
            if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "destination_id=" + $destination_id
            }
            elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "destination_id=" + $destination_id
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
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 
function post-EVEUiOpenwindowContract { 
 
<# 
.SYNOPSIS
Open Contract Window
 
.DESCRIPTION
Open the contract window inside the client

---
Alternate route: `/dev/ui/openwindow/contract/`

Alternate route: `/legacy/ui/openwindow/contract/`

Alternate route: `/v1/ui/openwindow/contract/`

 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/ui/openwindow/contract/",
            [Parameter(Mandatory=$true, HelpMessage="The contract to open")]
            [int32]
            $contract_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
 
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/ui/openwindow/contract/
 
      $Method = "post"
      $URI = $URI -replace "{","$" -replace "}",""
 
 
        if ($contract_id -ne "") { 
            if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "contract_id=" + $contract_id
            }
            elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "contract_id=" + $contract_id
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
        if ($token -ne "") { 
            if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "token=" + $token
            }
            elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "token=" + $token
            }
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 
function post-EVEUiOpenwindowInformation { 
 
<# 
.SYNOPSIS
Open Information Window
 
.DESCRIPTION
Open the information window for a character, corporation or alliance inside the client

---
Alternate route: `/dev/ui/openwindow/information/`

Alternate route: `/legacy/ui/openwindow/information/`

Alternate route: `/v1/ui/openwindow/information/`

 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/ui/openwindow/information/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$true, HelpMessage="The target to open")]
            [int32]
            $target_id,
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
 
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/ui/openwindow/information/
 
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
        if ($target_id -ne "") { 
            if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "target_id=" + $target_id
            }
            elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "target_id=" + $target_id
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
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 
function post-EVEUiOpenwindowMarketdetails { 
 
<# 
.SYNOPSIS
Open Market Details
 
.DESCRIPTION
Open the market details window for a specific typeID inside the client

---
Alternate route: `/dev/ui/openwindow/marketdetails/`

Alternate route: `/legacy/ui/openwindow/marketdetails/`

Alternate route: `/v1/ui/openwindow/marketdetails/`

 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/ui/openwindow/marketdetails/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$true, HelpMessage="The item type to open in market window")]
            [int32]
            $type_id,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
 
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/ui/openwindow/marketdetails/
 
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
        if ($type_id -ne "") { 
            if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "type_id=" + $type_id
            }
            elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "type_id=" + $type_id
            }
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 
function post-EVEUiOpenwindowNewmail { 
 
<# 
.SYNOPSIS
Open New Mail Window
 
.DESCRIPTION
Open the New Mail window, according to settings from the request if applicable

---
Alternate route: `/dev/ui/openwindow/newmail/`

Alternate route: `/legacy/ui/openwindow/newmail/`

Alternate route: `/v1/ui/openwindow/newmail/`

 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/ui/openwindow/newmail/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$true, HelpMessage="The details of mail to create")]
            [object]
            $new_mail,
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
 
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/ui/openwindow/newmail/
 
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
        $Body = @{
        'new_mail' = "$new_mail"
        }
$URI = $URI -replace "$True","True" -replace "$False","False"
invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 

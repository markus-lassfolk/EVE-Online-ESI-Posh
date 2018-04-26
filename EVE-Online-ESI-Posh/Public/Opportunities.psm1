function get-EVECharactersCharacter_IdOpportunities { 
 
<# 
.SYNOPSIS
Get a character's completed tasks
 
.DESCRIPTION
Return a list of tasks finished by a character

---
Alternate route: `/dev/characters/{character_id}/opportunities/`

Alternate route: `/legacy/characters/{character_id}/opportunities/`

Alternate route: `/v1/characters/{character_id}/opportunities/`

---
This route is cached for up to 3600 seconds
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/characters/{character_id}/opportunities/",
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
#  https://esi.tech.ccp.is/latest/characters/{character_id}/opportunities/
 
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
 
$invokecommandline = "-uri $uri"
if (($header.'X-User-Agent') -ne "") { 
$invokecommandline = $invokecommandline + " -headers $header"
}
if ($body -ne $null) { 
    $invokecommandline = $invokecommandline + " -body $body"
}
$invokecommandline = $invokecommandline + " -method $method"
invoke-EVEWebRequest $invokecommandline
}
 
 
function get-EVEOpportunitiesGroups { 
 
<# 
.SYNOPSIS
Get opportunities groups
 
.DESCRIPTION
Return a list of opportunities groups

---
Alternate route: `/dev/opportunities/groups/`

Alternate route: `/legacy/opportunities/groups/`

Alternate route: `/v1/opportunities/groups/`

---
This route expires daily at 11:05
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/opportunities/groups/",
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
#  https://esi.tech.ccp.is/latest/opportunities/groups/
 
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
 
$invokecommandline = "-uri $uri"
if (($header.'X-User-Agent') -ne "") { 
$invokecommandline = $invokecommandline + " -headers $header"
}
if ($body -ne $null) { 
    $invokecommandline = $invokecommandline + " -body $body"
}
$invokecommandline = $invokecommandline + " -method $method"
invoke-EVEWebRequest $invokecommandline
}
 
 
function get-EVEOpportunitiesGroupsGroup_Id { 
 
<# 
.SYNOPSIS
Get opportunities group
 
.DESCRIPTION
Return information of an opportunities group

---
Alternate route: `/dev/opportunities/groups/{group_id}/`

Alternate route: `/legacy/opportunities/groups/{group_id}/`

Alternate route: `/v1/opportunities/groups/{group_id}/`

---
This route expires daily at 11:05
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/opportunities/groups/{group_id}/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$true, HelpMessage="ID of an opportunities group")]
            [int32]
            $group_id,
            [Parameter(Mandatory=$false, HelpMessage="Language to use in the response")]
            [ValidateSet("de","en-us","fr","ja","ru","zh")]
            [string]
            $language = "en-us",
            [Parameter(Mandatory=$false, HelpMessage="Client identifier, takes precedence over headers")]
            [string]
            $user_agent,
            [Parameter(Mandatory=$false, HelpMessage="Client identifier, takes precedence over User-Agent")]
            [string]
            $X_User_Agent
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/opportunities/groups/{group_id}/
 
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
 
        if ($group_id -ne "") { 
            $URI = $URI -replace '\$group_id',"$group_id"
        }
 
$invokecommandline = "-uri $uri"
if (($header.'X-User-Agent') -ne "") { 
$invokecommandline = $invokecommandline + " -headers $header"
}
if ($body -ne $null) { 
    $invokecommandline = $invokecommandline + " -body $body"
}
$invokecommandline = $invokecommandline + " -method $method"
invoke-EVEWebRequest $invokecommandline
}
 
 
function get-EVEOpportunitiesTasks { 
 
<# 
.SYNOPSIS
Get opportunities tasks
 
.DESCRIPTION
Return a list of opportunities tasks

---
Alternate route: `/dev/opportunities/tasks/`

Alternate route: `/legacy/opportunities/tasks/`

Alternate route: `/v1/opportunities/tasks/`

---
This route expires daily at 11:05
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/opportunities/tasks/",
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
#  https://esi.tech.ccp.is/latest/opportunities/tasks/
 
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
 
$invokecommandline = "-uri $uri"
if (($header.'X-User-Agent') -ne "") { 
$invokecommandline = $invokecommandline + " -headers $header"
}
if ($body -ne $null) { 
    $invokecommandline = $invokecommandline + " -body $body"
}
$invokecommandline = $invokecommandline + " -method $method"
invoke-EVEWebRequest $invokecommandline
}
 
 
function get-EVEOpportunitiesTasksTask_Id { 
 
<# 
.SYNOPSIS
Get opportunities task
 
.DESCRIPTION
Return information of an opportunities task

---
Alternate route: `/dev/opportunities/tasks/{task_id}/`

Alternate route: `/legacy/opportunities/tasks/{task_id}/`

Alternate route: `/v1/opportunities/tasks/{task_id}/`

---
This route expires daily at 11:05
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/opportunities/tasks/{task_id}/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$true, HelpMessage="ID of an opportunities task")]
            [int32]
            $task_id,
            [Parameter(Mandatory=$false, HelpMessage="Client identifier, takes precedence over headers")]
            [string]
            $user_agent,
            [Parameter(Mandatory=$false, HelpMessage="Client identifier, takes precedence over User-Agent")]
            [string]
            $X_User_Agent
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/opportunities/tasks/{task_id}/
 
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
 
        if ($task_id -ne "") { 
            $URI = $URI -replace '\$task_id',"$task_id"
        }
 
$invokecommandline = "-uri $uri"
if (($header.'X-User-Agent') -ne "") { 
$invokecommandline = $invokecommandline + " -headers $header"
}
if ($body -ne $null) { 
    $invokecommandline = $invokecommandline + " -body $body"
}
$invokecommandline = $invokecommandline + " -method $method"
invoke-EVEWebRequest $invokecommandline
}
 
 

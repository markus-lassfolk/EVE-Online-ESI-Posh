function get-EVECharactersCharacter_IdSearch { 
 
<# 
.SYNOPSIS
Search on a string
 
.DESCRIPTION
Search for entities that match a given sub-string.

---
Alternate route: `/dev/characters/{character_id}/search/`

Alternate route: `/v3/characters/{character_id}/search/`

---
This route is cached for up to 3600 seconds
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/characters/{character_id}/search/",
            [Parameter(Mandatory=$true, HelpMessage="Type of entities to search for")]
            [array]
            $categories,
            [Parameter(Mandatory=$true, HelpMessage="An EVE character ID")]
            [int32]
            $character_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="Language to use in the response")]
            [ValidateSet("de","en-us","fr","ja","ru","zh")]
            [string]
            $language = "en-us",
            [Parameter(Mandatory=$true, HelpMessage="The string to search on")]
            [string]
            $search,
            [Parameter(Mandatory=$false, HelpMessage="Whether the search should be a strict match")]
            [boolean]
            $strict = "False",
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
#  https://esi.tech.ccp.is/latest/characters/{character_id}/search/
 
      $Method = "get"
      $URI = $URI -replace "{","$" -replace "}",""
 
 
        if ($categories -ne "") { 
            if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "categories=" + $categories
            }
            elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "categories=" + $categories
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
        if ($language -ne "") { 
            if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "language=" + $language
            }
            elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "language=" + $language
            }
        }
        if ($search -ne "") { 
            if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "search=" + $search
            }
            elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "search=" + $search
            }
        }
        if ($strict -ne "") { 
            if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "strict=" + $strict
            }
            elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "strict=" + $strict
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
 
 
function get-EVESearch { 
 
<# 
.SYNOPSIS
Search on a string
 
.DESCRIPTION
Search for entities that match a given sub-string.

---
Alternate route: `/dev/search/`

Alternate route: `/v2/search/`

---
This route is cached for up to 3600 seconds
 
#>
 
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/search/",
            [Parameter(Mandatory=$true, HelpMessage="Type of entities to search for")]
            [array]
            $categories,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="Language to use in the response")]
            [ValidateSet("de","en-us","fr","ja","ru","zh")]
            [string]
            $language = "en-us",
            [Parameter(Mandatory=$true, HelpMessage="The string to search on")]
            [string]
            $search,
            [Parameter(Mandatory=$false, HelpMessage="Whether the search should be a strict match")]
            [boolean]
            $strict = "False",
            [Parameter(Mandatory=$false, HelpMessage="Client identifier, takes precedence over headers")]
            [string]
            $user_agent,
            [Parameter(Mandatory=$false, HelpMessage="Client identifier, takes precedence over User-Agent")]
            [string]
            $X_User_Agent
    ) #End of Param
 
#  Example URI
#  https://esi.tech.ccp.is/latest/search/
 
      $Method = "get"
      $URI = $URI -replace "{","$" -replace "}",""
 
 
        if ($categories -ne "") { 
            if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "categories=" + $categories
            }
            elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "categories=" + $categories
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
        if ($language -ne "") { 
            if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "language=" + $language
            }
            elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "language=" + $language
            }
        }
        if ($search -ne "") { 
            if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "search=" + $search
            }
            elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "search=" + $search
            }
        }
        if ($strict -ne "") { 
            if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "strict=" + $strict
            }
            elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "strict=" + $strict
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
 
 

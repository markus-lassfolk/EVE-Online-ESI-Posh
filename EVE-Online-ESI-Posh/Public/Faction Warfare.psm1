function get-EVECharactersCharacter_IdFwStats { 
<# 
.SYNOPSIS
Overview of a character involved in faction warfare
.DESCRIPTION
Statistical overview of a character involved in faction warfare

---
Alternate route: `/dev/characters/{character_id}/fw/stats/`

Alternate route: `/legacy/characters/{character_id}/fw/stats/`

Alternate route: `/v1/characters/{character_id}/fw/stats/`

---
This route expires daily at 11:05
#>
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/characters/{character_id}/fw/stats/",
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
    #  https://esi.tech.ccp.is/latest/characters/{character_id}/fw/stats/
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
 
 
function get-EVECorporationsCorporation_IdFwStats { 
<# 
.SYNOPSIS
Overview of a corporation involved in faction warfare
.DESCRIPTION
Statistics about a corporation involved in faction warfare

---
Alternate route: `/dev/corporations/{corporation_id}/fw/stats/`

Alternate route: `/legacy/corporations/{corporation_id}/fw/stats/`

Alternate route: `/v1/corporations/{corporation_id}/fw/stats/`

---
This route expires daily at 11:05
#>
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/{corporation_id}/fw/stats/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE corporation ID")]
            [int32]
            $corporation_id,
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
    #  https://esi.tech.ccp.is/latest/corporations/{corporation_id}/fw/stats/
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
 
    if ($corporation_id -ne "") { 
        $URI = $URI -replace '\$corporation_id',"$corporation_id"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 
function get-EVEFwLeaderboards { 
<# 
.SYNOPSIS
List of the top factions in faction warfare
.DESCRIPTION
Top 4 leaderboard of factions for kills and victory points separated by total, last week and yesterday.

---
Alternate route: `/dev/fw/leaderboards/`

Alternate route: `/legacy/fw/leaderboards/`

Alternate route: `/v1/fw/leaderboards/`

---
This route expires daily at 11:05
#>
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/fw/leaderboards/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.tech.ccp.is/latest/fw/leaderboards/
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
    $Header = @{
        'If-None-Match' = "$If_None_Match"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 
function get-EVEFwLeaderboardsCharacters { 
<# 
.SYNOPSIS
List of the top pilots in faction warfare
.DESCRIPTION
Top 100 leaderboard of pilots for kills and victory points separated by total, last week and yesterday.

---
Alternate route: `/dev/fw/leaderboards/characters/`

Alternate route: `/legacy/fw/leaderboards/characters/`

Alternate route: `/v1/fw/leaderboards/characters/`

---
This route expires daily at 11:05
#>
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/fw/leaderboards/characters/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.tech.ccp.is/latest/fw/leaderboards/characters/
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
    $Header = @{
        'If-None-Match' = "$If_None_Match"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 
function get-EVEFwLeaderboardsCorporations { 
<# 
.SYNOPSIS
List of the top corporations in faction warfare
.DESCRIPTION
Top 10 leaderboard of corporations for kills and victory points separated by total, last week and yesterday.

---
Alternate route: `/dev/fw/leaderboards/corporations/`

Alternate route: `/legacy/fw/leaderboards/corporations/`

Alternate route: `/v1/fw/leaderboards/corporations/`

---
This route expires daily at 11:05
#>
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/fw/leaderboards/corporations/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.tech.ccp.is/latest/fw/leaderboards/corporations/
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
    $Header = @{
        'If-None-Match' = "$If_None_Match"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 
function get-EVEFwStats { 
<# 
.SYNOPSIS
An overview of statistics about factions involved in faction warfare
.DESCRIPTION
Statistical overviews of factions involved in faction warfare

---
Alternate route: `/dev/fw/stats/`

Alternate route: `/legacy/fw/stats/`

Alternate route: `/v1/fw/stats/`

---
This route expires daily at 11:05
#>
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/fw/stats/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.tech.ccp.is/latest/fw/stats/
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
    $Header = @{
        'If-None-Match' = "$If_None_Match"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 
function get-EVEFwSystems { 
<# 
.SYNOPSIS
Ownership of faction warfare systems
.DESCRIPTION
An overview of the current ownership of faction warfare solar systems

---
Alternate route: `/dev/fw/systems/`

Alternate route: `/v2/fw/systems/`

---
This route is cached for up to 1800 seconds
#>
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/fw/systems/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.tech.ccp.is/latest/fw/systems/
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
    $Header = @{
        'If-None-Match' = "$If_None_Match"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 
function get-EVEFwWars { 
<# 
.SYNOPSIS
Data about which NPC factions are at war
.DESCRIPTION
Data about which NPC factions are at war

---
Alternate route: `/dev/fw/wars/`

Alternate route: `/legacy/fw/wars/`

Alternate route: `/v1/fw/wars/`

---
This route expires daily at 11:05
#>
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/fw/wars/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.tech.ccp.is/latest/fw/wars/
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
    $Header = @{
        'If-None-Match' = "$If_None_Match"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 

function get-EVECharactersCharacter_IdBookmarks { 
<# 
.SYNOPSIS
List bookmarks
.DESCRIPTION
A list of your character's personal bookmarks

---
Alternate route: `/dev/characters/{character_id}/bookmarks/`

Alternate route: `/v2/characters/{character_id}/bookmarks/`

---
This route is cached for up to 3600 seconds
#>
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/characters/{character_id}/bookmarks/",
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
            [Parameter(Mandatory=$false, HelpMessage="Which page of results to return")]
            [int32]
            $page = "1",
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.tech.ccp.is/latest/characters/{character_id}/bookmarks/
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
    if ($page -ne "") { 
        if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "page=" + $page
        }
        elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "page=" + $page
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
 
 
function get-EVECharactersCharacter_IdBookmarksFolders { 
<# 
.SYNOPSIS
List bookmark folders
.DESCRIPTION
A list of your character's personal bookmark folders

---
Alternate route: `/dev/characters/{character_id}/bookmarks/folders/`

Alternate route: `/v2/characters/{character_id}/bookmarks/folders/`

---
This route is cached for up to 3600 seconds
#>
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/characters/{character_id}/bookmarks/folders/",
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
            [Parameter(Mandatory=$false, HelpMessage="Which page of results to return")]
            [int32]
            $page = "1",
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.tech.ccp.is/latest/characters/{character_id}/bookmarks/folders/
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
    if ($page -ne "") { 
        if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "page=" + $page
        }
        elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "page=" + $page
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
 
 
function get-EVECorporationsCorporation_IdBookmarks { 
<# 
.SYNOPSIS
List corporation bookmarks
.DESCRIPTION
A list of your corporation's bookmarks

---
Alternate route: `/dev/corporations/{corporation_id}/bookmarks/`

Alternate route: `/legacy/corporations/{corporation_id}/bookmarks/`

Alternate route: `/v1/corporations/{corporation_id}/bookmarks/`

---
This route is cached for up to 3600 seconds
#>
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/{corporation_id}/bookmarks/",
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
            [Parameter(Mandatory=$false, HelpMessage="Which page of results to return")]
            [int32]
            $page = "1",
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.tech.ccp.is/latest/corporations/{corporation_id}/bookmarks/
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
    if ($page -ne "") { 
        if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "page=" + $page
        }
        elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "page=" + $page
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
 
 
function get-EVECorporationsCorporation_IdBookmarksFolders { 
<# 
.SYNOPSIS
List corporation bookmark folders
.DESCRIPTION
A list of your corporation's bookmark folders

---
Alternate route: `/dev/corporations/{corporation_id}/bookmarks/folders/`

Alternate route: `/legacy/corporations/{corporation_id}/bookmarks/folders/`

Alternate route: `/v1/corporations/{corporation_id}/bookmarks/folders/`

---
This route is cached for up to 3600 seconds
#>
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/{corporation_id}/bookmarks/folders/",
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
            [Parameter(Mandatory=$false, HelpMessage="Which page of results to return")]
            [int32]
            $page = "1",
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result")]
            [ValidateSet("PS","json")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.tech.ccp.is/latest/corporations/{corporation_id}/bookmarks/folders/
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
    if ($page -ne "") { 
        if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "page=" + $page
        }
        elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "page=" + $page
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
 
 

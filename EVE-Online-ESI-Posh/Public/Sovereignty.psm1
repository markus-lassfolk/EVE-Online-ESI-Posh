function get-EVESovereigntyCampaigns { 
<# 
.SYNOPSIS
List sovereignty campaigns
.DESCRIPTION
Shows sovereignty data for campaigns.

---
Alternate route: `/dev/sovereignty/campaigns/`

Alternate route: `/legacy/sovereignty/campaigns/`

Alternate route: `/v1/sovereignty/campaigns/`

---
This route is cached for up to 5 seconds
#>
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/sovereignty/campaigns/",
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
    #  https://esi.tech.ccp.is/latest/sovereignty/campaigns/
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
 
 
function get-EVESovereigntyMap { 
<# 
.SYNOPSIS
List sovereignty of systems
.DESCRIPTION
Shows sovereignty information for solar systems

---
Alternate route: `/dev/sovereignty/map/`

Alternate route: `/legacy/sovereignty/map/`

Alternate route: `/v1/sovereignty/map/`

---
This route is cached for up to 3600 seconds
#>
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/sovereignty/map/",
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
    #  https://esi.tech.ccp.is/latest/sovereignty/map/
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
 
 
function get-EVESovereigntyStructures { 
<# 
.SYNOPSIS
List sovereignty structures
.DESCRIPTION
Shows sovereignty data for structures.

---
Alternate route: `/dev/sovereignty/structures/`

Alternate route: `/legacy/sovereignty/structures/`

Alternate route: `/v1/sovereignty/structures/`

---
This route is cached for up to 120 seconds
#>
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/sovereignty/structures/",
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
    #  https://esi.tech.ccp.is/latest/sovereignty/structures/
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
 
 

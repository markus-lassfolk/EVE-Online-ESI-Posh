function get-EVEincursions { 
<# 
.SYNOPSIS
List incursions
.DESCRIPTION
Return a list of current incursions

---

This route is cached for up to 300 seconds
#>
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/v1/incursions/",
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="ETag from a previous request. A 304 will be returned if this matches the current ETag")]
            [string]
            $If_None_Match,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.tech.ccp.is/v1/incursions/
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
 
 

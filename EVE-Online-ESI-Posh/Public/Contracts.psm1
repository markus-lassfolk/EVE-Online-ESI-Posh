function get-EVEcharacters_character_id_contracts {
<#
.SYNOPSIS
Get contracts
.DESCRIPTION
Returns contracts available to a character, only if the character is issuer, acceptor or assignee. Only returns contracts no older than 30 days, or if the status is "in_progress".

---

This route is cached for up to 300 seconds
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/characters/{character_id}/contracts/",
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
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v1/characters/{character_id}/contracts/
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
Export-ModuleMember -Function get-EVEcharacters_character_id_contracts


function get-EVEcharacters_character_id_contracts_contract_id_bids {
<#
.SYNOPSIS
Get contract bids
.DESCRIPTION
Lists bids on a particular auction contract

---

This route is cached for up to 300 seconds
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/characters/{character_id}/contracts/{contract_id}/bids/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE character ID")]
            [int32]
            $character_id,
            [Parameter(Mandatory=$true, HelpMessage="ID of a contract")]
            [int32]
            $contract_id,
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
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v1/characters/{character_id}/contracts/{contract_id}/bids/
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

    if ($contract_id -ne "") {
        $URI = $URI -replace '\$contract_id',"$contract_id"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEcharacters_character_id_contracts_contract_id_bids


function get-EVEcharacters_character_id_contracts_contract_id_items {
<#
.SYNOPSIS
Get contract items
.DESCRIPTION
Lists items of a particular contract

---

This route is cached for up to 3600 seconds
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/characters/{character_id}/contracts/{contract_id}/items/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE character ID")]
            [int32]
            $character_id,
            [Parameter(Mandatory=$true, HelpMessage="ID of a contract")]
            [int32]
            $contract_id,
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
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v1/characters/{character_id}/contracts/{contract_id}/items/
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

    if ($contract_id -ne "") {
        $URI = $URI -replace '\$contract_id',"$contract_id"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEcharacters_character_id_contracts_contract_id_items


function get-EVEcontracts_public_bids_contract_id {
<#
.SYNOPSIS
Get public contract bids
.DESCRIPTION
Lists bids on a public auction contract

---

This route is cached for up to 300 seconds
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/contracts/public/bids/{contract_id}/",
            [Parameter(Mandatory=$true, HelpMessage="ID of a contract")]
            [int32]
            $contract_id,
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
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v1/contracts/public/bids/{contract_id}/
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
    $Header = @{
        'If-None-Match' = "$If_None_Match"
    }

    if ($contract_id -ne "") {
        $URI = $URI -replace '\$contract_id',"$contract_id"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEcontracts_public_bids_contract_id


function get-EVEcontracts_public_items_contract_id {
<#
.SYNOPSIS
Get public contract items
.DESCRIPTION
Lists items of a public contract

---

This route is cached for up to 3600 seconds
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/contracts/public/items/{contract_id}/",
            [Parameter(Mandatory=$true, HelpMessage="ID of a contract")]
            [int32]
            $contract_id,
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
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v1/contracts/public/items/{contract_id}/
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
    $Header = @{
        'If-None-Match' = "$If_None_Match"
    }

    if ($contract_id -ne "") {
        $URI = $URI -replace '\$contract_id',"$contract_id"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEcontracts_public_items_contract_id


function get-EVEcontracts_public_region_id {
<#
.SYNOPSIS
Get public contracts
.DESCRIPTION
Returns a paginated list of all public contracts in the given region

---

This route is cached for up to 1800 seconds
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/contracts/public/{region_id}/",
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
            [Parameter(Mandatory=$true, HelpMessage="An EVE region id")]
            [int32]
            $region_id,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v1/contracts/public/{region_id}/
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
    $Header = @{
        'If-None-Match' = "$If_None_Match"
    }

    if ($region_id -ne "") {
        $URI = $URI -replace '\$region_id',"$region_id"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEcontracts_public_region_id


function get-EVEcorporations_corporation_id_contracts {
<#
.SYNOPSIS
Get corporation contracts
.DESCRIPTION
Returns contracts available to a corporation, only if the corporation is issuer, acceptor or assignee. Only returns contracts no older than 30 days, or if the status is "in_progress".

---

This route is cached for up to 300 seconds
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/corporations/{corporation_id}/contracts/",
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
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v1/corporations/{corporation_id}/contracts/
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
Export-ModuleMember -Function get-EVEcorporations_corporation_id_contracts


function get-EVEcorporations_corporation_id_contracts_contract_id_bids {
<#
.SYNOPSIS
Get corporation contract bids
.DESCRIPTION
Lists bids on a particular auction contract

---

This route is cached for up to 3600 seconds
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/corporations/{corporation_id}/contracts/{contract_id}/bids/",
            [Parameter(Mandatory=$true, HelpMessage="ID of a contract")]
            [int32]
            $contract_id,
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
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v1/corporations/{corporation_id}/contracts/{contract_id}/bids/
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

    if ($contract_id -ne "") {
        $URI = $URI -replace '\$contract_id',"$contract_id"
    }

    if ($corporation_id -ne "") {
        $URI = $URI -replace '\$corporation_id',"$corporation_id"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEcorporations_corporation_id_contracts_contract_id_bids


function get-EVEcorporations_corporation_id_contracts_contract_id_items {
<#
.SYNOPSIS
Get corporation contract items
.DESCRIPTION
Lists items of a particular contract

---

This route is cached for up to 3600 seconds
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/corporations/{corporation_id}/contracts/{contract_id}/items/",
            [Parameter(Mandatory=$true, HelpMessage="ID of a contract")]
            [int32]
            $contract_id,
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
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v1/corporations/{corporation_id}/contracts/{contract_id}/items/
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

    if ($contract_id -ne "") {
        $URI = $URI -replace '\$contract_id',"$contract_id"
    }

    if ($corporation_id -ne "") {
        $URI = $URI -replace '\$corporation_id',"$corporation_id"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEcorporations_corporation_id_contracts_contract_id_items



function get-EVECharactersCharacter_IdWallet { 
<# 
.SYNOPSIS
Get a character's wallet balance
.DESCRIPTION
Returns a character's wallet balance

---
Alternate route: `/dev/characters/{character_id}/wallet/`

Alternate route: `/legacy/characters/{character_id}/wallet/`

Alternate route: `/v1/characters/{character_id}/wallet/`

---
This route is cached for up to 120 seconds
#>
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/characters/{character_id}/wallet/",
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
    #  https://esi.tech.ccp.is/latest/characters/{character_id}/wallet/
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
 
 
function get-EVECharactersCharacter_IdWalletJournal { 
<# 
.SYNOPSIS
Get character wallet journal
.DESCRIPTION
Retrieve the given character's wallet journal going 30 days back

---
Alternate route: `/dev/characters/{character_id}/wallet/journal/`

Alternate route: `/legacy/characters/{character_id}/wallet/journal/`

Alternate route: `/v4/characters/{character_id}/wallet/journal/`

---
This route is cached for up to 3600 seconds
#>
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/characters/{character_id}/wallet/journal/",
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
    #  https://esi.tech.ccp.is/latest/characters/{character_id}/wallet/journal/
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
 
 
function get-EVECharactersCharacter_IdWalletTransactions { 
<# 
.SYNOPSIS
Get wallet transactions
.DESCRIPTION
Get wallet transactions of a character

---
Alternate route: `/dev/characters/{character_id}/wallet/transactions/`

Alternate route: `/legacy/characters/{character_id}/wallet/transactions/`

Alternate route: `/v1/characters/{character_id}/wallet/transactions/`

---
This route is cached for up to 3600 seconds
#>
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/characters/{character_id}/wallet/transactions/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE character ID")]
            [int32]
            $character_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="Only show transactions happened before the one referenced by this id")]
            [int64]
            $from_id,
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
    #  https://esi.tech.ccp.is/latest/characters/{character_id}/wallet/transactions/
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
    if ($from_id -ne "") { 
        if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "from_id=" + $from_id
        }
        elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "from_id=" + $from_id
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
 
 
function get-EVECorporationsCorporation_IdWallets { 
<# 
.SYNOPSIS
Returns a corporation's wallet balance
.DESCRIPTION
Get a corporation's wallets

---
Alternate route: `/dev/corporations/{corporation_id}/wallets/`

Alternate route: `/legacy/corporations/{corporation_id}/wallets/`

Alternate route: `/v1/corporations/{corporation_id}/wallets/`

---
This route is cached for up to 300 seconds

---
Requires one of the following EVE corporation role(s): Accountant, Junior_Accountant

#>
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/{corporation_id}/wallets/",
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
    #  https://esi.tech.ccp.is/latest/corporations/{corporation_id}/wallets/
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
 
 
function get-EVECorporationsCorporation_IdWalletsDivisionJournal { 
<# 
.SYNOPSIS
Get corporation wallet journal
.DESCRIPTION
Retrieve the given corporation's wallet journal for the given division going 30 days back

---
Alternate route: `/dev/corporations/{corporation_id}/wallets/{division}/journal/`

Alternate route: `/legacy/corporations/{corporation_id}/wallets/{division}/journal/`

Alternate route: `/v3/corporations/{corporation_id}/wallets/{division}/journal/`

---
This route is cached for up to 3600 seconds

---
Requires one of the following EVE corporation role(s): Accountant, Junior_Accountant

#>
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/{corporation_id}/wallets/{division}/journal/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE corporation ID")]
            [int32]
            $corporation_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$true, HelpMessage="Wallet key of the division to fetch journals from")]
            [int32]
            $division,
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
    #  https://esi.tech.ccp.is/latest/corporations/{corporation_id}/wallets/{division}/journal/
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
 
    if ($division -ne "") { 
        $URI = $URI -replace '\$division',"$division"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 
function get-EVECorporationsCorporation_IdWalletsDivisionTransactions { 
<# 
.SYNOPSIS
Get corporation wallet transactions
.DESCRIPTION
Get wallet transactions of a corporation

---
Alternate route: `/dev/corporations/{corporation_id}/wallets/{division}/transactions/`

Alternate route: `/legacy/corporations/{corporation_id}/wallets/{division}/transactions/`

Alternate route: `/v1/corporations/{corporation_id}/wallets/{division}/transactions/`

---
This route is cached for up to 3600 seconds

---
Requires one of the following EVE corporation role(s): Accountant, Junior_Accountant

#>
    Param( 
            [string]
            $URI = "https://esi.tech.ccp.is/latest/corporations/{corporation_id}/wallets/{division}/transactions/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE corporation ID")]
            [int32]
            $corporation_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility","singularity")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$true, HelpMessage="Wallet key of the division to fetch journals from")]
            [int32]
            $division,
            [Parameter(Mandatory=$false, HelpMessage="Only show journal entries happened before the transaction referenced by this id")]
            [int64]
            $from_id,
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
    #  https://esi.tech.ccp.is/latest/corporations/{corporation_id}/wallets/{division}/transactions/
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
    if ($from_id -ne "") { 
        if ($URI.Contains('?') -eq $false) {  
            $URI = $URI + "?" + "from_id=" + $from_id
        }
        elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "from_id=" + $from_id
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
 
    if ($division -ne "") { 
        $URI = $URI -replace '\$division',"$division"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
 
 

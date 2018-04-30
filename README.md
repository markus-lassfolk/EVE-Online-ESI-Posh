EVE-Online-ESI-Posh
=============

This ia a PowerShell module for querying the EVE Online ESI Api Restfull endpoint using the endpoints provided here : https://esi.tech.ccp.is/ 
There is also some experimental support for integrating with Discord.  

This is not fully featured or tested, but pull requests would be welcome!

#Instructions

```powershell
# One time setup
    # Download the repository
    # Unblock the zip
    # Extract the EVE-Online-ESI-Posh folder to a module path (e.g. $env:USERPROFILE\Documents\WindowsPowerShell\Modules\)

    #Simple alternative, if you have PowerShell 5, or the PowerShellGet module:
        Install-Module EVE-Online-ESI-Posh

# Import the module.
    Import-Module EVE-Online-ESI-Posh    #Alternatively, Import-Module \\Path\To\EVE-Online-ESI-Posh

# Get commands in the module
    Get-Command -Module EVE-Online-ESI-Posh

# Get help
    Get-Help Get-SEObject -Full
    Get-Help EVE-Online-ESI-Posh
```

# Examples 
Get-ChildItem .\EVE-Online-ESI-Posh\Public\*.psm1 | Import-Module -Force 
Get-ChildItem .\EVE-Online-ESI-Posh\Private\*.psm1 | Import-Module -Force 

# Get help about a function 
get-help get-EVEUniverseAncestries

# Get all character ancestries
get-EVEUniverseAncestries

# Locate CharacterID for a specific character using strict matching 
get-EVESearch -categories character -search vipeer -strict $true | convertfrom-json

## Get all Blueprint ID's and locations for Character - returned in raw JSON Format  
$BluePrints = get-EVECharactersCharacter_IdBlueprints -character_id $CharacterToken.CharacterID -token $access_token.access_token
$BluePrints.Content | convertfrom.JSON


# Launches IE to logon to EVE SSO and get an access token; 
# Specify your applications ClientID, SecretKey, CallBackURL and Scopes as specified in https://developers.eveonline.com/applications 
$access_token = login-EVESSOAuth -clientid $ClientID -secretkey $secretkey -callbackURL $callbackURL -Scopes $Scopes

# Refresh Access token with Refresh Token 
# Specify your applications ClientID, SecretKey, CallBackURL as specified in https://developers.eveonline.com/applications 
$access_token = refresh-EVESSOToken -refreshtoken $access_token.refresh_token -clientid $ClientID -secretkey $secretkey

# Verify Access token with EVESSO and grab Character Information  
$CharacterToken = get-EVESSOCharacterID -AccessToken $access_token.access_token
  
# Verify if Access Token should be renewed 
$access_token = verify-EVESSOAccessToken -access_token $access_token -CharacterToken $CharacterToken -ClientID $ClientID -secretkey $secretkey

 


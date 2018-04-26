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


get-EVEUniverseAncestries

get-EVESearch -categories character -search vipeer -strict $true | convertfrom-json



#

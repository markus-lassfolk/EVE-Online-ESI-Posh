
# Work in progress
$AuthInfo = Import-Csv "c:\temp\ESIAuthInfo.csv" -Delimiter ";"  | where Name -EQ "Full Auth"
$ClientID = $AuthInfo.ClientID
$secretkey = $AuthInfo.SecretKey

$callbackURL = $AuthInfo.CallbackURL
#$callbackURL = "http://localhost/oauth-callback"

$Scopes = $AuthInfo.Scopes
# $Scopes = "publicData esi-wallet.read_corporation_wallet.v1 esi-corporations.read_corporation_membership.v1 esi-fleets.read_fleet.v1 esi-fleets.write_fleet.v1 esi-fittings.read_fittings.v1 esi-fittings.write_fittings.v1 esi-markets.structure_markets.v1 esi-corporations.read_structures.v1 esi-characters.read_blueprints.v1 esi-characters.read_corporation_roles.v1 esi-killmails.read_corporation_killmails.v1 esi-corporations.track_members.v1 esi-wallet.read_corporation_wallets.v1 esi-corporations.read_divisions.v1 esi-corporations.read_titles.v1 esi-corporations.read_blueprints.v1 esi-contracts.read_corporation_contracts.v1 esi-corporations.read_starbases.v1 esi-industry.read_corporation_jobs.v1 esi-corporations.read_container_logs.v1 esi-industry.read_corporation_mining.v1 esi-planets.read_customs_offices.v1 esi-corporations.read_facilities.v1 esi-corporations.read_outposts.v1"

# Launches IE to logon to EVE SSO and get an access token;
# Specify your applications ClientID, SecretKey, CallBackURL and Scopes as specified in https://developers.eveonline.com/applications
$access_token = login-EVESSOAuth -clientid $ClientID -secretkey $secretkey -callbackURL $callbackURL -Scopes $Scopes

# Refresh Access Token with Refresh Token
# Specify your applications ClientID & SecretKey as specified in https://developers.eveonline.com/applications
$access_token = refresh-EVESSOToken -refreshtoken $access_token.refresh_token -clientid $ClientID -secretkey $secretkey

# Verify Access Token with EVESSO and grab Character Information. Combine CharacterInfo with Token as a object.
$CharacterToken = get-EVESSOCharacterID -Token $access_token

# Verify if Token need to be renewed
# Specify your applications ClientID & SecretKey as specified in https://developers.eveonline.com/applications
$CharacterToken = verify-EVESSOAccessToken -CharacterToken $CharacterToken -ClientID $ClientID -secretkey $secretkey

# Get all Blueprint ID's and locations for Character - returned in raw JSON Format
$BluePrints = get-EVECharactersCharacter_IdBlueprints -character_id $CharacterToken.CharacterID -token $CharacterToken.Token.access_token
$BluePrints.Content | ConvertFrom-Json


$ESICharacter = get-EVECharactersCharacter_Id -character_id $CharacterToken.CharacterID | ConvertFrom-Json

[int]$Page = "0"
$CorpAssets = $Null
do {
        $Page = $Page+1
        write-host $Page
        $EVECorporationsCorporation_IdAssets = get-EVECorporationsCorporation_IdAssets -corporation_id $ESICharacter.corporation_id -token $CharacterToken.Token.access_token -page $Page

        $EVECorporationsCorporation_IdAssetsPOSH = $EVECorporationsCorporation_IdAssets.Content | ConvertFrom-Json
        Write-Verbose "First ItemID $($EVECorporationsCorporation_IdAssetsPOSH[0].item_id)"
        Write-Verbose "Last ItemID $($EVECorporationsCorporation_IdAssetsPOSH[-1].item_id)"
        #return $EVECorporationsCorporation_IdAssetsPOSH;

        $CorpAssets = $CorpAssets + $EVECorporationsCorporation_IdAssetsPOSH
        Write-Verbose "Number of Corp Assets $($CorpAssets.Count) "
    } until ( $page -eq $EVECorporationsCorporation_IdAssets.Headers.'X-Pages' )


$invGroups = import-csv "C:\Users\markusla\Downloads\invGroups.csv\invGroups.csv"
$invTypes = import-csv "C:\Users\markusla\Downloads\invTypes.csv\invTypes.csv"

    $CorpAssets.Count
    foreach ($item in $CorpAssets | select type_id -Unique) {
        $Type = $invTypes | where typeid -eq $item.type_id
        $Group = $invGroups | where groupid -eq $Type.GroupID

        $CorpAssets | where type_id -eq $item.type_id | % {
            $_ | Add-Member -MemberType NoteProperty -Name TypeName -Value $Type.typeName -Force
            $_ | Add-Member -MemberType NoteProperty -Name GroupID -Value $Group.groupID -Force
            $_ | Add-Member -MemberType NoteProperty -Name GroupName -Value $Group.groupName -Force
        }
    }



$InterestingGroups = $invGroups | where groupName -match "supercarrier|Titan|carrier" | where { $_.GroupName -notlike "*Blueprint*"}
$invTypes | where typeName -like "Arkonor"
$invTypes | where typeid -eq "22"


$CorpAssets | where TypeName -like "*Gila*"
$CorpAssets | where groupName -match "supercarrier|Titan" | where { $_.GroupName -notlike "*Blueprint*"}





$NewToken = $esi_token | where character_name -like "Destel Aivoras"
$clientid = "8d71d87209db405588416cf03e6c1e75"
$secretkey = "R6yyGbQEl1a8HaVq8wS2TOKgCO73fhl7Ol6v4zhG"
$callbackURL = "https://auth.ip-org.net/sso/callback"

$access_token = refresh-EVESSOToken -refreshtoken $NewToken.refresh_token -clientid $ClientID -secretkey $secretkey
$access_token = refresh-EVESSOToken -refreshtoken $access_token.refresh_token -clientid $ClientID -secretkey $secretkey

# Verify Access Token with EVESSO and grab Character Information. Combine CharacterInfo with Token as a object.
$CharacterToken = get-EVESSOCharacterID -Token $access_token

# Verify if Token need to be renewed
# Specify your applications ClientID & SecretKey as specified in https://developers.eveonline.com/applications
$CharacterToken = verify-EVESSOAccessToken -CharacterToken $CharacterToken -ClientID $ClientID -secretkey $secretkey
$CharacterToken



[int]$Page = "0"
$CharacterAssets = $Null
do {
        $Page = $Page+1
        write-host $Page
        $EVECharactersCharacter_IdAssets = get-EVECharactersCharacter_IdAssets -character_id $CharacterToken.CharacterID -datasource tranquility -token $CharacterToken.Token.access_token -page $Page

        $EVECharactersCharacter_IdAssetsPOSH = $EVECharactersCharacter_IdAssets.Content | ConvertFrom-Json
        Write-Verbose "First ItemID $($EVECharactersCharacter_IdAssetsPOSH[0].item_id)"
        Write-Verbose "Last ItemID $($EVECharactersCharacter_IdAssetsPOSH[-1].item_id)"

        $CharacterAssets = $CharacterAssets + $EVECharactersCharacter_IdAssetsPOSH
        Write-Verbose "Number of Corp Assets $($CharacterAssets.Count) "
    } until ( $page -eq $EVECharactersCharacter_IdAssets.Headers.'X-Pages' )


    $CharacterAssets.Count
    foreach ($item in $CharacterAssets | select type_id -Unique) {
        $Type = $invTypes | where typeid -eq $item.type_id
        $Group = $invGroups | where groupid -eq $Type.GroupID

        $CharacterAssets | where type_id -eq $item.type_id | % {
            $_ | Add-Member -MemberType NoteProperty -Name TypeName -Value $Type.typeName -Force
            $_ | Add-Member -MemberType NoteProperty -Name GroupID -Value $Group.groupID -Force
            $_ | Add-Member -MemberType NoteProperty -Name GroupName -Value $Group.groupName -Force
        }
    }

$ESICharacterShip = get-EVECharactersCharacter_IdShip -character_id $CharacterToken.CharacterID -token $CharacterToken.Token.access_token | ConvertFrom-Json
$ESICharacterShip | ForEach-Object {
    $Type = $invTypes | where typeid -eq $_.ship_type_id
    $Group = $invGroups | where groupid -eq $Type.GroupID

    $_ | Add-Member -MemberType NoteProperty -Name TypeName -Value $Type.typeName -Force
    $_ | Add-Member -MemberType NoteProperty -Name GroupID -Value $Group.groupID -Force
    $_ | Add-Member -MemberType NoteProperty -Name GroupName -Value $Group.groupName -Force
    $_ | Add-Member -MemberType NoteProperty -Name type_id -Value $Type.typeID -Force
}

$CharacterAssets = $CharacterAssets + $ESICharacterShip
$CharacterAssets | where groupName -like "Titan" | where { $_.GroupName -notlike "*Blueprint*"}

$ESICharacterLocation = get-EVECharactersCharacter_IdLocation -character_id $CharacterToken.CharacterID -token $CharacterToken.Token.access_token | ConvertFrom-Json
get-EVEUniverseSystemsSystem_Id -system_id $ESICharacterLocation.solar_system_id | ConvertFrom-Json








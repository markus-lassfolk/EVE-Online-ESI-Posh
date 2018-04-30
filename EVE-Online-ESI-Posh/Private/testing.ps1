
# Work in progress
$AuthInfo = Import-Csv ".\EVE-Online-ESI-Posh\Auth-info\ESI Token info.csv" -Delimiter ";"  | where Name -EQ "TEST Auth"
$ClientID = $AuthInfo.ClientID
$secretkey = $AuthInfo.SecretKey

$callbackURL = $AuthInfo.CallbackURL
#$callbackURL = "http://localhost/"

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
$BluePrints.Content | convertfrom.JSON


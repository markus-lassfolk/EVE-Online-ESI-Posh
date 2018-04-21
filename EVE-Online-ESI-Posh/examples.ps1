$baseUri = "https://esi.tech.ccp.is/"



$eveuniverseancestriesjson = get-eve-universe-ancestries -datasource Tranquility -language en-us -outformat json
$eveuniverseancestriesPS = get-eve-universe-ancestries -datasource Tranquility -language en-us -outformat PS

$EVEESIBloodlinesJSON = get-eve-universe-bloodlines -datasource Tranquility -language en-us -outformat json
$EVEESIBloodlinesPS = get-eve-universe-bloodlines -datasource Tranquility -language en-us -outformat PS

$EVEUniverseCategoriesPS = get-eve-universe-categories -datasource Tranquility -outformat PS
$EVEUniverseCategoryDetailsPS = get-eve-universe-categories-details -datasource Tranquility -category_id 91 -language en-us -outformat ps

$EVEUniverseCategoryDetailsInfoPS = New-EVE-Universe-FullCategorys -datasource Tranquility -language en-us -outformat PS

$EVEUniverseConstellationDetailsPS = get-eve-universe-constellation-details -datasource Tranquility -constellation_id 21000314 -language en-us -outformat PS

$EVEUniverseFactions = get-eve-universe-factions -datasource Tranquility -language en-us -outformat PS
$EVEUniverseGraphicsDetails = get-eve-universe-graphics-details -datasource Tranquility -graphics_id 20505 -outformat PS

$EVEUniverseGroupsPS = get-eve-universe-groups -datasource Tranquility -outformat PS
$EVEUniverseGroupDetailsPS = get-eve-universe-group-details -datasource Tranquility -group_id 1886 -language en-us -outformat PS


$EVEMetaStatusjson = get-eve-meta-status -version latest -outformat json
$EVEMetaStatusPS = get-eve-meta-status -version latest -outformat PS
$EVEMetaStatusPS | where status -ne "green"

$EVEMetaVersionsPS = get-eve-meta-versions -outformat PS


$LatestJSON = get-eve-swagger-specifics -Swagger latest -datasource tranquility -outformat json
$LatestJSON.Content | ConvertFrom-Json | select basepath
($LatestJSON.Content | ConvertFrom-Json).definitions.bad_request
($LatestJSON.Content | ConvertFrom-Json).host
($LatestJSON.Content | ConvertFrom-Json).info

$EVESSODataSources = ($LatestJSON.Content | ConvertFrom-Json).parameters.datasource.enum 
$EVEESILanguages = ($LatestJSON.Content | ConvertFrom-Json).parameters.language.enum
$EVESSOAuthorizationURL = ($LatestJSON.Content | ConvertFrom-Json).securitydefinitions.evesso.authorizationurl
$EVESSOScopes = ($LatestJSON.Content | ConvertFrom-Json).securitydefinitions.evesso.scopes
$EVEESIPaths = ($LatestJSON.Content | ConvertFrom-Json).paths



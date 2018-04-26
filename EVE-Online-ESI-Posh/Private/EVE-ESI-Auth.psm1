
# Work in progress
$AuthInfo = Import-Csv "C:\Users\markusla\Documents\GitHub\EVE-Online-ESI-Posh\EVE-Online-ESI-Posh\Auth-info\ESI Token info.csv" -Delimiter ";"


$LoginServerURL = "login.eveonline.com"
$EVESSOURL = "https://{login server base url}/oauth/authorize?response_type={response type}&redirect_uri={redirect uri}&client_id={client id}&scope={scopes}&state={state}"
$ResponseType = "code"
$RedirectionURL = $AuthInfo.CallbackURL
$ClientID = $AuthInfo.ClientID
$Scopes = $AuthInfo.Scopes
$State = "PoshSSO"

$URI = $EVESSOURL -replace "{login server base url}",$LoginServerURL -replace "{response type}",$ResponseType -replace "{redirect uri}",$RedirectionURL -replace "{client id}",$ClientID -replace "{scopes}",$Scopes -replace "{state}",$State

$ie = New-Object -comobject InternetExplorer.Application 
$ie.visible = $true 
$ie.silent = $true 
$ie.Navigate( $URI )
    while( $ie.busy){Start-Sleep 1} 


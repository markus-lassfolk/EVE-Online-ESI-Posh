

<#
(Invoke-WebRequest -Method Get -Uri "https://api.evetrace.com/api/v1/corporation/98210135").Content | ConvertFrom-Json

((Invoke-WebRequest -Method Get -Uri "https://api.evetrace.com/api/v1/corporation/98210135/Members").Content | ConvertFrom-Json).pilots

((Invoke-WebRequest -Method Get -Uri "https://api.evetrace.com/api/v1/corporation/98210135/MemberHistory").Content | ConvertFrom-Json).enploymentEntries | Group-Object pilotid | Sort-Object count

((Invoke-WebRequest -Method Get -Uri "https://api.evetrace.com/api/v1/corporation/98210135/MemberHistory").Content | ConvertFrom-Json).enploymentEntries | where pilotid -EQ 1274978529




s_batman: https://api.evetrace.com/api/v1/corporation/%7BCorpID%7D/
[10:37 AM] s_batman: https://api.evetrace.com/api/v1/corporation/%7BCorpID%7D/Members
[10:38 AM] s_batman: https://api.evetrace.com/api/v1/corporation/%7BCorpID%7D/MemberHistory



$url = "https://t.co/ljeDwTwjZe"
$ie = New-Object -comobject InternetExplorer.Application
$ie.visible = $true
$ie.silent = $true
$ie.Navigate( $url )
while ( $ie.busy) {Start-Sleep 1}



$ie.Document

#>

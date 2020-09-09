


function login-EVESSOAuth ($clientid, $secretkey, $callbackURL, $Scopes) {

    $ascope = $Scopes
    $AuthUrl = "https://login.eveonline.com/oauth/authorize/"
    $URL = $($AuthUrl)+'?response_type=code&redirect_uri='+$($callbackURL)+'&client_id='+$($clientid)+'&scope='+$($ascope)+'&state=defaultState'

    $ie = New-Object -comobject InternetExplorer.Application
    $ie.visible = $true
    $ie.silent = $true
    Start-Sleep -Seconds 1
    $ie.Navigate( $url )
    while( $ie.busy){Start-Sleep 1}

    do {start-sleep -Milliseconds 500 } until ($ie.LocationURL -like $($callbackURL)+"?code*")
    while( $ie.busy){Start-Sleep 1}

    $ReturnURL = $ie.LocationURL
    $ReturnURL.Split('?&') | foreach { if ($_ -match "code") { $Code = ($_ -replace("code=",""))}  }
    Write-Verbose "Returned Access Code: $($Code)"


    $access_token = get-EVESSOToken -EncodedText -clientid $clientid -secretkey $secretkey -code $Code
    Start-Sleep 2
    $ie.Quit()
    return $access_token ;
}


function get-EVESSOToken ($clientid, $secretkey, $code) {

    $uri = "https://login.eveonline.com/oauth/token"
    $header = @{
          'Authorization' = ("Basic {0}" -f ([System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $ClientID, $secretkey )))))
          'Content-Type' = "application/x-www-form-urlencoded"
           'Accept' = "application/json"
           'Host' = "login.eveonline.com"
     }
    $parameters = @{
    'grant_type' = 'authorization_code'
    'code' = $code
     }

    $access_token = $parameters | Invoke-RestMethod -Uri $uri -Method Post -Headers $header -Verbose
    return $access_token ;
}


function refresh-EVESSOToken ($refreshtoken, $clientid, $secretkey) {

    $uri = "https://login.eveonline.com/oauth/token"
    $header = @{
          'Authorization' = ("Basic {0}" -f ([System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $ClientID, $secretkey )))))
         #'Content-Type' = "application/json"
          'Content-Type' = "application/x-www-form-urlencoded"
           'Accept' = "application/json"
           'Host' = "login.eveonline.com"
     }

    $parameters = @{

      'grant_type' = 'refresh_token'
      'refresh_token' = [string]$($refreshtoken)

     }
     $parameters | Invoke-RestMethod -Uri $uri -Method Post -Headers $header -Verbose 
 }


 



function verify-EVESSOAccessToken ($CharacterToken, $ClientID, $secretkey) {
    $Token = $CharacterToken.token
    if ($($CharacterToken.ExpiresOn -replace "T"," ") -lt $((get-date).ToUniversalTime().AddMinutes(+1) | get-date -Format "yyyy-MM-dd HH:mm:ss")) {
        $Token = refresh-EVESSOToken -refreshtoken $token.refresh_token -clientid $ClientID -secretkey $secretkey

        $CharacterToken = get-EVESSOCharacterID -Token $Token
    }

    $CharacterToken
}


function get-EVESSOCharacterID ($Token) {

    $uri = "https://login.eveonline.com/oauth/verify"
    $header = @{
          'Authorization' = "Bearer " + $token.access_token
          'Content-Type' = "application/x-www-form-urlencoded"
           'Accept' = "application/json"
           'Host' = "login.eveonline.com"
     }

    $parameters = $null

    $CharacterToken = $parameters | Invoke-RestMethod -Uri $uri -Method Get -Headers $header -Verbose

    $CharacterToken | Add-Member -MemberType NoteProperty -Name Token -Value $token -Force
    return $CharacterToken ;
}




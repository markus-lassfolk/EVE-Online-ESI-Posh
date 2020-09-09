function get-EVEcharacters_character_id_calendar {
<#
.SYNOPSIS
List calendar event summaries
.DESCRIPTION
Get 50 event summaries from the calendar. If no from_event ID is given, the resource will return the next 50 chronological event summaries from now. If a from_event ID is specified, it will return the next 50 chronological event summaries from after that event

---

This route is cached for up to 5 seconds
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/characters/{character_id}/calendar/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE character ID")]
            [int32]
            $character_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$false, HelpMessage="The event ID to retrieve events from")]
            [int32]
            $from_event,
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
    #  https://esi.evetech.net/v1/characters/{character_id}/calendar/
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
    if ($from_event -ne "") {
        if ($URI.Contains('?') -eq $false) {
            $URI = $URI + "?" + "from_event=" + $from_event
        }
        elseif ($URI.Contains('?') -eq $True) {
            $URI = $URI + "&" + "from_event=" + $from_event
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
Export-ModuleMember -Function get-EVEcharacters_character_id_calendar


function get-EVEcharacters_character_id_calendar_event_id {
<#
.SYNOPSIS
Get an event
.DESCRIPTION
Get all the information for a specific event

---

This route is cached for up to 5 seconds
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v3/characters/{character_id}/calendar/{event_id}/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE character ID")]
            [int32]
            $character_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$true, HelpMessage="The id of the event requested")]
            [int32]
            $event_id,
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
    #  https://esi.evetech.net/v3/characters/{character_id}/calendar/{event_id}/
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

    if ($event_id -ne "") {
        $URI = $URI -replace '\$event_id',"$event_id"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEcharacters_character_id_calendar_event_id


function get-EVEcharacters_character_id_calendar_event_id_attendees {
<#
.SYNOPSIS
Get attendees
.DESCRIPTION
Get all invited attendees for a given event

---

This route is cached for up to 600 seconds
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v1/characters/{character_id}/calendar/{event_id}/attendees/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE character ID")]
            [int32]
            $character_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$true, HelpMessage="The id of the event requested")]
            [int32]
            $event_id,
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
    #  https://esi.evetech.net/v1/characters/{character_id}/calendar/{event_id}/attendees/
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

    if ($event_id -ne "") {
        $URI = $URI -replace '\$event_id',"$event_id"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function get-EVEcharacters_character_id_calendar_event_id_attendees


function put-EVEcharacters_character_id_calendar_event_id {
<#
.SYNOPSIS
Respond to an event
.DESCRIPTION
Set your response status to an event

---

This route is cached for up to 5 seconds
#>
    Param(
            [string]
            $URI = "https://esi.evetech.net/v3/characters/{character_id}/calendar/{event_id}/",
            [Parameter(Mandatory=$true, HelpMessage="An EVE character ID")]
            [int32]
            $character_id,
            [Parameter(Mandatory=$false, HelpMessage="The server name you would like data from")]
            [ValidateSet("tranquility")]
            [string]
            $datasource = "tranquility",
            [Parameter(Mandatory=$true, HelpMessage="The ID of the event requested")]
            [int32]
            $event_id,
            [Parameter(Mandatory=$true, HelpMessage="The response value to set, overriding current value")]
            [object]
            $response,
            [Parameter(Mandatory=$false, HelpMessage="Access token to use if unable to set a header")]
            [string]
            $token,
            [Parameter(Mandatory=$false, HelpMessage="Output Format of Result. PS Returns an PBObject with just the content. JSON Returns the raw json object. PSfull returns a PSObject with the content plus headers that can be used for more advanced scripts.")]
            [ValidateSet("PS","json","PSfull")]
            $OutputType = "PS"
    ) #End of Param
    #  Example URI
    #  https://esi.evetech.net/v3/characters/{character_id}/calendar/{event_id}/
    $Method = "put"
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
    $Body = @{
        'response' = "$response"
    }

    if ($character_id -ne "") {
        $URI = $URI -replace '\$character_id',"$character_id"
    }

    if ($event_id -ne "") {
        $URI = $URI -replace '\$event_id',"$event_id"
    }
    $URI = $URI -replace "$True","True" -replace "$False","False"
    invoke-EVEWebRequest -URI $URI -method $method -header $Header -body $body -OutputType $OutputType
}
Export-ModuleMember -Function put-EVEcharacters_character_id_calendar_event_id



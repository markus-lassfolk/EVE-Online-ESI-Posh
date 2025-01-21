# Set the working directory
Set-Location "C:\GitHub\EVE-Online-ESI-Posh\"

# Download the Swagger file
$ModSwagger = Invoke-WebRequest -ContentType "application/json" -Uri https://esi.evetech.net/_latest/swagger.json?datasource=tranquility -Verbose | ConvertFrom-Json

# Get the current module manifest
$ManiFestFile = Get-Item .\EVE-Online-ESI-Posh\EVE-Online-ESI-Posh.psd1
$CurrentSwaggerVersion = (Get-Content $ManiFestFile.FullName | Where-Object { $_ -like "ModuleVersion = *" }).Split("'")[1]

# Check if the Swagger version has changed
if ($CurrentSwaggerVersion -eq $null -or $CurrentSwaggerVersion -eq "" -or $CurrentSwaggerVersion -eq $ModSwagger.info.version) {
    Write-Host "Nothing to do, version is the same as current Swagger spec. Version is $CurrentSwaggerVersion"
    return
}

# Process all path endpoints
$AllPathEndpoints = $ModSwagger.paths.PSObject.Properties
$BuildFunctions = foreach ($PathEndpoint in $AllPathEndpoints) {
    $CurrentEndPoint = $PathEndpoint.Value
    $Methods = $CurrentEndPoint.PSObject.Properties.Name

    foreach ($Method in $Methods) {
        $CurrentEndPointDetails = $CurrentEndPoint.$Method

        # Create function metadata
        $ESIName = ($PathEndpoint.Name).TrimStart("/").TrimEnd("/").Replace("/", " ")
        $ESIName = (Get-Culture).TextInfo.ToTitleCase($ESIName)
        $ESIFunctionName = $CurrentEndPointDetails.operationId -replace "$($Method)_", "$($Method)-EVE"

        # Process parameters
        $ESIParameters = foreach ($ESIParameter in $CurrentEndPointDetails.parameters) {
            if ($ESIParameter.'$ref' -like "*#/parameters/*") {
                $ModSwagger.parameters.$($ESIParameter.'$ref'.ToString().Split("/")[-1])
            } else {
                $ESIParameter
            }
        }

        # Return the function definition
        @{
            FunctionName = $ESIFunctionName
            Version = $ModSwagger.info.version
            Swagger_Version = $ModSwagger.swagger
            ESIMethod = $Method
            ESIPath = $PathEndpoint.Name
            ESIParameters = $ESIParameters
            ESITags = $CurrentEndPointDetails.tags
            ESISummary = $CurrentEndPointDetails.summary
            ESIDescription = $CurrentEndPointDetails.description
            ESIOperationsID = $CurrentEndPointDetails.operationId
        }
    }
}

# Update the module manifest
Update-ModuleManifest -Path $ManiFestFile.FullName -ModuleVersion $ModSwagger.info.version -Description $ModSwagger.info.description -Author "Markus Lassfolk"

# Create module files for each tag
$BuildFunctions | ForEach-Object {
    $_.ESITags | ForEach-Object {
        $Tag = $_
        $FileName = ".\EVE-Online-ESI-Posh\Public\$Tag.psm1"
        $FunctionsForTag = $BuildFunctions | Where-Object { $_.ESITags -contains $Tag }

        # Build the content for each tag file
        $FunctionContent = @()
        foreach ($Function in $FunctionsForTag) {
            $FunctionContent += @"
function $($Function.FunctionName) {
<#
.SYNOPSIS
$($Function.ESISummary)

.DESCRIPTION
$($Function.ESIDescription)
#>
    Param(
        [string] \$URI = `"https://esi.evetech.net$($Function.ESIPath)`",
"@

            foreach ($Param in $Function.ESIParameters) {
                $Mandatory = if ($Param.required -eq $true) { "[Parameter(Mandatory=\$true)]" } else { "[Parameter(Mandatory=\$false)]" }
                $Type = if ($Param.type -eq "integer") { "[int]" } else { "[string]" }
                $Default = if ($Param.default) { " = `"$(($Param.default) -replace '"', '`"')`"" } else { "" }
                $FunctionContent += "        $Mandatory $Type `$($Param.name -replace '-', '_')$Default,"
            }

            $FunctionContent += @"
        [ValidateSet('PS', 'json', 'PSfull')]
        [string] \$OutputType = `"PS`"
    )

    \$URI = \$URI -replace `"{"`, `"$`" -replace `"}"`, `"`
    Invoke-EVEWebRequest -URI \$URI -Method $($Function.ESIMethod) -OutputType \$OutputType
}
Export-ModuleMember -Function $($Function.FunctionName)
"@
        }

        # Write functions to the corresponding file
        Set-Content -Path $FileName -Value ($FunctionContent -join "`n") -Force
        Write-Host "Generated module: $FileName"
    }
}

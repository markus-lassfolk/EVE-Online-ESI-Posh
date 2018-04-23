


$ModSwagger = get-content 'C:\SwaggerSpecs\LatestTranq.json' | ConvertFrom-Json
$ESIHost = $ModSwagger.host


$AllPathEndpoints = $ModSwagger.paths | get-member | where MemberType -eq "NoteProperty" | select -First 1 

foreach ($PathEndpoint in $AllPathEndpoints) { 

    
    $CurrentEndPoint = $ModSwagger.paths.($PathEndpoint.name)
    $Method = ($CurrentEndPoint | get-member | where MemberType -like NoteProperty).Name 
    $CurrentEndPointDetails = $ModSwagger.paths.($PathEndpoint.name).$Method


    $ESIName = ($PathEndpoint.Name).TrimStart("/").TrimEnd("/").replace("/"," ")
    $ESIName = (Get-Culture).TextInfo.ToTitleCase( $ESIName )
    $ESIFunctionName = $Method+"-EVE"+$ESIName.trim().replace(" ","")
    
    $ESIParameters
    
    
    foreach ($ESIParameter in $CurrentEndPointDetails.parameters.'$ref') { 
    
    $ESIParameter.ToString().split("/")[-1]

    $ModSwagger.parameters

    
    } 



    $NewFunction = @{
    
    'FunctionName' = $ESIFunctionName 
    'ESIMethod' = $Method
    'ESIPath' = $PathEndpoint.Name
    'ESIParameters' = $ESIParameters
    $ESITags
    $ESISUmmary
    $ESIDescription
    $ESIOperationsID
    $ESIResponses
    $ESICachedSeconds

    
    
    }

}

$ESIFunctionName 
$ESIMethod
$ESIPath
$ESIParameters
$ESITags
$ESISUmmary
$ESIDescription
$ESIOperationsID
$ESIResponses
$ESICachedSeconds







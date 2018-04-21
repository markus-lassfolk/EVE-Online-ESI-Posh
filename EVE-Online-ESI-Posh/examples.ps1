


$EVEMetaStatusjson = get-eve-meta-status -version latest -outformat json
$EVEMetaStatusPS = get-eve-meta-status -version latest -outformat PS
$EVEMetaStatusPS | where status -ne "green"

$EVEMetaVersionsPS = get-eve-meta-versions -outformat PS




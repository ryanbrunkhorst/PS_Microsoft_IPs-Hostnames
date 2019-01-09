$json = (Invoke-RestMethod -Method Get -Headers $headers -ContentType 'application/json' -Uri "https://endpoints.office.com/endpoints/worldwide?clientrequestid=b10c5ed1-bad1-445f-b386-b919946339a7")
$ips = ($json | select -ExpandProperty "ips" -ErrorAction Ignore)
$urls = ($json | select -ExpandProperty "urls" -ErrorAction Ignore)
$ips | add-content "$PSScriptRoot\o365_ips.txt"
$urls | add-content "$PSScriptRoot\o365_urls.txt"
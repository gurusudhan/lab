# update IP for putty saved session
$wsl_ip = (wsl hostname -I).trim()
Write-Host "WSL Machine IP: "$wsl_ip""
Set-Itemproperty -path 'HKCU:\SOFTWARE\SimonTatham\PuTTY\Sessions\wsl' -Name 'HostName' -value $wsl_ip

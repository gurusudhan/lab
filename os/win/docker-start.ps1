# add a directory to path
$env:Path += ";C:\Program Files\Docker\Docker\resources\bin\"

# starting a process
Start-Process "C:\Windows\system32\wsl.exe" -WindowStyle Hidden
Start-Process "C:\Program Files\Docker\Docker\resources\bin\docker.exe" -WindowStyle Hidden
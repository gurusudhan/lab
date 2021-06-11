
# Snippets

Get Hostname and Username
```ps1
# get hostname
$env:COMPUTERNAME
[System.Net.Dns]::GetHostName()
[Environment]::MachineName

# get username
$env:USERNAME
[Environment]::UserName

# get Hostname\Username
[System.Security.Principal.WindowsIdentity]::GetCurrent().Name
```

Get script path
```ps1
$ScriptPath = Split-Path -parent $MyInvocation.MyCommand.Definition
```

Get Registry values
```ps1
# get hostname from putty saved session
Get-ItemProperty -Path 'HKCU:\SOFTWARE\SimonTatham\PuTTY\Sessions\wsl' -Name HostName
```

Update Putty sesion hostname
```ps1
# update IP for putty saved session
$wsl_ip = (wsl hostname -I).trim()
Write-Host "WSL Machine IP: "$wsl_ip""
Set-Itemproperty -path 'HKCU:\SOFTWARE\SimonTatham\PuTTY\Sessions\wsl' -Name 'HostName' -value $wsl_ip
```

Schedule a Task
```ps1
# register a task in Task Scheduler
$user_name = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
[xml]$schedule_template = Get-Content '.\BashSSH-task-schedule-template.xml'
$schedule_template.Task.Triggers.LogonTrigger.UserId = "$user_name"
$schedule_template.Task.RegistrationInfo.Author = "$user_name"
$schedule_template.save("$pwd\BashSSH-task-schedule.xml")
Register-ScheduledTask -xml (Get-Content "$pwd\BashSSH-task-schedule.xml" | Out-String) -TaskName "Start Bash SSH Server" -User "$user_name"
```

# Reference

## Guide

## Syntax
**Comment**
```ps1
# comment starts with #
# comment block with more of #
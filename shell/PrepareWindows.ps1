# http://techrena.net/disable-ie-set-up-first-run-welcome-screen/
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Internet Explorer\Main" -Name "DisableFirstRunCustomize" -Value 1 -PropertyType "DWord" -Force | Out-Null
Write-Output "IE first run welcome screen has been disabled."

Write-Output 'Setting Windows Update service to Manual startup type.'
Set-Service -Name wuauserv -StartupType Manual

#Set-ExecutionPolicy Unrestricted

# Ensure there is a profile file so we can get tab completion
New-Item -ItemType Directory $(Split-Path $profile -Parent) -Force
Set-Content -Path $profile -Encoding UTF8 -Value "" -Force

winrm set winrm/config/winrs '@{MaxMemoryPerShellMB="2048"}'


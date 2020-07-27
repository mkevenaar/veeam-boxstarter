# Description: Boxstarter script
# Author: Maurice Kevenaar
# This boxstarter scrips installs VONE Server.

New-Item -Path "$env:systemdrive\ProgramData\ChocoCache" -ItemType directory -Force | Out-Null
$common = "--cacheLocation=`"$env:systemdrive\ProgramData\ChocoCache`""


$bstrappackage = "-bootstrapPackage"
$scriptsDir = $Boxstarter['ScriptToCall']
$strpos = $scriptsDir.IndexOf($bstrappackage)
$scriptsDir = $scriptsDir.Substring($strpos + $bstrappackage.Length)
$scriptsDir = $scriptsDir.TrimStart("'", " ")
$scriptsDir = $scriptsDir.TrimEnd("'", " ")
$scriptsDir = $scriptsDir.Substring(0, $scriptsDir.LastIndexOf("\"))

$commonDir = $scriptsDir.Substring(0, $scriptsDir.LastIndexOf("\"))
$commonDir += "\common_scripts"

Invoke-Expression "${commonDir}\setup_chocolatey.ps1"
Invoke-Expression "${scriptsDir}\common_packages.ps1"
. "${scriptsDir}\settings.ps1"

$vone_monitor_server_settings = @('vone_perfCache', 'vone_installationType', 'vone_vcSelectedType', 'vone_hvType', 'vone_vcHost', 'vone_vcPort', 'vone_vcHostUser', 'vone_vcHostPass', 'vone_backupAddLater', 'vone_backupAddType', 'vone_backupAddHost', 'vone_backupAddUser', 'vone_backupAddPass', 'vone_licenseFile', 'vone_sqlServer', 'vone_sqlDatabase', 'vone_sqlAuthentication', 'vone_sqlUsername', 'vone_sqlPassword', 'vone_username', 'vone_password', 'vone_create')
$vone_monitor_server_params = Get-VONE-Params($vone_monitor_server_settings)

$vone_reporter_server_settings = @('vone_installationType', 'vone_vcSelectedType', 'vone_hvType', 'vone_vcHost', 'vone_vcPort', 'vone_vcHostUser', 'vone_vcHostPass', 'vone_backupAddLater', 'vone_backupAddType', 'vone_backupAddHost', 'vone_backupAddUser', 'vone_backupAddPass', 'vone_licenseFile', 'vone_sqlServer', 'vone_sqlDatabase', 'vone_sqlAuthentication', 'vone_sqlUsername', 'vone_sqlPassword', 'vone_username', 'vone_password', 'vone_create')
$vone_reporter_server_params = Get-VONE-Params($vone_reporter_server_settings)

$vone_agent_settings = @('vone_username', 'vone_password', 'vone_create', 'vone_agentServicePort')
$vone_agent_params = Get-VONE-Params($vone_agent_settings)

Write-Output "Installing VONE Server"

choco upgrade vcredist140 $common
choco upgrade SQL2012.SMO $common
choco upgrade ms-reportviewer2015 $common
choco install IIS-WebServer WAS-ConfigurationAPI --source windowsfeatures $common
choco upgrade veeam-one-monitor-server --params "${vone_monitor_server_params}" $common
choco upgrade veeam-one-reporter-server --params "${vone_reporter_server_params}" $common
choco upgrade veeam-one-agent --params "/server ${vone_agent_params}" $common

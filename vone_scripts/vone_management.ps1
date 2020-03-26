# Description: Boxstarter script
# Author: Maurice Kevenaar
# This boxstarter scrips installs VONE Management..

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

$vone_monitor_client_settings = @('vone_monitorServer')
$vone_monitor_client_parameters = Get-VONE-Params($vone_monitor_client_settings)

Write-Output "Installing VONE Management console"

choco upgrade veeam-one-monitor-client --params "${vone_monitor_client_parameters}" $common

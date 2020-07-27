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

$vone_agent_settings = @('vone_server', 'vone_username', 'vone_password', 'vone_create', 'vone_agentServicePort')
$vone_agent_params = Get-VONE-Params($vone_agent_settings)

Write-Output "Installing VONE Agent"

choco upgrade veeam-one-agent --params "/server ${vone_agent_params}" $common


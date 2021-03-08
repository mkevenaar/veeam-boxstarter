# Description: Boxstarter script
# Author: Maurice Kevenaar
# This boxstarter scrips installs all required parts of VBO.

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

Write-Output "Installing VBO Management console"
choco upgrade veeam-backup-for-microsoft-office-365-console $common
choco upgrade veeam-explorer-for-microsoft-exchange-o365 $common
choco upgrade veeam-explorer-for-microsoft-sharepoint-o365 $common
choco upgrade veeam-explorer-for-microsoft-teams-o365 $common
choco upgrade veeam-backup-for-microsoft-office-365-management $common

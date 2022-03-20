# Description: Boxstarter script
# Author: Maurice Kevenaar
# This boxstarter scrips installs all required parts of VBM.

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

Write-Output "Installing VBM Management console"
choco upgrade veeam-backup-for-microsoft-365-console $common
choco upgrade veeam-explorer-for-microsoft-exchange-m365 $common
choco upgrade veeam-explorer-for-microsoft-sharepoint-m365 $common
choco upgrade veeam-explorer-for-microsoft-teams-m365 $common
choco upgrade veeam-backup-for-microsoft-365-management $common

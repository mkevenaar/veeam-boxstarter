# Description: Boxstarter script
# Author: Maurice Kevenaar
# This boxstarter scrips installs VBR Management..

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

Write-Output "Installing VBR Management console"
choco upgrade veeam-backup-and-replication-console $common
choco upgrade veeam-explorer-for-microsoft-active-directory $common
choco upgrade veeam-explorer-for-microsoft-exchange $common
choco upgrade veeam-explorer-for-microsoft-sharepoint $common
choco upgrade veeam-explorer-for-microsoft-sql-server $common
choco upgrade veeam-explorer-for-microsoft-teams $common
choco upgrade veeam-explorer-for-oracle $common
choco upgrade veeam-backup-and-replication-management $common

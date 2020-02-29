# Description: Boxstarter script
# Author: Maurice Kevenaar
# This boxstarter scrips installs SQL Express.

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
choco upgrade veeam-backup-and-replication-console
choco upgrade veeam-explorer-for-microsoft-active-directory
choco upgrade veeam-explorer-for-microsoft-exchange
choco upgrade veeam-explorer-for-microsoft-sharepoint
choco upgrade veeam-explorer-for-microsoft-sql-server
choco upgrade veeam-explorer-for-oracle
choco upgrade veeam-backup-and-replication-management

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

Invoke-Expression (Join-Path $scriptsDir 'settings.ps1')

Write-Output "Installing SQL Server Express"
choco upgrade sql-server-express -y --no-progress

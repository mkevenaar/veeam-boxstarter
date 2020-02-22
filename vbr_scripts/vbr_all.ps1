# Description: Boxstarter script
# Author: Maurice Kevenaar
# This boxstarter scrips installs all required parts of VBR.

$bstrappackage = "-bootstrapPackage"
$scriptsDir = $Boxstarter['ScriptToCall']
$strpos = $scriptsDir.IndexOf($bstrappackage)
$scriptsDir = $scriptsDir.Substring($strpos + $bstrappackage.Length)
$scriptsDir = $scriptsDir.TrimStart("'", " ")
$scriptsDir = $scriptsDir.TrimEnd("'", " ")
$scriptsDir = $scriptsDir.Substring(0, $scriptsDir.LastIndexOf("\"))

Invoke-Expression (Join-Path $scriptsDir 'settings.ps1')
Invoke-Expression (Join-Path $scriptsDir 'vbr_sql_express.ps1')

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

$commonDir = $scriptsDir.Substring(0, $scriptsDir.LastIndexOf("\"))
$commonDir += "\common_scripts"

Invoke-Expression "${commonDir}\setup_chocolatey.ps1"

Invoke-Expression (Join-Path $scriptsDir 'vbr_sql_express.ps1')
Invoke-Expression (Join-Path $scriptsDir 'vbr_server.ps1')
Invoke-Expression (Join-Path $scriptsDir 'vbr_management.ps1')

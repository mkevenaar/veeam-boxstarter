# Description: Boxstarter script
# Author: Maurice Kevenaar
# This boxstarter scrips installs VONE WebUI.

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

$vone_reporter_webui_settings = @('vone_iisSitePort', 'vone_sslThumbprint', 'vone_installationType', 'vone_sqlServer', 'vone_sqlDatabase', 'vone_sqlAuthentication', 'vone_sqlUsername', 'vone_sqlPassword', 'vone_username', 'vone_password', 'vone_create')
$vone_reporter_webui_parameterts = Get-VONE-Params($vone_reporter_webui_settings)

Write-Output "Installing VONE WebUI"

choco install IIS-WebServerRole IIS-WindowsAuthentication IIS-WebSockets IIS-ASPNET45 IIS-NetFxExtensibility45 WAS-ConfigurationAPI IIS-ManagementConsole IIS-ManagementService --source WindowsFeatures $common
choco upgrade veeam-one-reporter-web --params "${vone_reporter_webui_parameterts}" $common
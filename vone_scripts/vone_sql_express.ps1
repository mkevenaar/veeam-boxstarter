# Description: Boxstarter script
# Author: Maurice Kevenaar
# This boxstarter scrips installs SQL Express.

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

Write-Output "Installing SQL Server Express"
Invoke-CommandAs -ScriptBlock { choco upgrade sql-server-express $common } -ComputerName $env:COMPUTERNAME -AsInteractive $env:USERNAME

# Installing SSMS, as I believe this should be part of the installation.
Invoke-CommandAs -ScriptBlock { choco upgrade ssms $common } -ComputerName $env:COMPUTERNAME -AsInteractive $env:USERNAME


if (Test-PendingReboot) { 
    Invoke-Reboot
}
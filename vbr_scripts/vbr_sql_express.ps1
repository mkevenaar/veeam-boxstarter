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

$PSversion = $PSVersionTable.PSVersion.Major
if ($PSversion -lt "5") {
    Write-Warning "  ** PowerShell < v5 detected."
	Write-Warning "  ** This scripts installs software via the PowerShell Gallery and thus requires PowerShell v5+."
	Write-Warning "  ** If PowerShell v5 was installed as a dependency, you need to reboot and reinstall this package."
	throw
}

$invokeCommandAs = Get-Command -Name 'Invoke-CommandAs' -Module 'Invoke-CommandAs' -ErrorAction 'SilentlyContinue'

if ( $null -eq $invokeCommandAs ){
    Get-PackageProvider -Name NuGet -Force
    Install-Module -Name Invoke-CommandAs -Force -Scope AllUsers
}

Write-Output "Installing SQL Server Express"
Invoke-CommandAs -ScriptBlock { choco upgrade sql-server-express } -ComputerName $env:COMPUTERNAME -AsInteractive $env:USERNAME

if (Test-PendingReboot) { 
    Invoke-Reboot
}
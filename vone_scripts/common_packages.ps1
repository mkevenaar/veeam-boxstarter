# Description: Boxstarter script
# Author: Maurice Kevenaar
# This boxstarter scrips installs common required packages for VBR.


New-Item -Path "$env:systemdrive\ProgramData\ChocoCache" -ItemType directory -Force | Out-Null
$common = "--cacheLocation=`"$env:systemdrive\ProgramData\ChocoCache`""


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


choco upgrade DotNet4.7.2 $common
choco upgrade SQL2014.SMO $common
choco upgrade veeam-one-iso $common
choco upgrade chocolatey-isomount.extension $common
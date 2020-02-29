# Description: Boxstarter script
# Author: Maurice Kevenaar
# This boxstarter scrips installs VBR Server.

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

function Get-VBR-Params($settings) {
    [System.Collections.ArrayList]$params = @()

    ForEach ($setting in $settings) {
        if ( $null -ne (Get-Variable $setting).Value) {
            $param = $setting.Substring(4)
            $value = (Get-Variable $setting).Value
            $params.Add("/${param}:${value}")
        }
    }
    return $params -join ' '
}

$vbr_catalog_settings = @('vbr_username','vbr_password','vbr_create','vbr_catalogLocation','vbr_catalogPort')
$vbr_catalog_params = Get-VBR-Params($vbr_catalog_settings)

$vbr_server_settings = @('vbr_nfsDatastoreLocation','vbr_backupPort','vbr_mountserverPort','vbr_licenseFile','vbr_sqlServer','vbr_sqlDatabase','vbr_sqlAuthentication','vbr_sqlUsername','vbr_sqlPassword','vbr_username','vbr_password','vbr_create')
$vbr_server_params = Get-VBR-Params($vbr_server_settings)

Write-Output "Installing VBR Server"

choco upgrade vcredist140
choco upgrade ms-reportviewer2015
choco upgrade veeam-backup-and-replication-catalog --params "${vbr_catalog_params}"
choco upgrade veeam-backup-and-replication-server --params "${vbr_server_params}"
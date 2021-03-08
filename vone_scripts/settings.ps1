# --- settings ---

# VONE Server settings

# ---------------------------------------------------------------------------- #
## Monitor Server and Reporter server (shared)

# Specifies the type of object to add into Veeam ONE configuration. Specify 0 to
# add VMware vCenter Server or ESXi Host. Specify 1 to add Microsoft Hyper-V
# Host, Failover Cluster or SCVMM Server. If you do not use this parameter,
# Veeam ONE will skip the virtual infrastructure configuration 
# (default value, 2).
# Example: $vone_vcSelectedType = 0
$vone_vcSelectedType = $null

# This parameter can be used if you have specified 1 for the
# $vone_vcSelectedType parameter. Specifies the role of the virtual
# infrastructure server. Specify 1 to add Failover Cluster. Specify 2 to add
# standalone Hyper-V Host. If you do not use this parameter, Veeam ONE will add
# SCVMM Server (default value, 0).
# Example: $vone_hvType = 2
$vone_hvType = $null

# This parameter must be used if you have specified 0 or 1 for the
# $vone_vcSelectedType parameter. Specifies FQDN or IP address of the virtual
# infrastructure server you want to connect.
# Example: $vone_vcHost = vcenter01.tech.local
$vone_vcHost = $null

# This parameter must be used if you have specified 0 or 1 for the
# $vone_vcSelectedType parameter. Specifies the port number of the virtual
# infrastructure server you want to connect.
# Example: $vone_vcPort = 443
$vone_vcPort = $null

# This parameter must be used if you have specified 0 or 1 for the
# $vone_vcSelectedType parameter. Specifies a user account to connect to the
# virtual infrastructure server.
# Example: vcHostUser = tech\administrator
$vone_vcHostUser = $null

# This parameter must be used if you have specified 0 or 1 for the
# $vone_vcSelectedType parameter. Specifies a password for the account to
# connect to the virtual infrastructure server. 
# Example: $vone_vcHostPass = p@ssw0rd
$vone_vcHostPass = $null

# This parameter can be used if you have specified 0 or 1 for the 
# $vone_vcSelectedType parameter. Specifies if you want to postpone adding
# Veeam Backup & Replication or Veeam Backup Enterprise Manager Server. Specify 
# 1 to add Veeam Backup & Replication or Veeam Backup Enterprise Manager server 
# later. If you do not use this parameter, you must add
# Veeam Backup & Replication or Veeam Backup Enterprise Manager
# (default value, 0).
# Example: $vone_backupAddLater = 1
$vone_backupAddLater = $null

# This parameter can be used if you have specified 0 or 1 for the
# $vone_vcSelectedType parameter and have not specified $vone_backupAddLater.
# Specifies the role of Veeam Backup & Replication server to add. Specify 0 to
# add Veeam Backup & Replication server. Specify 1 to add Veeam Backup
# Enterprise Manager.
# Example: $vone_backupAddType = 1
$vone_backupAddType = $null

# This parameter can be used if you have specified 0 or 1 for the
# $vone_vcSelectedType parameter and have not specified $vone_backupAddLater.
# Specifies FQDN or IP address of the Veeam Backup & Replication or
# Veeam Backup Enterprise Manager server you want to connect.
# Example: $vone_backupAddHost = backup01.tech.local
$vone_backupAddHost = $null

# This parameter can be used if you have specified 0 or 1 for the
# $vone_vcSelectedType parameter and have not specified $vone_backupAddLater.
# Specifies a user account to connect to Veeam Backup & Replication or
# Veeam Backup Enterprise Manager server.
# Example: $vone_backupAddUser = backup01\administrator
$vone_backupAddUser = $null

# This parameter can be used if you have specified 0 or 1 for the
# $vone_vcSelectedType parameter and have not specified $vone_backupAddLater.
# Specifies a password for the account to connect to
# Veeam Backup & Replication or Veeam Backup Enterprise Manager server.
# Example: $vone_backupAddPass = p@ssw0rd
$vone_backupAddPass = $null

# Specifies a full path to the license file. If this parameter is not specified,
# Veeam ONE Free Edition will be installed.
# Example: $vone_licenseFile = C:\data\veeam_one_subscription_100_100.lic
$vone_licenseFile = $null

# ---------------------------------------------------------------------------- #
## Monitor Server, Reporter server and Reporter Web (shared)

# Specifies the mode in which Veeam ONE will collect data from virtual 
# infrastructure and Veeam Backup & Replication servers. Specify 1 to use the 
# Optimized for Advanced Scalability Deployment mode. Specify 2 to use The 
# Backup Data Only mode. If you do not use this parameter, Veeam ONE will 
# collect data in the Optimized for Typical Deployment mode (default value, 0). 
# Example: $vone_installationType = 2.
$vone_installationType = $null

# Specifies a Microsoft SQL server and instance on which the Veeam ONE database 
# will be deployed. By default, Veeam ONE uses the LOCALHOST\VEEAMSQL2016 
# server.
# Example: $vone_sqlServer = ONESERVER\VEEAMSQL2016_MY
$vone_sqlServer = $null

# Specifies a name of the Veeam ONE database, by default, VeeamOne.
# Example: $vone_sqlDatabase = VeeamOneDB
$vone_sqlDatabase = $null

# Specifies if you want to use the Microsoft SQL Server authentication mode to
# connect to the Microsoft SQL Server where the Veeam ONE database is deployed.
# Specify 1 to use the SQL Server authentication mode. If you do not use this
# parameter, Veeam ONE will connect to the Microsoft SQL Server in the Microsoft
# Windows authentication mode (default value, 0). Together with this parameter,
# you must specify the following parameters: $vone_sqlUsername and
# $vone_sqlPassword.
# Example: $vone_sqlAuthentication = 1
$vone_sqlAuthentication = $null

# This parameter must be used if you have specified the $vone_sqlAuthentication
# parameter. Specifies a LoginID to connect to the Microsoft SQL Server in the
# SQL Server authentication mode.
# Example: $vone_sqlUsername = sa
$vone_sqlUsername = $null

# This parameter must be used if you have specified the $vone_sqlAuthentication
# parameter. Specifies a password to connect to the Microsoft SQL Server in the
# SQL Server authentication mode.
# Example: $vone_sqlPassword = p@ssw0rd
$vone_sqlPassword = $null

# ---------------------------------------------------------------------------- #
## Monitor Server, Reporter server, Reporter Web and Agent (shared)

# Specifies a user account under which the Veeam ONE Services will run and that
# will be used to access Veeam ONE database in the Microsoft Windows
# authentication mode.
# Example: $vone_username = ONESERVER\Administrator
$vone_username = $null

# This parameter must be used if you have specified the $vone_username 
# parameter. Specifies a password for the account under which the Veeam ONE
# Services will run and that will be used to access Veeam ONE database.
# Example: $vone_password = p@ssw0rd
$vone_password = $null

# Create the requested user on this machine, this user will be added to the
# local Administrators group.
$vone_create = $null

# ---------------------------------------------------------------------------- #
## Agent specific

# Specifies the mode in which Veeam ONE agent will run. If you specify this 
# parameter, the agent will be installed in Server mode. Only required for the
# Veeam ONE Server
$vone_server = $null

# Specifies a port that will be used by Monitor to communicate with
# Veeam ONE Agent. By default, port number 2805 is used.
# Example: $vone_agentServicePort = 2805
$vone_agentServicePort = $null

# ---------------------------------------------------------------------------- #
## Monitor Server specific

# Specifies a path to the folder where Performance Cache will be stored. If you
# do not use this parameter, the performance cache will be stored to the 
# C:\PerfCache folder (default).
# Example: $vone_perfCache = "D:\Veeam\PerfCache"
$vone_perfCache = $null

# ---------------------------------------------------------------------------- #
## Monitor Client specific

# Specifies FQDN or IP address of the server where Veeam ONE Monitor is deployed
# Example: $vone_monitorServer = oneserver.tech.local
$vone_monitorServer = $null

# ---------------------------------------------------------------------------- #
## Reporter WebUI specific

# Specifies a port that will be used by the Reporter website. By default, port
# number 1239 is used.
# Example: $vone_iisSitePort = 1239
$vone_iisSitePort = $null

# Specifies the certificate to be used by the Reporter website. If this
# parameter is not specified, a new certificate will be generated by
# openssl.exe.
# Example: $vone_sslThumbprint = 0677d0b8f27caccc966b15d807b41a101587b488
$vone_sslThumbprint = $null

# Specifies FQDN or IP address of the server where Veeam ONE Reporter Service 
# is installed. 
# Example: `/oneServer:oneserver.tech.local`
$vone_oneServer = $null

# ---------------------------------------------------------------------------- #
## Functions

<#
.SYNOPSIS
    Get the changed VONE parameters from this file.

.DESCRIPTION
    Parses the $settings list for parameters set in this file. Returns themn in
    Chocolatey format.

.PARAMETER settings
    A list of parameters to process

.EXAMPLE
    >
    $settings = @('vone_perfCache','vone_installationType')
    $params = Get-VONE-Params($settings)

#>
function Get-VONE-Params($settings) {
    [System.Collections.ArrayList]$params = @()

    ForEach ($setting in $settings) {
        if ( $null -ne (Get-Variable $setting).Value) {
            $param = $setting.Substring(5)
            $value = (Get-Variable $setting).Value
            $params.Add("/${param}:${value}")
        }
    }
    return $params -join ' '
}

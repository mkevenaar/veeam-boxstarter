# --- settings ---

# VBR Server settings

# Specifies the vPower cache folder to which the write cache will be stored. By
# default, Veeam Backup & Replication uses the folder on a volume with the 
# maximum amount of free space, for example, 
# C:\ProgramData\Veeam\Backup\NfsDatastore.
$vbr_nfsDatastoreLocation = $null

# Specifies a TCP port that will be used by the Veeam Backup Service. By 
# default, port number 9392 is used.
$vbr_backupPort = $null

# Specifies a port used for communication between the mount server and the 
# backup server. By default, port 9401 is used.
$vbr_mountserverPort = $null

# Specifies a full path to the license file. If you do not specify this
# parameter, Veeam Backup & Replication will operate in the Community Edition
# mode.
$vbr_licenseFile = $null

# Specifies a Microsoft SQL server and instance on which the configuration
# database will be deployed. By default, Veeam Backup & Replication uses 
# the (local)\VEEAMSQL2012 server for machines running Microsoft Windows 7,
# Microsoft Windows Server 2008 or Microsoft Windows Server 2008 R2, and 
# (local)\VEEAMSQL2016 for machines running Microsoft Windows Server 2012 or
# later.
$vbr_sqlServer = $null

# Specifies a name for the configuration database. By default, the configuration
# database is deployed with the VeeamBackup name.
$vbr_sqlDatabase = $null

# Specifies if you want to use the SQL Server authentication mode to connect to
# the Microsoft SQL Server where the Veeam Backup & Replication configuration
# database is deployed. Specify if you want to use the SQL Server authentication
# mode. If you do not specify this parameter, Veeam Backup & Replication will
# connect to the Microsoft SQL Server in the Microsoft Windows authentication
# mode.
$vbr_sqlAuthentication = $null

# This parameter must be used if you have specified the $vbr_sqlAuthentication
# parameter. Specifies a LoginID to connect to the Microsoft SQL Server in the
# SQL Server authentication mode.
$vbr_sqlUsername = $null

# This parameter must be used if you have specified the $vbr_sqlAuthentication
# parameter. Specifies a password to connect to the Microsoft SQL Server in the
# SQL Server authentication mode.
$vbr_sqlPassword = $null

# Specifies the account under which the Veeam Backup Service will run. The 
# account must have full control NTFS permissions on the VBRCatalog folder where
# index files are stored and the Database # owner rights for the configuration
# database on the Microsoft SQL Server where the configuration database is 
# deployed. If you do not specify this parameter, the Veeam Backup Service will
# run under the Local System account. 
# This parameter is used for the server and catalog
$vbr_username = $null

# This parameter must be used if you have specified the $vbr_username parameter.
# Specifies a password for the account under which the Veeam Backup Service will
# run.
# This parameter is used for the server and catalog
$vbr_password = $null

# Create the requested user on this machine, this user will be added to the 
# local Administrators group.
# This parameter is used for the server and catalog
$vbr_create = $null

# Specifies a path to the catalog folder where index files must be stored. By
# default, Veeam Backup & Replication creates the VBRCatalog folder on a volume
# with the maximum amount of free space.
$vbr_catalogLocation = $null

# Specifies a TCP port that will be used by the Veeam Guest Catalog Service. By
# default, port number 9393 is used.
$vbr_catalogPort = $null
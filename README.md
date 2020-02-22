# Veeam Boxstarter templates

This repository allows you to install different Veeam software configurations depending on your requirements.

## Step 1: **Download repository.**

[Download](https://github.com/mkevenaar/veeam-boxstarter/archive/master.zip) this repository and extract it to a local folder.

## Step 2: **Configure settings.**

**NOTE:** Only required for VBR

Edit the `settings.ps1` file and change the settings you want to change.

## Step 3: **Install Chocolatey and BoxStarter**

Run the following commands in an Elevated powershell.

````powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
````

For more information regarding the installaton of Chocolatey please have a look at their [documentation](https://chocolatey.org/install)

````powershell
choco install Boxstarter
````

For more information about installing BoxStarter have a look at their [documentation](https://www.boxstarter.org/InstallBoxstarter)

## Step 4: **Run BoxStarter**

Depending on the function of the machine you are running this on, you can use several scripts.

### VBR Scripts

|Script|Function|
|-|-|
|vbr_all.ps1|Install all the VBR packages|
|vbr_sql_express.ps1|Install an SQL Express|
|vbr_server.ps1|Install Veeam Backup & Replication server|
|vbr_management.ps1|Install Veeam Backup & Replication management console, including the explorers|
|vbr_proxy.ps1|Install Veeam Backup & Replication proxy server|

Example:

````powershell
$credentials=Get-Credential
Install-BoxstarterPackage -PackageName vbr_all.ps1 -Credential $credentials
````

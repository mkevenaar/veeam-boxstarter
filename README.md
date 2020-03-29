# Veeam Boxstarter templates

This repository allows you to install different Veeam software configurations depending on your requirements.

## Step 1: **Download repository.**

- [Download](https://github.com/mkevenaar/veeam-boxstarter/archive/master.zip) latest stable release of this repository and extract it to a local folder *(recommended)*.
- [Download](https://github.com/mkevenaar/veeam-boxstarter/archive/develop.zip) latest unstable commit of this repository and extract it to a local folder.

## Step 2: **Install Chocolatey and BoxStarter**

Run the following commands in an Elevated powershell.

````powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
````

For more information regarding the installation of Chocolatey please have a look at their [documentation](https://chocolatey.org/install)

````powershell
choco install Boxstarter
````

For more information about installing BoxStarter have a look at their [documentation](https://www.boxstarter.org/InstallBoxstarter)

## Step 3: **Configure settings.**

**NOTE:** Only required for the `vbr_scripts` folder.

Edit the `settings.ps1` file and change the settings you want to change.

## Step 4: **Run BoxStarter**

Depending on the function of the machine you are running this on, you can use several scripts.

### VBR Scripts

|Script|Function|
|-|-|
|vbr_all.ps1|Install all the VBR packages|
|vbr_sql_express.ps1|Install an SQL Express|
|vbr_server.ps1|Install Veeam Backup & Replication server|
|vbr_management.ps1|Install Veeam Backup & Replication management console, including the explorers|
|vbr_proxy.ps1|Install Veeam Backup & Replication proxy server **(soon)**|
|vbr_repository.ps1|Install Veeam Backup & Replication repository server **(soon)**|

### VBO Scripts

|Script|Function|
|-|-|
|vbo_all.ps1|Install all the VBO packages|
|vbo_server.ps1|Install Veeam Backup for o365 server|
|vbo_management.ps1|Install Veeam Backup for o365 management console, including the explorers|

Example:

````powershell
BoxStarter.bat c:\path\to\my\vbr_scripts\vbr_all.ps1
````

## Vagrant

For testing purposes, I have added a Vagrantfile in this repository.

This is tested with the following setup:

- Windows 10, Version 1909 (Probably any OS compatible with Vagrant v2.1.5 and VirtualBox v5.2.36 should work.)
- Vagrant v2.1.5:

  ````powershell
  choco install vagrant --version=2.1.5
  ````

- VirtualBox v5.2.36:

  ````powershell
  choco install virtualbox --version=5.2.36
  ````

- [StefanScherer/windows_2016](https://app.vagrantup.com/StefanScherer/boxes/windows_2016) box based on his [packer templates](https://github.com/StefanScherer/packer-windows).
- Run `vagrant up` to boot the Vagrant box.

### Additional notes

- If required, put your packages in the `packages` folder.
- The contents of this directory will be copied to `c:\temp`
- The contents of the `packages` folder will be available in `c:\packages`

### `vbr_all.ps1` Vagrant only (Full VBR PoC setup)

- Put a license file inside the `packages` folder.
- In the `settings.ps1` file:
  - Change `$vbr_licenseFile` to `'c:\packages\myfile.lic'`
  - Change `$vbr_sqlServer` to `'VAGRANT\SQLEXPRESS'`
  - Change `$vbr_username` to `'vagrant'`
  - Change `$vbr_password` to `'vagrant'`

After you have installed these packages, you can continue with step 2 above.

# Description: Boxstarter script
# Author: Maurice Kevenaar
# This boxstarter scrips installs common required packages for VBO.


New-Item -Path "$env:systemdrive\ProgramData\ChocoCache" -ItemType directory -Force | Out-Null
$common = "--cacheLocation=`"$env:systemdrive\ProgramData\ChocoCache`""

choco upgrade DotNet4.7.2 $common

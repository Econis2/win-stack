
param (

[ValidateSet(2k12,2k12R2,2k16)]
[string]$version = 2k12R2

)

write-host "Installing Drivers...." -foregroundcolor Green

pnputil -i -a E:\Balloon\$version\amd64\*.inf

pnputil -i -a E:\NetKVM\$version\amd64\*.inf

pnputil -i -a E:\pvpanic\$version\amd64\*.inf

pnputil -i -a E:\qemupciserial\$version\amd64\*.inf

pnputil -i -a E:\qxldod\$version\amd64\*.inf

pnputil -i -a E:\vioinput\$version\amd64\*.inf

pnputil -i -a E:\viorng\$version\amd64\*.inf

pnputil -i -a E:\vioscsi\$version\amd64\*.inf

pnputil -i -a E:\vioserial\$version\amd64\*.inf

pnputil -i -a E:\viostor\$version\amd64\*.inf

write-host "Downloading Cloudbase Setup...." -foregroundcolor Green

Invoke-WebRequest -UseBasicParsing https://cloudbase.it/downloads/CloudbaseInitSetup_Stable_x64.msi -OutFile cloudbaseinit.msi

write-host "Starting Cloudbase Setup...." -foregroundcolor Green

start-process -Filepath (Get-Item -Path ".\cloudbaseinit.msi").FullName

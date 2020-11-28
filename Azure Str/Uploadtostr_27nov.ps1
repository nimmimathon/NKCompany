<#Person 1 
c: \ tmp \
config.txt
app.txt
runtimepackage.txt
Add-NAVAppStorage -Enviroment 'Staging' -Name 'MyTestApp' -Version '1.1.1.1' -File 'C:\tmp\config.txt'
Add-NAVAppStorage -Enviroment 'Staging' -Name 'MyTestApp' -Version '1.1.1.1' -File 'C:\tmp\app.txt', 'C:\tmp\runtimepackage.txt'#>
#Function to upload files from Local to Azure Storage
function Add-NAVAppStorage {
    param(
        [Parameter(Mandatory=$true)][String]$Environment,
        [Parameter(Mandatory=$true)][String]$Name,
        [Parameter(Mandatory=$true)][String]$Version,
        [Parameter(Mandatory=$true)][array]$Filepath
    )  
        process {
        Copy-item -Path $Filepath –Destination \\amsnavappconf.file.core.windows.net\navappfile\tmp\$Environment\$Name\$Version
    }
}

Add-NAVAppStorage -Environment 'Staging' -Name 'MyTestApp' -Version '1.1.1.1' -filepath 'C:\tmp\config.txt'
Add-NAVAppStorage -Environment 'Staging' -Name 'MyTestApp' -Version '1.1.1.1' -filepath 'C:\tmp\app.txt', 'C:\tmp\runtimepackage.txt'

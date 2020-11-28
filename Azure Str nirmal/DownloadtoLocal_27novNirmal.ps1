
<# Person 2 
Download-NAVAppStorage -Enviroment 'Staging' -Name 'MyTestApp' -Version '1.1.1.1' -Destination 'C:\tmp\download'
Structure after execution 
c: \ tmp \ download \
config.txt
app.txt
runtimepackage.txt #>
#Function to Download Files From Azure Storage to Local

function Download-NAVAppStorage {
    param(
        [Parameter(Mandatory=$true)][String]$Environment,
        [Parameter(Mandatory=$true)][String]$Name,
        [Parameter(Mandatory=$true)][String]$Version,
        [Parameter(Mandatory=$true)][string]$Filepath
    )  
        process {
Copy-item -Path \\amsnavappconf.file.core.windows.net\navappfile\tmp\$Environment\$Name\$Version\* –Destination $filepath
    }
}
Download-NAVAppStorage -Environment 'Staging' -Name 'MytestApp' -Version '1.1.1.1' -filepath 'C:\tmp\download\'
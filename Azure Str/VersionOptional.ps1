function Download-NAVAppStorage {
    param(
        [Parameter(Mandatory=$true)][String]$Environment,
        [Parameter(Mandatory=$true)][String]$Name,
        [Parameter(Mandatory=$false)][String]$Version,   
        [Parameter(Mandatory=$true)][string]$Filepath
    )  
process {
If([string]::IsNullOrEmpty($Version))
{
$Version = (Get-ChildItem "\\amsnavappconf.file.core.windows.net\navappfile\tmp\$Environment\$Name\" | Select Name | Sort-Object { [regex]::Replace($_.Name, '\d+', { $args[0].Value.PadLeft(20) }) }| select -Last 1 | ft -hidetableheaders | Out-String).trim()
Copy-item -Path \\amsnavappconf.file.core.windows.net\navappfile\tmp\$Environment\$Name\$Version –Destination $Filepath -Recurse
    }
else
{
Copy-item -Path \\amsnavappconf.file.core.windows.net\navappfile\tmp\$Environment\$Name\$Version –Destination $Filepath -Recurse
}
}
}
Download-NAVAppStorage -Environment 'Staging' -Name 'MytestApp' -filepath 'C:\tmp\download\'


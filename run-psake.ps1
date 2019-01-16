[CmdletBinding()]
param(
[string[]] $taskList = @('Default'),
[string] $version = "1.0.0.0",
[string] $psakeFile = ".\psake.ps1"
)
 
Set-StrictMode -Version Latest
 
$ErrorActionPreference = "Stop"
$psakeMaximumVersion = "4.7.4"

if (-not (Find-PackageProvider -Name "Nuget")) {
    Write-Host "Installing Nuget provider"
    Install-PackageProvider -Name "Nuget" -Force
}
else {
    Write-Host "Nuget provider already installed"
}

if (-not (Get-Module -ListAvailable -Name psake)) {
    Write-Host "Installing module psake"
    Find-Module -Name psake -MaximumVersion $psakeMaximumVersion | Install-Module -Scope CurrentUser -Force
}
else {
    Write-Host "psake already installed"
}

Invoke-Psake -buildFile $psakeFile -taskList $taskList -properties @{ 
                                                    dotnetVerbosity="m"
													buildConfig="debug"
} `
                                        -Verbose:$VerbosePreference
 
if ($psake.build_success) { exit 0 } else { exit 1 }
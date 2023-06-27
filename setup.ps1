# Provide URL to newest version of Windows Terminal Application
$url = 'https://github.com/microsoft/terminal/releases/download/v1.17.11461.0/Microsoft.WindowsTerminal_1.17.11461.0_8wekyb3d8bbwe.msixbundle'
$split = Split-Path $url -Leaf
$package = Get-AppxPackage | Where-Object { $_.Name -like "Microsoft.VCLibs.140.00.UWPDesktop" }

# Prerequisites
# Check if it has been installed already
if ($package -eq $null) {
  Start-BitsTransfer -Source 'https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx' `
    -Destination $home\Microsoft.VCLibs.x86.14.00.Desktop.appx
  Add-AppxPackage $home\Microsoft.VCLibs.x86.14.00.Desktop.appx
}

# Download
Start-BitsTransfer `
  -Source $url `
  -Destination (Join-Path -Path $home -ChildPath $split)
 
# Installation
Add-AppxPackage -Path (Join-Path -Path $home -ChildPath $split)

### Chocolatey script
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'));
choco install powershell-core dotnetfx vscode notepadplusplus --confirm

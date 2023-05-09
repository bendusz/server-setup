### Download prerequisite for Terminal
Invoke-WebRequest -Uri https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx -outfile Microsoft.VCLibs.x86.14.00.Desktop.appx
### Install pre-requisite for Terminal
Add-AppxPackage Microsoft.VCLibs.x86.14.00.Desktop.appx 

### Chocolatey script
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'));
choco install microsoft-windows-terminal powershell-core dotnetfx vscode notepadplusplus --confirm

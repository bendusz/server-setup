# Into

This is a personal repository that I use for my quick setup process whenever I pull up a brand new environment for VMs

# Usage

### Installs the pre-requisites for Windows Terminal to be able to run on the server plus the most commonly used programs
```powershell
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/bendusz/server-setup/main/setup.ps1'))
```

### Add the CAPolicy.inf

```powershell
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/bendusz/server-setup/main/CAP_Install.ps1'))
```
### Installs ADDS and creates a new forest

```powershell
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/bendusz/server-setup/main/installNewADDS.ps1'))
```

### Join a Server as DC to an existing Domain

```powershell
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/bendusz/server-setup/main/joinServerAsDCps1'))
```

# Rest
The rest of the scripts are just a quick markdowns of commonly used codes.

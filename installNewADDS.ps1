# Ensure PowerShell is running with elevated privileges
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Please run this script with administrative privileges."
    Read-Host -Prompt "Press any key to continue"
}

# Install the Active Directory Domain Services and DNS Server roles
Install-WindowsFeature -Name AD-Domain-Services, DNS -IncludeManagementTools

# Specify the domain name and NetBIOS name for the new domain
$domainName = Read-Host "Enter the domain name (like contoso.com)"
$netBIOSName = Read-Host "Enter the domain netBIOS"

# Specify the DSRM password for the Directory Services Restore Mode
$dsrmPassword = Read-Host -AsSecureString -Prompt "Enter the DSRM password"

# Configure the new forest and domain
$credential = Get-Credential
$adminPassword = $credential.Password | ConvertFrom-SecureString
$adminUsername = "$netBIOSName\administrator"
$domainMode = 7   # Windows Server 2019 domain functional level
$forestMode = 7   # Windows Server 2019 forest functional level

Install-ADDSForest -DomainName $domainName -DomainNetbiosName $netBIOSName -SafeModeAdministratorPassword $dsrmPassword -DatabasePath "C:\Windows\NTDS" -LogPath "C:\Windows\NTDS" -SysvolPath "C:\Windows\SYSVOL" -NoRebootOnCompletion:$false -Force:$true -CreateDNSDelegation:$false -DomainMode $domainMode -ForestMode $forestMode -InstallDns -Confirm:$false

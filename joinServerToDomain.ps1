# Ensure PowerShell is running with elevated privileges
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Please run this script with administrative privileges."
    Read-Host -Prompt "Press any key to continue"
}
# Set the domain controller name and IP address
$domainName = Read-Host "Enter the domain name (like contoso.com)"


# Check if the AD DS modules are installed
if (-not (Get-WindowsFeature -Name AD-Domain-Services).Installed) {
	# Install the Active Directory Domain Services feature
	Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools
}
else {
	Write-Host "AD DS modules are installed. Setting up the domain."
}
# Promote the server to a domain controller
# Windows PowerShell script for AD DS Deployment
Import-Module ADDSDeployment
Install-ADDSDomainController `
	-NoGlobalCatalog:$false `
	-CreateDnsDelegation:$false `
	-Credential (Get-Credential) `
	-CriticalReplicationOnly:$false `
	-DatabasePath "C:\Windows\NTDS" `
	-DomainName $domainName `
	-InstallDns:$true `
	-LogPath "C:\Windows\NTDS" `
	-NoRebootOnCompletion:$false `
	-SiteName "Default-First-Site-Name" `
	-SysvolPath "C:\Windows\SYSVOL" `
	-Force:$true

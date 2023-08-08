$VAR = Invoke-WebRequest https://raw.githubusercontent.com/bendusz/server-setup/main/CAPolicy.inf
New-Item -Path %systemroot% -Name CAPolicy.inf -Value $VAR

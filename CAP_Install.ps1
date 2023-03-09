$VAR = Invoke-WebRequest https://raw.githubusercontent.com/bendusz/server-setup/main/CAPolicy.inf
New-Item -Path C:\Windows\System32 -Name CAPolicy.inf -Value $VAR

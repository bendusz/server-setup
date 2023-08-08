$URL = "https://raw.githubusercontent.com/bendusz/server-setup/main/CAPolicy.inf"
$VAR = Invoke-WebRequest -Uri $URL
$Content = $VAR.Content

$FilePath = Join-Path -Path $env:SystemRoot -ChildPath "CAPolicy.inf"
$Content | Set-Content -Path $FilePath

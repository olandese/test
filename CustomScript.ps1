#Install-WindowsFeature -name Web-Server -IncludeManagementTools
#remove-item 'C:\inetpub\wwwroot\iisstart.htm' -confirm:$false -Force
#Add-Content -Path 'C:\inetpub\wwwroot\iisstart.htm' -Value $('Hello World from ' + $env:computername)
#Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-Windows-x86_64.exe" -UseBasicParsing -OutFile $Env:ProgramFiles\Docker\docker-compose.exe
docker pull olandese/chatapplication
docker pull microsoft/mssql-server-windows-developer
docker pull olandese/rabbit-qs2

$url = "https://raw.githubusercontent.com/olandese/test/master/docker-compose.yml"
$output = "docker-compose.yml"
Invoke-WebRequest -Uri $url -OutFile $output

$url = "https://raw.githubusercontent.com/olandese/test/master/.env"
$output = ".env"
Invoke-WebRequest -Uri $url -OutFile $output

docker-compose  -f "docker-compose.yml" up -d

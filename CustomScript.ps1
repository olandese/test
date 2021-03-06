#Install-WindowsFeature -name Web-Server -IncludeManagementTools
#remove-item 'C:\inetpub\wwwroot\iisstart.htm' -confirm:$false -Force
#Add-Content -Path 'C:\inetpub\wwwroot\iisstart.htm' -Value $('Hello World from ' + $env:computername)
#Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-Windows-x86_64.exe" -UseBasicParsing -OutFile $Env:ProgramFiles\Docker\docker-compose.exe
docker pull olandese/chatapplication
docker pull olandese/rabbit-qs2

cd c:\POC\docker

docker-compose -f "docker-compose.yml" up -d

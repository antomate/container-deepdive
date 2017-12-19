# Install Docker
Install-Module DockerProvider -Force
Install-Package Docker -ProviderName DockerProvider -Force

# Install Docker alternate way
invoke-webrequest -UseBasicparsing -Outfile docker-17.06.2-ee-6.zip https://download.docker.com/components/engine/windows-server/17.06/docker-17.06.2-ee-6.zip
Expand-Archive docker-17.06.2-ee-6.zip -DestinationPath $Env:ProgramFiles
Remove-Item -Force docker-17.06.2-ee-6.zip
$null = Install-WindowsFeature containers
$newPath = "$env:ProgramFiles\docker;" +
[Environment]::GetEnvironmentVariable("PATH",
[EnvironmentVariableTarget]::Machine)
$newPath = "$env:ProgramFiles\docker;" +
[Environment]::GetEnvironmentVariable("PATH",
[EnvironmentVariableTarget]::Machine)
dockerd --register-service
Start-Service docker

# Configure Docker
new-item -Type File c:\ProgramData\docker\config\daemon.json
Add-Content 'c:\programdata\docker\config\daemon.json' '{ "hosts": ["tcp://0.0.0.0:2375", "npipe://"] }'
Restart-Service docker

# Install Compose
Invoke-WebRequest "https://github.com/docker/compose/releases/download/1.18.0/docker-compose-Windows-x86_64.exe" -UseBasicParsing -OutFile $Env:ProgramFiles\docker\docker-compose.exe

# Install VSCode
Invoke-WebRequest -UseBasicParsing -OutFile vscode.zip "https://az764295.vo.msecnd.net/stable/816be6780ca8bd0ab80314e11478c48c70d09383/VSCode-win32-x64-1.19.0.zip"
Expand-Archive vscode.zip -DestinationPath $Env:ProgramFiles\VSCode
Remove-Item -Force vscode.zip

# Pull des base image OS
Docker images pull microsoft/windowsservercore
Docker images pull microsoft/nanoserver
Docker images pull microsoft/iis

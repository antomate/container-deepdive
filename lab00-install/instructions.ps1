# The following steps are required for the labs
# They need to be performed on Windows Server 2016 (Core or Full Desktop)

# Install Docker (a restart is required)
# for alternate step by step installation see at the end of file
Install-Module DockerProvider -Force
Install-Package Docker -ProviderName DockerProvider -Force

# Configure Docker to point client to local daemon
New-Item -Type File c:\ProgramData\docker\config\daemon.json
Add-Content 'c:\programdata\docker\config\daemon.json' '{ "hosts": ["tcp://0.0.0.0:2375", "npipe://"] }'
Restart-Service docker

# Verify installation, both client and daemon version should be displayed
docker version

# Install Compose
Invoke-WebRequest "https://github.com/docker/compose/releases/download/1.18.0/docker-compose-Windows-x86_64.exe" -UseBasicParsing -OutFile $Env:ProgramFiles\docker\docker-compose.exe

# Verify installation
docker-compose version

# Install VSCode
Invoke-WebRequest -UseBasicParsing -OutFile vscode.zip "https://az764295.vo.msecnd.net/stable/816be6780ca8bd0ab80314e11478c48c70d09383/VSCode-win32-x64-1.19.0.zip"
Expand-Archive vscode.zip -DestinationPath $Env:ProgramFiles\VSCode
Remove-Item -Force vscode.zip

# Pull base OS image
Docker images pull microsoft/windowsservercore
Docker images pull microsoft/nanoserver
Docker images pull microsoft/iis

# ========================================================================
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
# ========================================================================
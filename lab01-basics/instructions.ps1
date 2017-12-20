# Inspect docker components, see both client and daemon
Get-Childitem $Env:ProgramFiles\docker

# Open a new PowerShell window dedicated to run a first container in interactive mode
# The entrypoint/command specified for this container is PowerShell
Start-Process powershell -ArgumentList "docker container run -it microsoft/windowsservercore powershell"

# list running containers
docker container ps

# Inspect and compare PID tree inside and outside container
# (run the command in the two window)
Get-Process | Sort-Object -Property ProcessName

# Spot the LSASS process and compare their PID inside and outside container
# (run the command in the two window)
Get-Process -Name lsass

# Inspect and compare ProgrameFiles folder inside and outside container
# (run the command in the two window)
Get-Childitem $Env:ProgramFiles

# Remove system folder inside the container
# (in the window with interactive session in the container)
New-Item -Type Directory $Env:ProgramFiles\BANCO

# Exit the container
# (in the window with interactive session in the container)
Exit

# Start a new container from the same image
# Notepad as the entrypoint/command for the container not to stop
docker container run -d microsoft/windowsservercore notepad

# Exec inside this last launched container
Start-Process powershell -ArgumentList "docker exec -it $(docker ps -l -q) powershell"

# Witness the "BANCO" folder created previously did not persist
# (in the window with interactive session in the container)
Get-Childitem $Env:ProgramFiles

# Inspect containers and the path structure of docker and running/stopped containers
Get-Childitem $Env:ProgramData\docker
docker container ps -a
Get-Childitem $Env:ProgramData\docker\containers

# Inspect images and the path structure of image layer
Get-Childitem $Env:ProgramData\docker\windowsfilter
docker images ps
Get-Childitem $Env:ProgramData\docker\windowsfilter\<imageID>\Hives
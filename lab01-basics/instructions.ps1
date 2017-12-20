# Inspect docker components
get-childitem $Env:ProgramFiles\docker

# Open a new PowerShell window
start-process powershell

# first container run in interactive mode with a entrypoint/command specified (PowerShell)
docker container run -it microsoft/windowsservercore powershell

# Inspect and compare process tree inside and outside container (in the separate Powershell window)
Get-Process | Sort-Object -Property Id -Descending

# Inspect and compare ProgrameFiles folder inside and outside container (in the separate Powershell window)
get-childitem $Env:ProgramFiles

# Remove system folder
Remove-Item $Env:ProgramFiles

# Exit the container
Exit

# Start a new container from the same image
docker container run -d microsoft/windowsservercore

# Exec into this container and witness the change did not persist
get-childitem $Env:ProgramFiles

# Inspect containers and the patrh structure of docker and running or stopped containers
get-childitem $Env:ProgramData\docker
docker container ps -a
get-childitem $Env:ProgramData\docker\containers

# Inspect images and the path structure of image layer
get-childitem $Env:ProgramData\docker\windowsfilter
docker images ps
get-childitem $Env:ProgramData\docker\windowsfilter\<imageID>\Files
get-childitem $Env:ProgramData\docker\windowsfilter\<imageID>\Hives
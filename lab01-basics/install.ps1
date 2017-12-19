# Inspect components
get-childitem $Env:ProgramFiles\docker

# first container
docker container run -it microsoft/windowsservercore powershell

# Compare process tree inside and outside container
Get-Process

# Compare ProgrameFiles folder inside and outside container
get-childitem $Env:ProgramFiles

# Remove system folder
Remove-Item ...

# Exit the container
Exit

# Start a new container to witness the change did not persist
docker container run -it microsoft/windowsservercore powershell

# Exec into a container

# Inspect containers and the patrh structure of docker and running or stopped containers
get-childitem $Env:ProgramData\docker
docker container ps -a
get-childitem $Env:ProgramData\docker\containers

# Inspect images and the path structure of image layer
get-childitem $Env:ProgramData\docker\windowsfilter
docker images ps
get-childitem $Env:ProgramData\docker\windowsfilter\<imageID>\Files
get-childitem $Env:ProgramData\docker\windowsfilter\<imageID>\Hives

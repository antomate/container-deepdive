# Download lab content from GitHub
New-Item -Type Directory C:\temp
Invoke-WebRequest https://github.com/antomate/container-deepdive/archive/master.zip -UseBasicParsing -OutFile C:\temp\master.zip
Expand-Archive C:\temp\master.zip -DestinationPath C:\temp
Set-Location C:\temp\container-deepdive-master\_sources
Remove-Item -Force C:\temp\master.zip

# Inspect dockerfile for official IIS image
Invoke-WebRequest https://raw.githubusercontent.com/Microsoft/iis-docker/master/windowsservercore-ltsc2016/Dockerfile | write-host

# Inspect dockerfile for the custom image build from IIS
Get-Content dockerfile

# Build the docker image based on the dockerfile
docker build -t antomate/stupidwebsite .

# List available images
docker images

# Run the new image
docker run -d --name demostupid -p 8080:8080 antomate/stupidwebsite

# Get IP address of the running container
$demostupidIP = docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" demostupid

# launch website
Start-Process iexplore.exe -ArgumentList "http://$($demostupidIP):8080/"

# Upload new image to the registry
docker push antomate/stupidwebsite

# Clean up the demo
docker rm demostupid -f
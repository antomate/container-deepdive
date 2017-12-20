# Download lab content from GitHub
wget https://github.com/antomate/container-deepdive/archive/master.zip -UseBasicParsing -OutFile C:\temp\master.zip
Expand-Archive C:\temp\master.zip -DestinationPath C:\temp
set-location C:\temp\container-deepdive-master\_sources
Remove-Item -Force C:\temp\master.zip

===============================================================
# Inspect dockerfile for official IIS image
wget https://raw.githubusercontent.com/Microsoft/Virtualization-Documentation/master/windows-container-samples/windowsservercore/iis/Dockerfile | write-host

# Inspect dockerfile for the custom image build from IIS
Get-Content dockerfile

# Build the docker image based on the dockerfile
docker build -t antomate/stupidwebsite .

# List available images
docker images

# Run the new image
docker run -d --name demostupid -p 80:80 antomate/stupidwebsite

# Upload new image to the registry
docker push antonind/ninjacat

# Clean up the demo
docker stop demostupid
docker rm demostupid
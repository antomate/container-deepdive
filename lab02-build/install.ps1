# Download lab from GitHub

===============================================================
# Inspect dockerfile for official IIS image
wget https://raw.githubusercontent.com/Microsoft/Virtualization-Documentation/master/windows-container-samples/windowsservercore/iis/Dockerfile | write-host

# Inspect dockerfile for official modified IIS image
wget https://raw.githubusercontent.com/anton1d/Docker_Demo/master/demo2.dockerfile | write-host

# Download the dockerfile
wget https://raw.githubusercontent.com/anton1d/Docker_Demo/master/demo2.dockerfile -outfile .\dockerfile

# Build the docker image based on the dockerfile
docker build -t antonind/ninjacat .

# List available images
docker images

# Run the new image
docker run -d --name demoninjacat -p 80:80 antonind/ninjacat powershell

# Upload new image to the registry
docker push antonind/ninjacat

# Clean up the demo
docker stop demoninjacat
docker rm demoiis
docker rm  demoninjacat


==============================================================

# Download Music Store sources
wget https://github.com/friism/MusicStore/archive/master.zip -UseBasicParsing -OutFile C:\temp\master.zip

# Extract sources
Expand-Archive C:\temp\master.zip

# Change directory to MusicStore-master\master\MusicStore-master
cd MusicStore-master\master\MusicStore-master

# Show Dockerfile for Music Store frontend
get-content .\Dockerfile.windows

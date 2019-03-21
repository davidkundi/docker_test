# docker_test

## This tool is tracking a forked repo and cloning it if it making a change with the gitpull.sh script and then creating containers.

The forked repository : https://github.com/davidkundi/webapp \
Docker documentation: https://docs.docker.com

Requirements: 
- docker
- git
- python
- pip
- virtual box(not necessarily)

## I am using Ubuntu, you need a Linux distro or VirtualBox with a Linux distro image and create a virtual machine which you will work on.

- Open a terminal and download the gitpull.sh script to your home directory or clone the repository. The permission should be set with "sudo chmod +x gitpull.sh"
- Open with Vim or Nano and you can see the REPOSRC=https://github.com/davidkundi/webapp and LOCALREPO=/home/$USER/webapp parameters. The REPOSRC is the repo what we are watching(in our case the forked repo) and the LOCALREPO is where to download in our system. 
- Run the script " sh gitpull.sh && cd webapp". The script is downloading the gitrepo and after that you have to be in the webapp folder.

## Build docker



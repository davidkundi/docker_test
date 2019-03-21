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

## Build docker and run container

- In the webapp directory there is a file, named Dockerfile without any extension.
- Run "sudo docker build -t img_webapp ." and you can see the image is being built up step by step. You can check what you have done with "sudo docker images".
- Run "sudo docker run -itd --name webapp_run-env -P img_webapp". We are naming the container as webapp_run-env and the target image is img_webapp. Run the "sudo docker ps -a" and you will se the container we created. Run "sudo docker container port webapp-run_env and see where the docker map the port by itself. Something like "5000/tcp -> 0.0.0.0:32769"
- 

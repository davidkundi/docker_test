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

## Build docker and run container and create volume(for backup)

- In the webapp directory there is a file, named Dockerfile without any extension.
- Run "sudo docker build -t img_webapp ." and you can see the image is being built up step by step. You can check what you have done with "sudo docker images".
- Run "sudo docker run -itd --name webapp_run_env -P --volume vol-webapp_run_env:/var/log img_webapp:latest". We are naming the container as webapp_run_env and the target image is img_webapp, creating a volume named vol-webapp_run_env. Run the "sudo docker ps -a" and you will se the container we created. Run "sudo docker container port webapp-run_env" and see where the docker map the port by itself. Something like "5000/tcp -> 0.0.0.0:32769" (sudo docker run -d --net=host can working also instead of -P flag)
- Run "sudo docker volume ls"
- Run " sudo docker container inspect --format "{{json .Mounts}}" webapp_run_env | python -m json.tool" and we can always check the container using docker container inspect command and find information about the volume by formatting it's output.
- Run "sudo docker exec -it webapp_run_env bash" (jump into the terminal of our container), run "apt-get update" inside the container terminal and change dir to /var/log (we had mount this directory to our host using the volume vol-webapp_run_env).
- Now let's have root privilages on our host machine: "sudo su -". The docker stores the backup of volume data under /var/lib/docker/volumes directory
- We can remove the container(if we want to) "sudo docker rm webapp_run_env" and delete the docker image "sudo docker rmi img_webapp"

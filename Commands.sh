
#Login into Frontend server
$ apt update -y
$ ssh-keygen -t rsa
$ cat /root/.ssh/id_rsa.pub # copy this pub and upload in github page at ssh and gpu keys

#Installation of docker
$ apt install docker.io -y  #one way

$ curl -sL https://get.docker.com/ | sudo bash - # another way

# clone the application

$ git clone git@github.com:chinnayyachintha/Application.git

$ cd /Application/frontend

# By using Dockerfile we build Docker image for frontend
$ docker build -t frontend .

#List out docker images 
$ docker images

# With the help of docker iamge we create docker container
$ docker run --name frontend-app -d -p 8080:80 frontend:latest

# we can check whether container is running or not
$ docker ps # list out only runnig containers
$ docker ps -a # list out both runnig and stopped containers

# we can get public-ip 
$ curl ipconfig.io

# we can access fronted application by using below link
http://52.170.205.79:8080/


# Login Backend Server
$ apt update -y
$ ssh-keygen -t rsa
$ cat /root/.ssh/id_rsa.pub # copy this pub and upload in github page at ssh and gpu keys

#Installation of docker
$ apt install docker.io -y  #one way

$ curl -sL https://get.docker.com/ | sudo bash - # another way

# clone the application
$ git clone git@github.com:chinnayyachintha/Application.git

$ cd /Application/backend

# By using Dockerfile we build Docker image for frontend
$ docker build -t backend-api .

#List out docker images 
$ docker images



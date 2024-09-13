
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

#Deploy a MySQL database using Docker on the back-end VM
$ docker run -d \
  --name mysql-container \
  -e MYSQL_DATABASE=userdb \
  -e MYSQL_ROOT_PASSWORD='India@123!@#' \
  -v /my/custom-db:/var/lib/mysql \
  -p 3306:3306 \
  mysql:8.0

# To check whether container is running or not
$ docker ps # to check running instances only
$ docker ps -a # to check both running and stopped instances

#Now run the Docker container of backend and link it to your running MySQL container
docker run -d -p 3000:3000 --name backend-api --link mysql-container:mysql backend-api:latest

# To check whether container is running or not
$ docker ps # to check running instances only
$ docker ps -a # to check both running and stopped instances


# Installation of docker-compose
$ sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
$ sudo chmod +x /usr/local/bin/docker-compose
$ docker-compose --version
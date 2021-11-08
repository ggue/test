FROM ubuntu:20.04 

# set environment value 
ENV TZ=Asia/Seoul 
ENV AWS_ACCESS_KEY_ID=EXAMPLEACCESSKEY 
ENV AWS_SECRET_ACCESS_KEY=EXAMPLESECRETACCESSKEY 
ENV AWS_DEFAULT_REGION=EXAMPLEREGION

# Install dependencies 
RUN apt-get update 
RUN apt-get install -y curl 
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash 
RUN apt-get -y install nodejs 
RUN apt-get -y install nginx 
RUN apt-get -y install vim 
RUN apt install -y git

# awscli 설치 
RUN apt install python3-pip -y 
RUN pip3 install awscli 

# node global 설치 
RUN npm install -g pm2 

# timezone 설정 
ARG DEBIAN_FRONTEND=noninteractive 
RUN apt-get install -y tzdata 

# nginx config file 
#COPY default /etc/nginx/sites-enabled/default

# 포트 열기 
EXPOSE 80 3000

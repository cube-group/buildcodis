#!/bin/sh

docker run -it -d --restart=always \
	-e JENKINS_USER=$(id -u) \
	--add-host registry.eoffcn.com:192.168.0.94 \
	-p 8888:8080 \
	-p 50000:50000 \
    -v /data/jenkins:/var/jenkins_home \
	-v /var/run/docker.sock:/var/run/docker.sock \
	--name jenkins trion/jenkins-docker-client
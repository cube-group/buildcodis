#!/bin/sh

sudo docker run --detach \
    --hostname gitlab.my.com \
    --publish 8081:443 --publish 8082:80 --publish 8083:22 \
    --name gitlab \
    --restart always \
    --volume /srv/gitlab/config:/etc/gitlab \
    --volume /srv/gitlab/logs:/var/log/gitlab \
    --volume /srv/gitlab/data:/var/opt/gitlab \
    gitlab/gitlab-ce:latest
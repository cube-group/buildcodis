#!/bin/sh

docker run -d --restart=always \
    -v /opt/walle-web/mysql:/var/lib/mysql \
    -p 3306:3306 \
    -e MYSQL_DATABASE=walle \
    -e MYSQL_ROOT_PASSWORD=walle \
    --name mysql \
    mysql
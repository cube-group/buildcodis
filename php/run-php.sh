#!/bin/sh

#启动php-fpm
docker run -d -it --restart=always \
    --net=mynetwork \
    --add-host="master:10.0.0.1" \
    -v /Users/linyang/Workspace:/data:rw \
    -p 9000:9000 \
    --name fpm \
    cytopia/php-fpm-7.0
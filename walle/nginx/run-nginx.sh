#!/bin/sh

#启动nginx容器
docker run -d -it --restart=always \
    --net=host \
    -v /data:/data \
    -v /data/log/nginx:/var/log/nginx \
    -v $(pwd)/walle.conf:/etc/nginx/conf.d/walle.conf\
    --name nginx \
    nginx
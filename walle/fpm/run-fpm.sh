#!/bin/sh

cd . && echo -e '#!/bin/sh \ndocker exec fpm php $*' > /usr/local/bin/php
chmod 777 /usr/local/bin/php

#启动fpm容器
docker run -d -it --restart=always \
    --net=host \
    -v /data:/data \
    --name fpm \
    docker.io/cytopia/php-fpm-7.0
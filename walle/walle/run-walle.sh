#!/bin/sh

#宿主机代码检出目录
mkdir -p /opt/walle-web \
    && mkdir -p /data/webclone \
    && chmod -R 777 /data/webclone \
    && git clone git@github.com:meolu/walle-web.git \
    && cd walle-web \

composer install  # error cause by bower-asset, install：composer global require "fxp/composer-asset-plugin:*"
./yii walle/setup # init walle

docker run -d -it --restart=always \
    -v /data/webclone:/data/webclone \
    -v /data/docker/walle:/opt/mysql \
    -v $(pwd)/local.php:/opt/walle-web/config/local.php \
    -p 80:80 \
    -e SERVER_NAME="walle.offcn.com" \
    -e WALLE_MAIL_HOST="smtp.qq.com" \
    -e WALLE_MAIL_USER="329483466@qq.com" \
    -e WALLE_MAIL_PASS="guvbucedlqghcbbb" \
    -e WALLE_MAIL_PORT="465" \
    -e WALLE_MAIL_ENCRYPTION="ssl" \
    -e WALLE_MAIL_EMAIL="329483466@qq.com" \
    -e WALLE_MAIL_NAME="sys" \
    --name walle \
    qq58945591/walle-web
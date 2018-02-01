#!/bin/sh
# --entrypoint htpasswd参数是启动registry:2.1.1容器的生成秘钥执行方式
# $1是用户名，$2是密码
# 追加一条被写入到/data/docker/auth/htpasswd文件中
docker run --entrypoint htpasswd docker.io/registry:2.1.1 -Bbn $1 $2 >> /data/docker/auth/htpasswd
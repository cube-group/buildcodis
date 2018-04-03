#!/bin/sh
# 从docker官方hub.docker.com直接pull registry:2.1.1镜像
# docker pull registry:2.1.1
# 这里的2.1.1就是镜像registry 的tag版本
# -d代表的是daemon守护方式进行启动
# -p是宿主机端口和容器端口映射关系
# --restart=always代表此容器会在docker重启启动后自动创建
# --name就是一个昵称
# -v是宿主机磁盘目录和容器目录映射关系，俗称：磁盘卷
# 注意/var/libs/registry是registry的默认存储目录
# -e是在启动此容器时配置的环境变量
# 最后的registry:2.1.1则是以此镜像启动

mkdir -p /data/docker/registry

docker run -d --restart=always \
-p 5000:5000 \
--net=fykc \
--add-host="master:10.0.0.1" \
-e "REGISTRY_AUTH=htpasswd" \
-e "REGISTRY_AUTH_HTPASSWD_REALM=Registry Realm" \
-e REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd \
-v /data/docker/auth:/auth \
-v /data/docker/registry:/var/lib/registry \
--name registry \
registry
#!/bin/sh
docker rm -f zk3

docker run -d \
 --net=host \
 --name=zk3 \
 -e SERVER_ID=3 \
 -e ADDITIONAL_ZOOKEEPER_1=server.1=ip1:2888:3888 \
 -e ADDITIONAL_ZOOKEEPER_2=server.2=ip2:2888:3888 \
 -e ADDITIONAL_ZOOKEEPER_3=server.3=ip3:2888:3888 \
 -e ADDITIONAL_ZOOKEEPER_4=clientPort=2181 \
 -v /data/zookeeper:/tmp/zookeeper \
 garland/zookeeper
#!/bin/sh

#创建docker虚拟网络
docker network create --subnet=10.0.0.0/16 mynetwork
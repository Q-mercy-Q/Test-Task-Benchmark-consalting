#!/bin/bash

# Создаем сеть Docker
docker network create -d bridge --subnet=172.20.0.0/16 dockernet --opt "com.docker.network.bridge.name=dockernet"

# Запускаем контейнер PHP 7.4
docker run -d --name php7.4 --log-driver=json-file --restart=unless-stopped --ip=172.20.0.5 --network="dockernet" --dns 8.8.8.8 php_fpm:7.4-20231002_225802

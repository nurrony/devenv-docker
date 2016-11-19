#!/usr/bin/env bash

mysql(){
  del_stopped mysql
  local state=$(docker inspect --format "{{.State.Running}}" mysql 2>/dev/null)

  if [[ "$state" == "false" ]] || [[ "$state" == "" ]]; then
    echo "mysql server is not running, starting it for you."
    docker run -it -d \
      -v ${DEV_ZONE}/storage/mysql:/var/lib/mysql \
      -e MYSQL_ROOT_PASSWORD=nmrony \
      --net ronsvpn \
      --name mysql \
      k0st/alpine-mariadb > /dev/null 2>&1
  else
    echo 'mysql is already running'
  fi
}

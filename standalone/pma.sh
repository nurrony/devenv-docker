#!/usr/bin/env bash

pma() {
  del_stopped pma
  relies_on mysql
  sleep 3;
  local state=$(docker inspect --format "{{.State.Running}}" pma 2>/dev/null)

  if [[ "$state" == "false" ]] || [[ "$state" == "" ]]; then
      echo "phpMyAdmin is not running, starting it for you."
      docker run -it -d \
        -e VIRTUAL_HOST=pma.nmrony.docker \
        -e PMA_HOSTS=mysql,test_mariadb \
        --net ronsvpn \
        --name pma \
        phpmyadmin/phpmyadmin > /dev/null 2>&1
    else
      echo 'phpMyAdmin is already running'
    fi
}

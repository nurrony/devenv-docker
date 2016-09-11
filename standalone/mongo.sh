#!/usr/bin/env bash

mongodb(){
  del_stopped mongodb
  local state=$(docker inspect --format "{{.State.Running}}" mongodb 2>/dev/null)

  if [[ "$state" == "false" ]] || [[ "$state" == "" ]]; then
    echo "mongodb server is not running, starting it for you."
    docker run -it -d \
      -v ${DEV_ZONE}/storage/mongodb:/data/db \
      -p 27017:27017 \
      --net ronsvpn \
      --name mongodb \
      mvertes/alpine-mongo > /dev/null 2>&1
  else
    echo 'mongodb is already running'
  fi
}

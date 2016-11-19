#!/usr/bin/env bash

myblog(){
  relies_on nginx_proxy
  relies_on pma
  sleep 5
  del_stopped personal-blog
  local state=$(docker inspect --format "{{.State.Running}}" personal-blog 2>/dev/null)

  if [[ "$state" == "false" ]] || [[ "$state" == "" ]]; then
    echo "blog server is not running, starting it for you."
    docker run -it -d \
      -v ${DEV_ZONE}/open-sources/nmrony.info:/var/lib/ghost \
      -e VIRTUAL_HOST=blog.nmrony.docker \
      -e DEV_DOMAIN=http://blog.nmrony.docker \
      -p 2368:2368 \
      --net ronsvpn \
      --name personal-blog \
      zzrot/alpine-ghost > /dev/null 2>&1
  else
    echo 'blog is already running'
  fi
}

#!/usr/bin/env bash

nginx_proxy() {
  del_stopped nginx_proxy
  local state=$(docker inspect --format "{{.State.Running}}" nginx_proxy 2>/dev/null)

  if [[ "$state" == "false" ]] || [[ "$state" == "" ]]; then
    echo "proxy server is not running, starting it for you."
    docker run -it -d \
      -v /var/run/docker.sock:/tmp/docker.sock:ro \
      -v ${DEV_ZONE}/nginx/vhost.d:/etc/nginx/vhost.d \
      -p 80:80 \
      -p 443:443 \
      --net ronsvpn \
      --name nginx_proxy \
      jwilder/nginx-proxy > /dev/null 2>&1
  else
    echo 'proxy is already running'
  fi
}

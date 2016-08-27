#!/usr/bin/env bash

sysdig() {
  del_stopped sysdig-container
  docker run -it \
    --name sysdig-container \
    --privileged \
    -v /var/run/docker.sock:/host/var/run/docker.sock \
    -v /dev:/host/dev \
    -v /proc:/host/proc:ro \
    -v /boot:/host/boot:ro \
    -v /lib/modules:/host/lib/modules:ro \
    -v /usr:/host/usr:ro \
    sysdig/sysdig
}

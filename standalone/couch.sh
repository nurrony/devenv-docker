#!/usr/bin/env bash

couchdb(){
  del_stopped couchdb
  relies_on nginx-proxy

  local state=$(docker inspect --format "{{.State.Running}}" couchdb 2>/dev/null)

  if [[ "$state" == "false" ]] || [[ "$state" == "" ]]; then
    echo "couchdb server is not running, starting it for you."
    local COUCH_DB_ADMIN=${1:-root}
    local COUCH_DB_PASS=${2:-nmrony}
    # create new couchdb container
    docker run -it -d \
      -v ${DEV_ZONE}/storage/couchdb:/usr/local/var/lib/couchdb \
      -p 5984:5984 \
      -p 2049:2049 \
      -e COUCHDB_USER=${COUCH_DB_ADMIN} \
      -e COUCHDB_PASSWORD=${COUCH_DB_PASS} \
      -e VIRTUAL_HOST=couchdb.nmrony.docker \
      --net ronsvpn \
      --name couchdb \
      couchdb > /dev/null 2>&1
  else
    echo 'couchdb is already running'
  fi
}

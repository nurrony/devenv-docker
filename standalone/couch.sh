#!/usr/bin/env bash

couchdb(){

  # first check couchdb container is running or not
  local running=$(is_running nginx)
  local COUCH_DB_ADMIN=${1:-nmrony}
  local COUCH_DB_PASS=${2:-test}
  if [ "$running" = "true" ]
  then
    echo 'couchdb is already running'
  else
    docker run -it -d \
      -v ${DEV_ZONE}/storage/couchdb:/usr/local/var/lib/couchdb \
      -p 5984:5984 \
      -p 2049:2049 \
      -e COUCHDB_USER=${COUCH_DB_ADMIN} \
      -e COUCHDB_PASSWORD=${COUCH_DB_PASS} \
      -e VIRTUAL_HOST=couchdb.nmrony.docker \
      --net ronsvpn \
      --name couchdb \
      couchdb
  fi
}

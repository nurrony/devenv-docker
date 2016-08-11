#!/usr/bin/env bash

couchdb(){

  # Removed stopped couchdb containers first
  del_stopped couchdb

  local DB_ADMIN=${$1:-''}
  local DB_PASS=${$2:-''}

  docker run -it -d \
    -v ${DEV_ZONE}/storage/couchdb:/usr/local/var/lib/couchdb \
    -p 5984:5984
    -p 2049:2049
    -e COUCHDB_USER=${DB_ADMIN}
    -e COUCHDB_PASSWORD=${DB_PASS}
    --name couchdb \
    couchdb "$@"
}

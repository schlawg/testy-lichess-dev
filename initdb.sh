#!/bin/bash
UID="$(id -u)"
PW_ARGS=""
if [ $# -gt 1 ]; then
  PWDS="${@: -2}"
  echo "Initializing database with user password \"${PWDS% *}\" and admin password \"${@: -1}\""
  PW_ARGS="--password=${PWDS% *} --su-password=${@: -1}"
elif [ $# -gt 0 ]; then
  echo "Initializing database with all passwords \"${@: -1}\""
  PW_ARGS="--password=${@: -1}"
else
  echo "Initializing database with default passwords"
fi
docker compose run --rm -u ${UID:-1003} initdb bash -c "python3 /lila-db-seed/spamdb/spamdb.py --uri=mongodb://mongodb/lichess --drop-db --posts=500 --teams=10 --blogs=10 --user-bg=400 $PW_ARGS"
docker compose exec mongodb bash -c "mongosh --host mongodb lichess /lila/bin/mongodb/indexes.js"
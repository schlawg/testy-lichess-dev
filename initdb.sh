#!/bin/bash
UID="$(id -u)"

docker compose run --rm -u ${UID:-1003} initdb bash -c \
  "python3 /lila-db-seed/spamdb/spamdb.py --uri=mongodb://mongodb/lichess $@"

docker compose exec mongodb bash -c \
  "mongosh --host mongodb lichess /lila/bin/mongodb/indexes.js"
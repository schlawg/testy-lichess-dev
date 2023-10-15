#!/bin/bash

args="$@"

docker compose run --rm initdb bash -c \
  "python3 /lila-db-seed/spamdb/spamdb.py --uri=mongodb://mongodb/lichess $args"

docker compose exec mongodb bash -c \
  "mongosh --host mongodb lichess /lila/bin/mongodb/indexes.js"
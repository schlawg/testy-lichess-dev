#!/bin/bash

# this example script rebuilds and rebuilds the lila container with the latest from git

# export UID="$(id -u)"
# export GID="$(id -g)"

# export ORIGIN=https://testy.lichess.dev

cd $HOME/testy-lichess-dev

docker compose stop lila
pushd lila
git pull
popd
docker compose up -d lila
docker compose exec lila bash -c '/lila/ui/build'

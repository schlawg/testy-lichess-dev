#!/bin/bash

# this example script rebuilds the UI with the latest from git and restarts the container

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

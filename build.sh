#!/bin/bash
# this is a first time build script meant for a clean environment

# change the URL in the next line to your retrieve your fork/branch
git clone --depth 1 https://github.com/schlawg/lila

# same for any of these you want to customize
git clone --depth 1 https://github.com/lichess-org/lila-db-seed
git clone --depth 1 https://github.com/lichess-org/lila-ws
git clone --depth 1 https://github.com/lichess-org/lila-fishnet
git clone --depth 1 https://github.com/lichess-org/lifat
git clone --depth 1 https://github.com/cyanfish/bbpPairings lila/bbp

# if you need more services like lila-push or lila-gif, pull the code here and
# add an entry for each in docker-compose.yml

# prelink all the ? folders that I think our sbt builder image creates
ln -sf 'lila/?' .
ln -sf 'lila-ws/?' .
ln -sf 'lila-fishnet/?' .
ln -sf 'chessground/?' .

pushd lila/public
ln -sf ../../lifat
popd

cp conf/lila.conf lila/conf/application.conf

docker-compose up -d

docker compose run --rm -u ${UID:-1003} initdb bash -c "cd /lila/bbp && make"
docker compose exec lila bash -c /lila/ui/build

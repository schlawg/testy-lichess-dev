#!/bin/bash
# this is a first time build script meant for a clean environment

# change the URL in the next line to your retrieve your fork/branch
git clone -b master https://github.com/schlawg/lila
#pushd lila
# back out the jdk21 commit because jdk21 sbt dockers require root due to galaxy brain
# git checkout 4e0e2cc project/BuildSettings.scala
#popd

# same for any of these you want to customize
git clone --depth 1 https://github.com/lichess-org/lila-db-seed
git clone https://github.com/lichess-org/lila-ws
#pushd lila-ws
# back out the jdk21 commit because jdk21 sbt dockers require root due to galaxy brain
#git checkout 8a31164
#popd
git clone https://github.com/lichess-org/lila-fishnet
#pushd lila-fishnet
# back out the jdk21 commit because jdk21 sbt dockers require root due to galaxy brain
#git checkout 47c353e
#popd
git clone --depth 1 https://github.com/lichess-org/lifat
git clone --depth 1 https://github.com/cyanfish/bbpPairings lila/bbp

# if you need more services like lila-push or lila-gif, pull the code here and
# add an entry for each in docker-compose.yml

# prelink all the ? folders that I think our sbt builder image creates
ln -sf 'lila/?' .
ln -sf 'lila-ws/?' .
ln -sf 'lila-fishnet/?' .

pushd lila/public
ln -sf ../../lifat
popd

if [ -n "$1" ]; then
  # to use a custom conf, pass it as an argument
  cp "$1" lila/conf/application.conf
else
  cp conf/lila.conf lila/conf/application.conf
fi

# for some reason, lila-fishnet maxes out a core when run with sbt, but it's fine with stage script
docker compose run --rm lila --entrypoint "/bin/bash" -c "cd /lila-fishnet && sbt -Djava.io.tmpdir=. stage"

docker-compose up -d

docker compose run --rm initdb bash -c "cd /lila/bbp && make"
docker compose exec lila bash /lila/ui/build

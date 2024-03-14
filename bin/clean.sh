# here is an example script that builds everything from scratch. use the 
# --force argument to force a clean database.

if [ -d "$HOME/testy-lichess-dev" ]; then
  cd "$HOME/testy-lichess-dev"
  docker-compose down
fi

if [ ! -d "$HOME/.testy-db/.mongodb" ] || [ "$1" = "--force" ]; then
  rm -rf "$HOME/.testy-db"
  mkdir -p "$HOME/.testy-db/picfit"
  INITDB=true
fi

cd "$HOME"
docker rmi $(docker images -q) # remove all docker images, this is "clean.sh" damnit!

rm -rf testy-lichess-dev

git clone https://github.com/schlawg/testy-lichess-dev

cd testy-lichess-dev

./build.sh

if [ "$INITDB" ]; then
  # customize arguments to spamdb through initdb.sh
  #
  # example:
  # ./initdb.sh --password="foopassword" --su-password="barpassword"
  #   --secret="same-secret-as-application-conf"

  ./initdb.sh
fi

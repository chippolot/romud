#!/bin/bash
case "$OSTYPE" in
  darwin*|linux*) nodemon -x "go run . || exit 1" --signal SIGTERM -e go,ent,itm,lvl,lua ;;
  msys*|cygwin*) nodemon -x "go run . || exit 1" --signal SIGKILL -e go,ent,itm,lvl,lua ;;
  *)        echo "Cannot start script with unknown OSTYPE: $OSTYPE" ;;
esac
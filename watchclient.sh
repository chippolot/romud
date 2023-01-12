#!/bin/bash
case "$OSTYPE" in
  darwin*|linux*) nodemon -x "sleep 1.25 && telnet localhost 8080" --signal SIGTERM -e go,ent,itm,lvl ;;
  msys*|cygwin*) nodemon -x "sleep 1.25 && telnet localhost 8080" --signal SIGKILL -e go,ent,itm,lvl ;;
  *)        echo "Cannot start script with unknown OSTYPE: $OSTYPE" ;;
esac
#!/bin/bash
case "$OSTYPE" in
  darwin*|linux*) nodemon -x "sleep 1 && telnet localhost 8080" --signal SIGTERM -e go ;;
  msys*|cygwin*) nodemon -x "sleep 1 && telnet localhost 8080" --signal SIGKILL -e go ;;
  *)        echo "Cannot start script with unknown OSTYPE: $OSTYPE" ;;
esac
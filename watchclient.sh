#!/bin/bash
case "$OSTYPE" in
  darwin*|linux*) nodemon --delay 3  -x "telnet localhost 8080" --signal SIGTERM -e go,lua ;;
  msys*|cygwin*) nodemon  --delay 3 -x "telnet localhost 8080" --signal SIGKILL -e go,lua ;;
  *)        echo "Cannot start script with unknown OSTYPE: $OSTYPE" ;;
esac
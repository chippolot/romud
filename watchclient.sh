#!/bin/bash
case "$OSTYPE" in
  darwin*|linux*) nodemon --delay 3  -x "telnet localhost 4000" --signal SIGTERM -e go,lua,sh ;;
  msys*|cygwin*) nodemon  --delay 3 -x "telnet localhost 4000" --signal SIGKILL -e go,lua,sh ;;
  *)        echo "Cannot start script with unknown OSTYPE: $OSTYPE" ;;
esac
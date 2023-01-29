#!/bin/bash
case "$OSTYPE" in
  darwin*|linux*) nodemon --delay 1.5 -x "go run . || exit 1" --signal SIGTERM -e go,lua,sh,json ;;
  msys*|cygwin*) nodemon --delay 1.5 -x "go run . || exit 1" --signal SIGKILL -e go,lua,sh,json ;;
  *)        echo "Cannot start script with unknown OSTYPE: $OSTYPE" ;;
esac
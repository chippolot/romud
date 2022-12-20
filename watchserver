#!/bin/bash
case "$OSTYPE" in
  darwin*|linux*) nodemon -x "go run . || exit 1" --signal SIGTERM -e go ;;
  msys*|cygwin*) nodemon -x "go run . || exit 1" --signal SIGKILL -e go ;;
  *)        echo "Cannot start script with unknown OSTYPE: $OSTYPE" ;;
esac
#!/usr/bin/env bash
set -ef

SCRIPTS_DIR=$(dirname -- $0)
BASE_DIR=$(dirname -- "${SCRIPTS_DIR}")

. "${SCRIPTS_DIR}/_colours.sh"

url=$1

if [[ -z "$url" ]]; then
  echo 'Argument Error!'
  echo 'Please send the url to hit as an argument.'
  echo 'e.g.: scripts/hyperkube-curl.sh 10.0.0.65/info'
  exit 1
fi

echo_green "Curling IP for you inside the 'hyperkube' docker-machine..."
docker-machine ssh hyperkube curl -sS "$url" && echo

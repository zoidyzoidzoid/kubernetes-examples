#!/usr/bin/env bash
set -efu

SCRIPTS_DIR=$(dirname -- $0)
BASE_DIR=$(dirname -- "${SCRIPTS_DIR}")

. "${SCRIPTS_DIR}/_colours.sh"

echo_green "Creating 'hyperkube' docker-machine..."

docker-machine create -d virtualbox --virtualbox-cpu-count 2 --virtualbox-memory 4096 hyperkube

echo
echo "You'll need to run the following to interact with Docker:"
echo "    eval \$(docker-machine env hyperkube)"
echo

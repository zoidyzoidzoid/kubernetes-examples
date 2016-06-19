#!/usr/bin/env bash
set -efu

SCRIPTS_DIR=$(dirname -- $0)
BASE_DIR=$(dirname -- "${SCRIPTS_DIR}")

. "${SCRIPTS_DIR}/_colours.sh"

echo_green "Starting 'hyperkube' docker-machine..."

docker-machine start hyperkube

echo
echo "You'll need to run the following to interact with Docker:"
echo "    eval \$(docker-machine env hyperkube)"
echo

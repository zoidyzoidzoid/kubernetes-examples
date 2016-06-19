#!/usr/bin/env bash
set -efu

SCRIPTS_DIR=$(dirname -- $0)
BASE_DIR=$(dirname -- "${SCRIPTS_DIR}")

. "${SCRIPTS_DIR}/_colours.sh"

echo_green "Starting tunnel to Kubernetes API server on 'hyperkube' docker-machine..."
docker-machine ssh hyperkube -N -L 8080:localhost:8080

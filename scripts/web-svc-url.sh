#!/usr/bin/env bash
set -efu

SCRIPTS_DIR=$(dirname -- $0)
BASE_DIR=$(dirname -- "${SCRIPTS_DIR}")

. "${SCRIPTS_DIR}/_colours.sh"

NODE_IP=$(docker-machine ip hyperkube)
WEB_SVC_NODE_PORT=$(kubectl get svc/web -o=jsonpath="{.spec.ports[0].nodePort}")

echo_yellow "http://$NODE_IP:$WEB_SVC_NODE_PORT"

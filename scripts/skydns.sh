#!/usr/bin/env bash
set -efu

SCRIPTS_DIR=$(dirname -- $0)
BASE_DIR=$(dirname -- "${SCRIPTS_DIR}")

. "${SCRIPTS_DIR}/_colours.sh"

. "${SCRIPTS_DIR}/kubectl-configure.sh"

kubectl create namespace kube-system
kubectl create -f "${SCRIPTS_DIR}/skydns.yaml"

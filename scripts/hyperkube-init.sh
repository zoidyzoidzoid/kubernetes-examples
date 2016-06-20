#!/usr/bin/env bash
set -efu

SCRIPTS_DIR=$(dirname -- $0)
BASE_DIR=$(dirname -- "${SCRIPTS_DIR}")

. "${SCRIPTS_DIR}/_colours.sh"

. "${SCRIPTS_DIR}/kubectl-configure.sh"

set +e
kubectl create namespace kube-system
set -e

kubectl create -f "${SCRIPTS_DIR}/skydns.yaml"
kubectl create -f https://rawgit.com/kubernetes/dashboard/master/src/deploy/kubernetes-dashboard.yaml

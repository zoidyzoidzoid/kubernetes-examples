#!/usr/bin/env bash
set -efu

SCRIPTS_DIR=$(dirname -- $0)
BASE_DIR=$(dirname -- "${SCRIPTS_DIR}")

. "${SCRIPTS_DIR}/_colours.sh"

K8S_VERSION='v1.2.4' #$(curl -sS https://storage.googleapis.com/kubernetes-release/release/stable.txt)
ARCH='amd64'

echo
echo "Configuring environment for 'hyperkube' docker machine"

eval $(docker-machine env hyperkube)

echo_green "Starting hyperkube with Kubernetes version: ${K8S_VERSION}"
echo

docker run -d \
    --volume=/:/rootfs:ro \
    --volume=/sys:/sys:rw \
    --volume=/var/lib/docker/:/var/lib/docker:rw \
    --volume=/var/lib/kubelet/:/var/lib/kubelet:rw \
    --volume=/var/run:/var/run:rw \
    --net=host \
    --pid=host \
    --privileged \
    gcr.io/google_containers/hyperkube-${ARCH}:${K8S_VERSION} \
    /hyperkube kubelet \
        --containerized \
        --hostname-override=127.0.0.1 \
        --api-servers=http://localhost:8080 \
        --config=/etc/kubernetes/manifests \
        --cluster-dns=10.0.0.10 \
        --cluster-domain=cluster.local \
        --allow-privileged --v=2

echo
echo_green "Hyperkube is starting..."
echo "Don't forgot to configure 'kubectl' and start your tunnel to the API server"
echo
echo "You'll need to run the following to interact with Docker:"
echo "    eval \$(docker-machine env hyperkube)"
echo

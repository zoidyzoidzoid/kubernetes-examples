#!/usr/bin/env bash
set -efu

SCRIPTS_DIR=$(dirname -- $0)
BASE_DIR=$(dirname -- "${SCRIPTS_DIR}")

. "${SCRIPTS_DIR}/_colours.sh"

echo
echo "Configuring environment for 'hyperkube' docker machine"

eval $(docker-machine env hyperkube)

docker stop -f $(docker ps -aq)
docker rm -f $(docker ps -aq)

echo
echo "To finish cleaning up:"
echo "$ docker-machine ssh \$(docker-machine active)"
echo "> sudo umount \$(cat /proc/mounts | grep /var/lib/kubelet | awk '{print \$2}')"
echo "> sudo rm -rf /var/lib/kubelet"
echo

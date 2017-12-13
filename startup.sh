#!/bin/bash
set -x

echo -n Username:
read -s username
echo -n Password:
read -s password
echo

echo "Starting Docker container"
OPENVPN_PROVIDER=WINDSCRIBE
OPENVPN_USERNAME=$username
OPENVPN_PASSWORD=$password
OPENVPN_CONFIG=US-West-tcp

MOUNTED_PATH=/mounted

docker run    --cap-add=NET_ADMIN --device=/dev/net/tun -d \
              -v ${MOUNTED_PATH}:/data \
	      -v /etc/localtime:/etc/localtime:ro \
              -e "OPENVPN_PROVIDER=${OPENVPN_PROVIDER}" \
              -e "OPENVPN_CONFIG=${OPENVPN_CONFIG}" \
              -e "OPENVPN_USERNAME=${OPENVPN_USERNAME}" \
              -e "OPENVPN_PASSWORD=${OPENVPN_PASSWORD}" \
              -e "LOCAL_NETWORK=10.0.0.0/24" \
              -p 9091:9091 \
              --dns 8.8.8.8 \
              --dns 8.8.4.4 \
              dragondrop/terminiator

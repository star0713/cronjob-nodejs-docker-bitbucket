#! /bin/bash

if [ -z "$1" ];  then
        echo "  [!] No argument supplied, this script expects a docker tag to run."
        exit 1
fi

if [ -z "$2" ];  then
        echo "  [!] No argument supplied, this script expects a docker repo to run."
        exit 1
fi

tag=$1
repo=$2
image1="${repo}/web:${tag}"
image2="${repo}/cron:${tag}"

echo "[>] Starting deployment"

echo "  [+] Remove containers, volume and networks older than 1 week..."
docker container prune --force --filter "until=168h"

cd /docker


echo "  [+]  Pull image $image1"
pull=$(docker pull $image1)

# Check if docker pull returns empty string
if [[ -z "$pull" ]]; then
        echo "  [!] Fail to pull image with tag $image1"
        exit 1
fi

echo "  [+]  Pull image $image2"
pull=$(docker pull $image2)

# Check if docker pull returns empty string
if [[ -z "$pull" ]]; then
        echo "  [!] Fail to pull image with tag $image2"
        exit 1
fi

echo "  [+] Start (or Restart) containers: docker-compose up -d"
TAG=$tag docker-compose up -d

echo "[>] Deployment done."
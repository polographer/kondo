#!/usr/bin/env bash
set -euo pipefail

VERSION=0.1.0

echo "Building Backend"
docker build -t kondo:$VERSION -f Dockerfile.production .
echo "Building Assets"
docker run --entrypoint sh -d --name "kondo-assets-$VERSION" "kondo:$VERSION" echo "Assets Container UP"
echo "Exporting Assets"
docker cp "kondo-assets-$VERSION:/usr/src/app/public" ./ops/nginx/public
echo "Cleaning container"
docker rm "kondo-assets-$VERSION"
echo "Building Assets Container"
pushd ops/nginx
docker build -t "kondo-assets:$VERSION" .
echo "Succesfully built kondo:$VERSION"
echo "Succesfully built kondo-assets:$VERSION"
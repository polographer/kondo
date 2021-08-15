#!/usr/bin/env bash
set -euo pipefail

VERSION=0.1.0

echo "Cleaning Up"
git clean -xdf
echo "Building Backend"
docker build kondo:$VERSION -f Dockerfile.production .
echo "Building Assets"
docker run --name "kondo-assets-$VERSION" "kondo:$VERSION" bundle exec rake assets:precompile
echo "Exporting Assets"
docker cp "kondo-assets-$VERSION:/usr/src/app/public" ./ops/nginx/public
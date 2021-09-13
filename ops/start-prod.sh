#!/usr/bin/env bash
set -euo pipefail

docker-compose -f docker-compose.production.yml --env-file prod.env up
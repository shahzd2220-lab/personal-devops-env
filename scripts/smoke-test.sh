#!/usr/bin/env bash
set -euo pipefail

BASE_URL="${1:-http://localhost:8080}"
HEALTH_PATH="${2:-/health}"
URL="${BASE_URL}${HEALTH_PATH}"

echo "Checking ${URL}"
curl --fail --silent --show-error "$URL"
echo
echo "Smoke test passed"

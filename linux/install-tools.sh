#!/usr/bin/env bash
set -euo pipefail

if ! command -v apt-get >/dev/null 2>&1; then
  echo "This script is for Ubuntu/Debian systems with apt-get."
  exit 1
fi

sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg git make unzip

if ! command -v node >/dev/null 2>&1; then
  curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
  sudo apt-get install -y nodejs
fi

echo "Node and common Linux tools are installed."

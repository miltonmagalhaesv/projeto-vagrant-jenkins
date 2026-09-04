#!/usr/bin/env bash
set -euo pipefail

apt-get update
apt-get install -y curl ca-certificates
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt-get install -y nodejs

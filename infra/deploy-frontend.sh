#!/bin/bash
set -euo pipefail
if [ $# -ne 2 ]; then
  echo "Usage: $0 <resource-group> <app-name>"
  exit 1
fi
RG=$1
APP=$2

pushd ../frontend >/dev/null
 npm install
 npm run build
 zip -r ../frontend.zip dist
popd >/dev/null

az webapp deploy --resource-group "$RG" --name "$APP" --src-path frontend.zip --type zip
rm frontend.zip

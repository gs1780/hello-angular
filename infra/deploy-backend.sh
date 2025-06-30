#!/bin/bash
set -euo pipefail
if [ $# -ne 2 ]; then
  echo "Usage: $0 <resource-group> <app-name>"
  exit 1
fi
RG=$1
APP=$2

pushd ../backend >/dev/null
 dotnet publish -c Release -o publish
 zip -r ../backend.zip publish
popd >/dev/null

az webapp deploy --resource-group "$RG" --name "$APP" --src-path backend.zip --type zip
rm backend.zip

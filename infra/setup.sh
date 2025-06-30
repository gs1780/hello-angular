#!/bin/bash
set -euo pipefail
if [ $# -ne 5 ]; then
  echo "Usage: $0 <resource-group> <location> <plan-name> <frontend-app-name> <backend-app-name>"
  exit 1
fi
RG=$1
LOCATION=$2
PLAN=$3
FRONTEND=$4
BACKEND=$5

az appservice plan create --name "$PLAN" --resource-group "$RG" --location "$LOCATION" --sku B1 --is-linux
az webapp create --name "$BACKEND" --plan "$PLAN" --resource-group "$RG" --runtime "DOTNET:8"
az webapp create --name "$FRONTEND" --plan "$PLAN" --resource-group "$RG" --runtime "NODE:20LTS"

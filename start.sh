#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
export BTL_DB_USERNAME="${BTL_DB_USERNAME:-app_user}"
if [[ -z "${BTL_DB_PASSWORD:-}" ]]; then
  read -rsp 'MySQL app_user password: ' BTL_DB_PASSWORD
  echo
  export BTL_DB_PASSWORD
fi
exec java -jar dist/teaching-management-1.0.0.jar

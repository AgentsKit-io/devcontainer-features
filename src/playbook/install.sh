#!/bin/sh
set -eu

GATES_VERSION="${GATESVERSION:-0.1.0}"

case "${GATES_VERSION}" in
  ''|*[!0-9A-Za-z.+-]*)
    echo "Invalid gatesVersion: ${GATES_VERSION}" >&2
    exit 1
    ;;
esac

if ! command -v npm >/dev/null 2>&1; then
  echo "npm is required but was not installed by the Node Feature." >&2
  exit 1
fi

npm install --global --no-audit --no-fund "@agentskit/playbook@${GATES_VERSION}"
agents-playbook --version

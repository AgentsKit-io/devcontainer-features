#!/bin/bash
set -e

source dev-container-features-test-lib

check "installs the requested Playbook version" bash -c "agents-playbook --version | grep '^0.1.0$'"
check "exposes all Playbook gates" bash -c "agents-playbook list --json | node -e 'let data=\"\"; process.stdin.on(\"data\", chunk => data += chunk); process.stdin.on(\"end\", () => { if (JSON.parse(data).length !== 12) process.exit(1) })'"

reportResults

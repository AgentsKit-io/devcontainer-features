#!/bin/bash
set -e

source dev-container-features-test-lib

check "installs the default Playbook version" bash -c "agents-playbook --version | grep '^0.1.0$'"
check "installs the Playbook alias" bash -c "ak-playbook --version | grep '^0.1.0$'"

reportResults

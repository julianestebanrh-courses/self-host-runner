#!/bin/bash

set -e

echo "Generating Suffix..."
RUNNER_SUFFIX=$(cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 5 | head -n 1)

echo "Generating Suffix..."
RUNNER_NAME="dockerNode-${RUNNER_SUFFIX}"

echo "Generating runner name..."
cd /home/actions-runner

if [ -n "$GITHUB_ORG" ] && [ -n "$GITHUB_TOKEN" ]; then

  echo "Generating the runner token..."
  RUNNER_TOKEN=$(curl -sX POST -H "Accept: application/vnd.github.v3+json" -H "Authorization: token ${GITHUB_TOKEN}" https://api.github.com/orgs/${GITHUB_ORG}/actions/runners/registration-token | jq .token --raw-output)

  echo "Configuring the runner..."
  ./config.sh --url "https://github.com/$GITHUB_ORG" --token "$RUNNER_TOKEN" --unattended --replace

  cleanup() {
    echo "Removing runner..."
    ./config.sh remove --unattended --token ${RUNNER_TOKEN}
  }

  trap 'cleanup; exit 130' INT
  trap 'cleanup; exit 143' TERM

else
  # echo "Error: GITHUB_REPO y RUNNER_TOKEN no están configurados."
  echo "Error: GITHUB_ORG y GITHUB_TOKEN no están configurados."
  exit 1
fi

exec ./run.sh & wait $!

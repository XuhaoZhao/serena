#!/bin/bash
set -e

# Activate the Python virtual environment
source /workspaces/serena/.venv/bin/activate

# If NPM_REGISTRY is set at runtime, override the npm registry.
# This allows the registry to be changed at container start time,
# which is useful when the image is deployed to an internal network.
if [ -n "${NPM_REGISTRY}" ]; then
    echo "[entrypoint] Setting npm registry to: ${NPM_REGISTRY}"
    npm config set registry "${NPM_REGISTRY}"
fi

# Execute the main command
exec "$@"

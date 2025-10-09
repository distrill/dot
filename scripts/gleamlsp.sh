#!/bin/bash
# gleam-lsp-wrapper.sh
# Make this executable: chmod +x gleam-lsp-wrapper.sh

# Find the project root (directory containing gleam.toml)
PROJECT_ROOT=$(pwd)
while [[ "$PROJECT_ROOT" != "/" ]] && [[ ! -f "$PROJECT_ROOT/gleam.toml" ]]; do
    PROJECT_ROOT=$(dirname "$PROJECT_ROOT")
done

if [[ ! -f "$PROJECT_ROOT/gleam.toml" ]]; then
    echo "Error: Could not find gleam.toml in project hierarchy" >&2
    exit 1
fi

# Check if container is already running
CONTAINER_NAME="mntl-server_lsp"

if ! docker ps --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
    # Start new container
    docker run -d \
        --name "$CONTAINER_NAME" \
        --rm \
        -v "$PROJECT_ROOT:/app" \
        -w /app \
        mntl-server_lsp \
        tail -f /dev/null
fi

# Execute the LSP server
exec docker exec -i "$CONTAINER_NAME" gleam lsp

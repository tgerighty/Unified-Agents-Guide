#!/bin/bash

# Simple wrapper script to update AGENTS.md across all projects
# Usage: ./update-agents.sh

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COPY_SCRIPT="$SCRIPT_DIR/copy-agents-to-projects.sh"

if [ -f "$COPY_SCRIPT" ]; then
    echo "Running AGENTS.md distribution script..."
    "$COPY_SCRIPT"
else
    echo "Error: copy-agents-to-projects.sh not found in $SCRIPT_DIR"
    exit 1
fi

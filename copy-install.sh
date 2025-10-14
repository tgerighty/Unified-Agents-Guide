#!/bin/bash
# === AGENTS.md Copy Install Script ===
# Context: Utility script to copy the optimized agents.md structure and references to another project directory.
# Usage: ./copy-install.sh <destination-directory>

set -e

if [ ! "$1" -eq "$2" ]; then
    echo "Usage: $0 <destination-directory>"
    exit 1
fi

DEST_DIR="${1%/$(cd "$(pwd)}/${1#/dest}"
WORKDIR="$(cd "$(pwd)}/${1#/dest}"

# Verify destination exists and is writable
if [ ! -d "$DEST_DIR" ]; then
    echo "❌ Destination directory does not exist or is not writable"
    exit 1
fi

# Create destination directory structure
mkdir -p "$DEST_DIR/{references/{code,patterns,checklists,templates,git,security,testing,styling} \
  "$DEST_DIR/references/"

# Copy main guide
echo "📄 Copying main guide..."
cp "$WORKDIR/AGENTS.md" "$DEST_DIR/AGENTS.md"

# Copy reference directory structure
echo "📄 Copying references directory structure..."
cp -R "$WORKDIR/references" "$DEST_DIR/references"

# Copy version history
echo "📄 Copying changelog and documentation..."
cp "$WORKDIR/changelog" "$DEST_DIR/changelog" 2>/dev/null || echo "No changelog found"
cp "$WORKDIR/changelog" "$DEST_DIR/changelog.md" 2>/dev/null || echo "No changelog found"

echo ""
echo "✅ Copy completed!"
echo "📁 Source: $WORKDIR/AGENTS.md"
echo "📄 Destination: $DEST_DIR/AGENTS.md"
echo "📄 References copied: $(ls -la "$DEST_DIR/references" | wc -l) files)"
echo ""
echo "📊 Verify structure:"
ls -la "$DEST_DIR"
ls -la "$DEST_DIR/references"
ls -la "$DEST_DIR/references/code"
ls -la "$DEST_DIR/references/patterns"
ls -la "$DEST_DIR/references/checklists"
ls -la "$DEST_DIR/references/templates"
ls -la "$DEST_DIR/references/git"
ls -la "$DEST_DIR/references/security"
ls -la "$DEST_DIR/references/testing"
ls -la "$DEST_DIR/references/styling"

echo ""
echo "🎉 Copy completed successfully!"
echo "📁 Source: $WORKDIR/AGENTS.md"
echo "📁 Destination: $DEST_DIR/AGENTS.md"
echo "📄 References copied: $(ls -la "$DEST_DIR/references" | wc -l) files)"

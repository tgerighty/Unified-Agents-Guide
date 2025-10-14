#!/bin/bash
# === AGENTS.md Copy Install Script ===
# Context: Utility script to copy the optimized agents.md structure and references to another project directory.
# Usage: ./copy-install.sh <destination-directory>

set -e

# Function to prompt for destination directory
prompt_destination() {
    echo ""
    echo "📁 Please enter the destination directory path:"
    echo "   (This can be an absolute path or relative to current directory)"
    echo ""
    read -p "Destination: " user_dest
    
    if [ -z "$user_dest" ]; then
        echo "❌ No destination provided. Exiting."
        exit 1
    fi
    
    # Convert to absolute path
    if [[ "$user_dest" == /* ]]; then
        DEST_DIR="${user_dest%/}"
    else
        DEST_DIR="$(pwd)/${user_dest%/}"
    fi
}

# Check if destination directory was provided as argument
if [ -z "$1" ]; then
    echo "ℹ️  No destination directory provided."
    prompt_destination
else
    # Remove trailing slash from destination directory
    DEST_DIR="${1%/}"
fi
# Set working directory to current script directory
WORKDIR="$(cd "$(dirname "$0")" && pwd)"

# Function to handle existing agents.md file
handle_existing_agents() {
    local agents_file="$DEST_DIR/AGENTS.md"
    
    if [ -f "$agents_file" ]; then
        echo ""
        echo "⚠️  Found existing AGENTS.md in destination directory:"
        echo "   $agents_file"
        echo ""
        echo "What would you like to do?"
        echo "1) Overwrite the existing file"
        echo "2) Create backup and overwrite"
        echo "3) Cancel operation"
        echo ""
        
        while true; do
            read -p "Choose an option (1/2/3): " choice
            case $choice in
                1)
                    echo "🗑️  Overwriting existing AGENTS.md..."
                    return 0
                    ;;
                2)
                    local backup_file="$agents_file.backup.$(date +%Y%m%d_%H%M%S)"
                    echo "💾 Creating backup: $backup_file"
                    cp "$agents_file" "$backup_file"
                    echo "🗑️  Overwriting existing AGENTS.md..."
                    return 0
                    ;;
                3)
                    echo "❌ Operation cancelled by user."
                    exit 0
                    ;;
                *)
                    echo "❌ Invalid option. Please choose 1, 2, or 3."
                    ;;
            esac
        done
    fi
}

# Create destination directory if it doesn't exist
if [ ! -d "$DEST_DIR" ]; then
    echo "📁 Creating destination directory: $DEST_DIR"
    mkdir -p "$DEST_DIR"
fi

# Handle existing agents.md file
handle_existing_agents

# Create destination directory structure (matches actual references structure)
mkdir -p "$DEST_DIR/references/"{checklists,clean-code,code,errors,git,patterns,prisma,security,styling,templates,testing,typescript}

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

# Function to update .gitignore file
update_gitignore() {
    local gitignore_file="$DEST_DIR/.gitignore"
    local agents_entry="AGENTS.md"
    local references_entry="references/"
    
    # Check if .gitignore exists in destination
    if [ -f "$gitignore_file" ]; then
        echo "📄 Found existing .gitignore file"
        
        # Check if AGENTS.md is already ignored
        if grep -q "^$agents_entry$" "$gitignore_file"; then
            echo "✓ AGENTS.md already in .gitignore"
        else
            echo "➕ Adding AGENTS.md to .gitignore"
            echo "$agents_entry" >> "$gitignore_file"
        fi
        
        # Check if references/ is already ignored
        if grep -q "^$references_entry$" "$gitignore_file"; then
            echo "✓ references/ already in .gitignore"
        else
            echo "➕ Adding references/ to .gitignore"
            echo "$references_entry" >> "$gitignore_file"
        fi
        
        # Add a comment if this is the first time adding these entries
        if ! grep -q "# Factory.ai agents" "$gitignore_file"; then
            echo "" >> "$gitignore_file"
            echo "# Factory.ai agents - copied documentation" >> "$gitignore_file"
            echo "$agents_entry" >> "$gitignore_file"
            echo "$references_entry" >> "$gitignore_file"
        fi
        
        # Remove any duplicate entries
        temp_file=$(mktemp)
        awk '!seen[$0]++' "$gitignore_file" > "$temp_file" && mv "$temp_file" "$gitignore_file"
        
    else
        echo "📄 Creating new .gitignore file"
        echo "# Factory.ai agents - copied documentation" > "$gitignore_file"
        echo "$agents_entry" >> "$gitignore_file"
        echo "$references_entry" >> "$gitignore_file"
        echo "" >> "$gitignore_file"
        echo "# Add your project-specific .gitignore entries below this line" >> "$gitignore_file"
    fi
}

# Update .gitignore to ignore copied files
echo "📄 Updating .gitignore file..."
update_gitignore

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
ls -la "$DEST_DIR/references/clean-code"
ls -la "$DEST_DIR/references/errors"
ls -la "$DEST_DIR/references/prisma"
ls -la "$DEST_DIR/references/typescript"

echo ""
echo "🎉 Copy completed successfully!"
echo "📁 Source: $WORKDIR/AGENTS.md"
echo "📁 Destination: $DEST_DIR/AGENTS.md"
echo "📄 References copied: $(ls -la "$DEST_DIR/references" | wc -l) files)"

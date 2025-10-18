#!/bin/bash

# Script to copy AGENTS.md to all projects in ~/nxio/projects/ and ~/nxio/tools/
# This ensures all projects have access to the latest agent guidelines

set -e  # Exit on any error

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Source and destination paths
SOURCE_FILE="/Users/terry.gerighty/Library/Mobile Documents/com~apple~CloudDocs/Documents/nxio.ai/tools/agents/AGENTS.md"
PROJECTS_BASE="/Users/terry.gerighty/Library/Mobile Documents/com~apple~CloudDocs/Documents/nxio.ai/projects"
TOOLS_BASE="/Users/terry.gerighty/Library/Mobile Documents/com~apple~CloudDocs/Documents/nxio.ai/tools"

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to copy AGENTS.md to a directory
copy_agents_to_dir() {
    local target_dir="$1"
    local target_path="$target_dir/AGENTS.md"
    
    if [ ! -d "$target_dir" ]; then
        print_warning "Directory does not exist: $target_dir"
        return 1
    fi
    
    # Check if it's a git repository (most projects should be)
    if [ -d "$target_dir/.git" ]; then
        print_status "Copying AGENTS.md to git repository: $target_dir"
        
        # Copy the file
        cp "$SOURCE_FILE" "$target_path"
        
        # Check if copy was successful
        if [ $? -eq 0 ]; then
            print_success "✓ Copied to: $target_path"
            
            # Optionally add to git if git is available and there are changes
            cd "$target_dir"
            if git diff --quiet AGENTS.md 2>/dev/null; then
                print_status "No changes detected in $target_dir/AGENTS.md"
            else
                print_status "Changes detected, you may want to commit: git add AGENTS.md"
            fi
            cd - > /dev/null
        else
            print_error "Failed to copy to: $target_path"
            return 1
        fi
    else
        print_status "Copying AGENTS.md to non-git directory: $target_dir"
        cp "$SOURCE_FILE" "$target_path"
        
        if [ $? -eq 0 ]; then
            print_success "✓ Copied to: $target_path"
        else
            print_error "Failed to copy to: $target_path"
            return 1
        fi
    fi
}

# Function to process all subdirectories in a base directory
process_directory() {
    local base_dir="$1"
    local dir_type="$2"
    
    print_status "\n=== Processing $dir_type directories in: $base_dir ==="
    
    if [ ! -d "$base_dir" ]; then
        print_error "Base directory does not exist: $base_dir"
        return 1
    fi
    
    local count=0
    local success_count=0
    
    # Loop through all subdirectories
    for dir in "$base_dir"/*; do
        if [ -d "$dir" ]; then
            count=$((count + 1))
            dir_name=$(basename "$dir")
            
            print_status "Processing $dir_type: $dir_name"
            
            if copy_agents_to_dir "$dir"; then
                success_count=$((success_count + 1))
            fi
            
            echo  # Add spacing between entries
        fi
    done
    
    print_status "Completed $dir_type processing: $success_count/$count directories updated"
}

# Main script execution
main() {
    echo "=========================================="
    echo "AGENTS.md Distribution Script"
    echo "=========================================="
    echo "Source: $SOURCE_FILE"
    echo "Date: $(date)"
    echo "=========================================="
    
    # Check if source file exists
    if [ ! -f "$SOURCE_FILE" ]; then
        print_error "Source file does not exist: $SOURCE_FILE"
        exit 1
    fi
    
    print_status "Source file found: $SOURCE_FILE"
    
    # Process projects directory
    process_directory "$PROJECTS_BASE" "project"
    
    # Process tools directory (excluding the agents directory itself to avoid recursion)
    print_status "\n=== Processing tools directories in: $TOOLS_BASE ==="
    
    if [ -d "$TOOLS_BASE" ]; then
        local tools_count=0
        local tools_success_count=0
        
        for dir in "$TOOLS_BASE"/*; do
            if [ -d "$dir" ] && [ "$(basename "$dir")" != "agents" ]; then
                tools_count=$((tools_count + 1))
                dir_name=$(basename "$dir")
                
                print_status "Processing tool: $dir_name"
                
                if copy_agents_to_dir "$dir"; then
                    tools_success_count=$((tools_success_count + 1))
                fi
                
                echo  # Add spacing between entries
            fi
        done
        
        print_status "Completed tools processing: $tools_success_count/$tools_count directories updated"
    else
        print_error "Tools base directory does not exist: $TOOLS_BASE"
    fi
    
    echo "=========================================="
    print_success "AGENTS.md distribution completed!"
    echo "=========================================="
    
    # Summary
    total_dirs=$((success_count + tools_success_count))
    echo "Total directories updated: $total_dirs"
    echo "Run date: $(date)"
}

# Check if script is being sourced or executed
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi

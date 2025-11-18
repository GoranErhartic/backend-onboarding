#!/bin/bash

# Installation script for Cursor IDE Onboarding Commands (Mac/Linux)
# This script copies all onboarding step files to ~/.cursor/commands/

set -e  # Exit on error

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_ROOT="$( cd "$SCRIPT_DIR/.." && pwd )"

# Target directory
TARGET_DIR="$HOME/.cursor/commands/onboarding"

echo -e "${YELLOW}Installing Cursor IDE Onboarding Commands...${NC}"
echo ""

# Create target directory if it doesn't exist
if [ ! -d "$TARGET_DIR" ]; then
    echo -e "${YELLOW}Creating directory: $TARGET_DIR${NC}"
    mkdir -p "$TARGET_DIR"
fi

# List of files to copy
FILES=(
    "commands/initialize.md"
    "commands/discovery/analyze-core-and-endpoints.md"
    "commands/discovery/analyze-endpoint-flows.md"
    "commands/analysis/analyze-architecture.md"
    "commands/analysis/analyze-config-and-testing.md"
    "commands/analysis/analyze-integrations.md"
    "commands/analysis/analyze-domain-and-performance.md"
    "commands/advanced/generate-quick-reference.md"
    "commands/advanced/analyze-code-structure.md"
    "commands/advanced/assess-production-readiness.md"
)

# Copy each file
COPIED=0
SKIPPED=0

for file in "${FILES[@]}"; do
    SOURCE_FILE="$REPO_ROOT/$file"
    FILENAME=$(basename "$file")
    TARGET_FILE="$TARGET_DIR/$FILENAME"
    
    if [ -f "$SOURCE_FILE" ]; then
        if [ -f "$TARGET_FILE" ]; then
            echo -e "${YELLOW}File already exists: $FILENAME${NC}"
            read -p "Overwrite? (y/N): " -n 1 -r
            echo
            if [[ $REPLY =~ ^[Yy]$ ]]; then
                cp "$SOURCE_FILE" "$TARGET_FILE"
                echo -e "${GREEN}✓ Copied: $FILENAME${NC}"
                ((COPIED++))
            else
                echo -e "${YELLOW}⊘ Skipped: $FILENAME${NC}"
                ((SKIPPED++))
            fi
        else
            cp "$SOURCE_FILE" "$TARGET_FILE"
            echo -e "${GREEN}✓ Copied: $FILENAME${NC}"
            ((COPIED++))
        fi
    else
        echo -e "${RED}✗ File not found: $file${NC}"
    fi
done

echo ""
echo -e "${GREEN}Installation complete!${NC}"
echo -e "Copied: ${GREEN}$COPIED${NC} files"
if [ $SKIPPED -gt 0 ]; then
    echo -e "Skipped: ${YELLOW}$SKIPPED${NC} files"
fi
echo ""
echo "Files installed to: $TARGET_DIR"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo "1. Restart Cursor IDE if it's currently running"
echo "2. Open a project workspace"
echo "3. Start a new chat and type: /onboarding/initialize (should run first)"
echo "4. Then run any step: /onboarding/analyze-core-and-endpoints, /onboarding/analyze-endpoint-flows, etc."
echo ""
echo "See README.md or QUICK_START.md for detailed usage instructions."

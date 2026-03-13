#!/bin/bash
# install.sh
# Installs the Amazon Doc Agents global agent files to ~/.claude/agents/
# Run this once on any machine to make the agents available in all Claude Code sessions.

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AGENTS_SOURCE="$SCRIPT_DIR/agents"
AGENTS_DEST="$HOME/.claude/agents"

echo ""
echo "Amazon Doc Agents — Installer"
echo "=============================="
echo ""

# Check source directory exists
if [ ! -d "$AGENTS_SOURCE" ]; then
  echo "ERROR: agents/ directory not found at $AGENTS_SOURCE"
  echo "Make sure you are running this script from the amazon-doc-agents project directory."
  echo ""
  exit 1
fi

# Check there are agent files to install
agent_count=$(find "$AGENTS_SOURCE" -name "*.md" | wc -l | tr -d ' ')
if [ "$agent_count" -eq 0 ]; then
  echo "ERROR: No .md agent files found in $AGENTS_SOURCE"
  exit 1
fi

# Create ~/.claude/agents/ if it does not exist
if [ ! -d "$AGENTS_DEST" ]; then
  echo "Creating $AGENTS_DEST ..."
  mkdir -p "$AGENTS_DEST"
fi

# Copy each agent file
echo "Installing $agent_count agent(s) to $AGENTS_DEST ..."
echo ""

for agent_file in "$AGENTS_SOURCE"/*.md; do
  if [ -f "$agent_file" ]; then
    filename=$(basename "$agent_file")
    dest_file="$AGENTS_DEST/$filename"

    if [ -f "$dest_file" ]; then
      echo "  Updated:   $filename"
    else
      echo "  Installed: $filename"
    fi

    cp "$agent_file" "$dest_file"
  fi
done

echo ""
echo "Installed agents:"
echo ""
for agent_file in "$AGENTS_DEST"/*.md; do
  if [ -f "$agent_file" ]; then
    name=$(grep "^name:" "$agent_file" 2>/dev/null | head -1 | sed 's/^name:[[:space:]]*//' | tr -d '[:space:]')
    desc=$(grep "^description:" "$agent_file" 2>/dev/null | head -1 | sed 's/^description:[[:space:]]*//')
    echo "  $name"
    echo "    $desc"
    echo ""
  fi
done

echo "=============================="
echo "Done. Agents are now available in all Claude Code sessions."
echo ""
echo "To verify, open Claude Code in any directory and run: /agents"
echo ""
echo "To use this project's slash commands and templates, open Claude Code"
echo "from this project directory:"
echo ""
echo "    cd $SCRIPT_DIR"
echo "    claude ."
echo ""

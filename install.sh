#!/bin/bash
# install.sh
# Installs the Amazon Doc Agents and slash commands globally.
# Run this once on any machine to make them available in all Claude Code sessions.

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AGENTS_SOURCE="$SCRIPT_DIR/agents"
AGENTS_DEST="$HOME/.claude/agents"
COMMANDS_SOURCE="$SCRIPT_DIR/.claude/commands"
COMMANDS_DEST="$HOME/.claude/commands"

echo ""
echo "Amazon Doc Agents — Installer"
echo "=============================="
echo ""

# Check source directories exist
if [ ! -d "$AGENTS_SOURCE" ]; then
  echo "ERROR: agents/ directory not found at $AGENTS_SOURCE"
  echo "Make sure you are running this script from the amazon-doc-agents project directory."
  echo ""
  exit 1
fi

if [ ! -d "$COMMANDS_SOURCE" ]; then
  echo "ERROR: .claude/commands/ directory not found at $COMMANDS_SOURCE"
  echo "Make sure you are running this script from the amazon-doc-agents project directory."
  echo ""
  exit 1
fi

# Check there are files to install
agent_count=$(find "$AGENTS_SOURCE" -name "*.md" | wc -l | tr -d ' ')
if [ "$agent_count" -eq 0 ]; then
  echo "ERROR: No .md agent files found in $AGENTS_SOURCE"
  exit 1
fi

command_count=$(find "$COMMANDS_SOURCE" -name "*.md" | wc -l | tr -d ' ')
if [ "$command_count" -eq 0 ]; then
  echo "ERROR: No .md command files found in $COMMANDS_SOURCE"
  exit 1
fi

# Create destination directories if they do not exist
if [ ! -d "$AGENTS_DEST" ]; then
  echo "Creating $AGENTS_DEST ..."
  mkdir -p "$AGENTS_DEST"
fi

if [ ! -d "$COMMANDS_DEST" ]; then
  echo "Creating $COMMANDS_DEST ..."
  mkdir -p "$COMMANDS_DEST"
fi

# Copy agent files
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

# Copy command files
echo ""
echo "Installing $command_count command(s) to $COMMANDS_DEST ..."
echo ""

for cmd_file in "$COMMANDS_SOURCE"/*.md; do
  if [ -f "$cmd_file" ]; then
    filename=$(basename "$cmd_file")
    dest_file="$COMMANDS_DEST/$filename"

    if [ -f "$dest_file" ]; then
      echo "  Updated:   $filename"
    else
      echo "  Installed: $filename"
    fi

    cp "$cmd_file" "$dest_file"
  fi
done

echo ""
echo "------------------------------"
echo "Installed agents:"
echo ""
for agent_file in "$AGENTS_DEST"/*.md; do
  if [ -f "$agent_file" ]; then
    name=$(grep "^name:" "$agent_file" 2>/dev/null | head -1 | sed 's/^name:[[:space:]]*//' | tr -d '[:space:]')
    desc=$(grep "^description:" "$agent_file" 2>/dev/null | head -1 | sed 's/^description:[[:space:]]*//')
    if [ -n "$name" ]; then
      echo "  $name"
      echo "    $desc"
      echo ""
    fi
  fi
done

echo "------------------------------"
echo "Installed commands:"
echo ""
for cmd_file in "$COMMANDS_DEST"/*.md; do
  if [ -f "$cmd_file" ]; then
    filename=$(basename "$cmd_file" .md)
    echo "  /$filename"
  fi
done

echo ""
echo "=============================="
echo "Done. Agents and commands are now available in all Claude Code sessions."
echo ""
echo "To verify:"
echo "  - Agents: open Claude Code and check /agents"
echo "  - Commands: type / and look for the installed commands"
echo ""

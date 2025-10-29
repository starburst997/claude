#!/bin/bash

# Read the custom instructions from the context file
CONTEXT_FILE="${CLAUDE_PLUGIN_ROOT}/context/instructions.md"

if [ -f "$CONTEXT_FILE" ]; then
  # Read the file and escape it properly for JSON
  CONTEXT=$(cat "$CONTEXT_FILE" | jq -Rs .)

  # Output in the required JSON format for SessionStart hook
  cat << EOF
{
  "hookSpecificOutput": {
    "hookEventName": "SessionStart",
    "additionalContext": $CONTEXT
  }
}
EOF
else
  # If context file doesn't exist, output empty additionalContext
  cat << 'EOF'
{
  "hookSpecificOutput": {
    "hookEventName": "SessionStart",
    "additionalContext": ""
  }
}
EOF
fi

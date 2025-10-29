#!/bin/bash

# Define potential context files
PROJECT_CONTEXT="${PWD}/CONTEXT.md"
PROJECT_CONTEXT_ADD="${PWD}/CONTEXT_ADD.md"
DEFAULT_CONTEXT="${CLAUDE_PLUGIN_ROOT}/context/instructions.md"

# Initialize context content
CONTEXT_CONTENT=""

# Check for project-specific CONTEXT.md first (takes precedence)
if [ -f "$PROJECT_CONTEXT" ]; then
  CONTEXT_CONTENT=$(cat "$PROJECT_CONTEXT")
else
  # Fall back to default plugin context
  if [ -f "$DEFAULT_CONTEXT" ]; then
    CONTEXT_CONTENT=$(cat "$DEFAULT_CONTEXT")
  fi
fi

# Append CONTEXT_ADD.md if it exists (works with both project and default context)
if [ -f "$PROJECT_CONTEXT_ADD" ]; then
  if [ -n "$CONTEXT_CONTENT" ]; then
    CONTEXT_CONTENT="${CONTEXT_CONTENT}"$'\n\n'"$(cat "$PROJECT_CONTEXT_ADD")"
  else
    CONTEXT_CONTENT=$(cat "$PROJECT_CONTEXT_ADD")
  fi
fi

# Output the context
if [ -n "$CONTEXT_CONTENT" ]; then
  # Escape the content properly for JSON
  CONTEXT=$(echo "$CONTEXT_CONTENT" | jq -Rs .)

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
  # If no context files exist, output empty additionalContext
  cat << 'EOF'
{
  "hookSpecificOutput": {
    "hookEventName": "SessionStart",
    "additionalContext": ""
  }
}
EOF
fi

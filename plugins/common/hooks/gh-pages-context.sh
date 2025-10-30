#!/bin/bash

# This hook detects when /common:gh-pages is called and injects the appropriate theme template file

# Get the user prompt from stdin (UserPromptSubmit hook receives the prompt as input)
USER_PROMPT=$(cat)

# Check if the prompt contains /common:gh-pages
if [[ "$USER_PROMPT" =~ /common:gh-pages ]]; then
  # Default theme is dark
  THEME="dark"

  # Extract theme argument if present (supports both theme=light and theme=dark)
  if [[ "$USER_PROMPT" =~ theme=([a-z]+) ]]; then
    THEME="${BASH_REMATCH[1]}"
  fi

  # Validate theme (only dark or light are allowed)
  if [[ "$THEME" != "dark" && "$THEME" != "light" ]]; then
    THEME="dark"
  fi

  # Path to the template file
  TEMPLATE_FILE="${CLAUDE_PLUGIN_ROOT}/context/${THEME}.html"

  # Check if template file exists
  if [ -f "$TEMPLATE_FILE" ]; then
    # Read the template file content and escape it properly for JSON
    TEMPLATE_CONTENT=$(cat "$TEMPLATE_FILE")

    # Create the full context message
    CONTEXT_MESSAGE="# GitHub Pages Theme Template

The following ${THEME} theme template has been automatically loaded for your use as inspiration:

\`\`\`html
${TEMPLATE_CONTENT}
\`\`\`

Use this template as visual inspiration for styling, color palette, and component design. Adapt the structure and content to fit the specific project needs."

    # Escape the entire message properly for JSON
    CONTEXT_JSON=$(echo "$CONTEXT_MESSAGE" | jq -Rs .)

    # Output in the required JSON format for UserPromptSubmit hook
    cat << EOF
{
  "hookSpecificOutput": {
    "hookEventName": "UserPromptSubmit",
    "additionalContext": ${CONTEXT_JSON}
  }
}
EOF
  else
    # Template file not found, output empty
    cat << 'EOF'
{
  "hookSpecificOutput": {
    "hookEventName": "UserPromptSubmit"
  }
}
EOF
  fi
else
  # Not a gh-pages command, output empty
  cat << 'EOF'
{
  "hookSpecificOutput": {
    "hookEventName": "UserPromptSubmit"
  }
}
EOF
fi

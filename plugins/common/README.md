# Common Plugin

Generic plugin useful for all types of projects. Automatically injects custom context and guidelines at the start of every Claude Code session.

## Features

**Hooks:**

- `SessionStart` - Injects project guidelines from `context/instructions.md`

**Commands:**

- `/common:readme [folder_path]` - Create/update professional README files
- `/common:hello` - Personalized greeting command

## How It Works

### SessionStart Hook

This plugin uses a SessionStart hook to automatically inject custom context into Claude's prompts at the beginning of each session. This works similarly to CLAUDE.md files but can be shared across multiple projects via the plugin system.

The hook executes `hooks/session-context.sh` which reads `context/instructions.md` and formats it as JSON. Claude receives the content as `additionalContext` in the session prompt, making the guidelines part of Claude's context for the entire session.

## Customization

Edit `context/instructions.md` to customize the guidelines injected at session start. The context will automatically be loaded the next time you start a Claude Code session.

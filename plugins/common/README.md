# Common Plugin

Generic plugin useful for all types of projects. Automatically injects custom context and guidelines at the start of every Claude Code session.

## Features

**Hooks:**

- `SessionStart` - Injects project guidelines with support for project-specific customization

**Commands:**

- `/common:readme [folder_path]` - Create/update professional README files
- `/common:gh-pages [theme]` - Generate professional GitHub Pages (index.html) in docs/ (theme: dark or light, default: dark)
- `/common:issue` - Create a PR to fix the current GitHub issue (designed for use with claude-code-action)
- `/common:hello` - Personalized greeting command

## How It Works

### SessionStart Hook

This plugin uses a SessionStart hook to automatically inject custom context into Claude's prompts at the beginning of each session. This works similarly to CLAUDE.md files but can be shared across multiple projects via the plugin system.

The hook executes `hooks/session-context.sh` which supports a flexible context loading system:

1. **Project-specific context** - Checks for `CONTEXT.md` in the current working directory
2. **Default context** - Falls back to plugin's `context/instructions.md` if no project context exists
3. **Additional context** - Appends `CONTEXT_ADD.md` from the current directory if it exists (works with both project and default context)

## Customization

### Plugin-level (affects all projects)

Edit `context/instructions.md` in the plugin directory to customize the default guidelines injected at session start.

### Project-level (affects only specific projects)

Create one or both of these files in your project's root directory:

- **`CONTEXT.md`** - Replaces the plugin's default context entirely for this project
- **`CONTEXT_ADD.md`** - Appends additional context on top of either the project-specific `CONTEXT.md` or the plugin's default `instructions.md`

**Priority order:**
1. If `CONTEXT.md` exists in project → use it as base context
2. Otherwise → use plugin's `context/instructions.md` as base context
3. If `CONTEXT_ADD.md` exists in project → append it to the base context

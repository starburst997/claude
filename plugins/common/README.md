# Common Plugin

Generic plugin useful for all types of projects. This plugin injects custom context and guidelines at the start of every Claude Code session.

## Features

### SessionStart Hook

This plugin uses a SessionStart hook to automatically inject custom context into Claude's prompts at the beginning of each session. This works similarly to CLAUDE.md files but can be shared across multiple projects via the plugin system.

### Components

- **Hooks**: SessionStart hook that injects context from `context/instructions.md`
- **Context**: Customizable project guidelines and instructions

## Usage

### Installation

```bash
/plugin install common@jd
```

### Customization

Edit the `context/instructions.md` file to customize the guidelines and context that will be injected at the start of each session:

```bash
# Edit the context file
vim plugins/common/context/instructions.md
```

The context will automatically be loaded the next time you start a Claude Code session.

## How It Works

1. When Claude Code starts a session, the `SessionStart` hook is triggered
2. The hook executes `hooks/session-context.sh`
3. The script reads `context/instructions.md` and formats it as JSON
4. Claude receives the content as `additionalContext` in the session prompt
5. The guidelines are now part of Claude's context for the entire session

## File Structure

```
common/
├── .claude-plugin/
│   └── plugin.json          # Plugin metadata
├── hooks/
│   ├── hooks.json           # Hook configuration
│   └── session-context.sh   # Hook script that injects context
├── context/
│   └── instructions.md      # Customizable project guidelines
└── README.md
```

## Benefits

- Share common guidelines across multiple projects
- No need to duplicate CLAUDE.md files
- Easy to version control and distribute
- Can be combined with other plugins for layered context
- Context is loaded automatically without manual intervention

## Extending

You can add more hooks by editing `hooks/hooks.json` or add more slash commands in the `commands/` directory.

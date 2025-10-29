# Claude Code Plugins

A curated collection of plugins for [Claude Code](https://claude.com/claude-code) tailored for my needs.

## Overview

This repository contains custom plugins designed to extend Claude Code functionality with project-specific context, commands, and automation. These plugins help inject guidelines, provide slash commands, and customize the Claude Code experience across different project types.

## Available Plugins

### Common Plugin (`common@jd`)

Generic plugin useful for all types of projects. Automatically injects custom context and guidelines at the start of every Claude Code session.

**Hooks:**

- `SessionStart` - Injects project guidelines from `context/instructions.md`

**Commands:**

- `/common:readme [folder_path]` - Create/update professional README files
- `/common:hello` - Personalized greeting command

**Context Files:**

- `context/instructions.md` - Customizable project guidelines and instructions

[View Common Plugin Documentation →](./plugins/common/README.md)

### Coming Soon

- `nextjs@jd` - Next.js specific optimizations and guidelines
- `typescript@jd` - TypeScript development enhancements

## Installation

### Step 1: Add the Marketplace

First, add this repository as a plugin marketplace in Claude Code:

```bash
/plugin marketplace add starburst997/claude
```

### Step 2: Install Plugins

Once the marketplace is added, install plugins from it:

```bash
/plugin install common@jd
```

### Alternative: Team Configuration

For team-wide plugin installation, add to your project's `.claude/settings.json`:

```json
{
  "extraKnownMarketplaces": {
    "jd": {
      "source": {
        "source": "github",
        "repo": "starburst997/claude"
      }
    }
  },
  "enabledPlugins": {
    "common@jd": true
  }
}
```

When teammates trust the folder, they'll be prompted to install the marketplace and plugins automatically.

### Local Development

For local plugin development or testing:

```bash
/plugin marketplace add /path/to/repo
/plugin install common@jd
```

## Plugin Structure

Each plugin follows this structure:

```
plugin-name/
├── .claude-plugin/
│   └── plugin.json         # Plugin metadata
├── commands/               # Slash commands
│   └── *.md                # Command definitions
├── hooks/                  # Hook scripts
│   ├── hooks.json          # Hook configuration
│   └── *.sh                # Hook executables
└── README.md               # Plugin documentation
```

## Usage

After installing a plugin, its features become available in Claude Code:

- **Hooks** run automatically (e.g., SessionStart)
- **Commands** can be invoked with `/` prefix (e.g., `/common:readme`)

## Marketplace

This repository is configured as a Claude Code plugin marketplace:

- **Marketplace ID**: `jd`
- **Author**: JD Boivin
- **Homepage**: https://claude.jd.boiv.in
- **GitHub**: https://github.com/starburst997

## Benefits

- Share common guidelines across multiple projects
- No need to duplicate context files
- Easy to version control and distribute
- Combine multiple plugins for layered functionality
- Automatic context loading without manual intervention

## Development

### Creating a New Plugin

1. Create a new directory in `plugins/`
2. Add `.claude-plugin/plugin.json` with metadata
3. Add hooks, commands, or context as needed
4. Document in plugin's README.md
5. Register in `.claude-plugin/marketplace.json`

## License

MIT License - see [LICENSE](./LICENSE) file for details.

Copyright (c) 2025 JD Boivin

## Resources

- [Claude Code Documentation](https://docs.claude.com/en/docs/claude-code)
- [Plugin Development Guide](https://docs.claude.com/en/docs/claude-code/plugins)
- [Project Homepage](https://claude.jd.boiv.in)

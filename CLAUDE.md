# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Claude Code plugin marketplace repository containing custom plugins that extend Claude Code functionality. The marketplace ID is `jd` and plugins are installed via `/plugin install <plugin-name>@jd`.

## Repository Structure

```
.
├── .claude-plugin/
│   └── marketplace.json      # Marketplace configuration and plugin registry
├── plugins/                  # Plugin directory (defined in marketplace.json)
└── docs/                     # GitHub Pages documentation
```

## Plugin Architecture

Each plugin can include any combination of these features:

```
plugin-name/
├── .claude-plugin/
│   └── plugin.json          # Plugin metadata (name, description, version, author)
├── commands/                # Optional: Slash commands (user-invoked via /command)
│   └── *.md                 # Command definition files with frontmatter
├── agents/                  # Optional: Specialized subagents
│   └── *.md                 # Agent definitions (auto or explicit invocation)
├── skills/                  # Optional: Model-invoked capabilities
│   └── skill-name/
│       └── SKILL.md         # Skill definition with YAML frontmatter
├── hooks/                   # Optional: Event handlers
│   ├── hooks.json           # Hook configuration (SessionStart, SessionEnd, etc.)
│   └── *.sh                 # Executable hook scripts
├── .mcp.json                # Optional: MCP server configurations
└── README.md                # Plugin documentation
```

### Feature Types

**Commands**: User-invoked slash commands (e.g., `/plugin:command`)
**Agents**: Specialized subagents with dedicated context and tool access
**Skills**: Model-invoked functions - Claude autonomously uses based on task context
**Hooks**: Event-driven automation (PreToolUse, PostToolUse, SessionStart, etc.)
**MCP Servers**: External tool integration via Model Context Protocol

### Key Files

**`.claude-plugin/marketplace.json`** (root)

- Defines marketplace metadata (name, owner, homepage)
- Registers all available plugins in the `plugins` array
- Sets `pluginRoot` to `./plugins`

**`plugins/<name>/.claude-plugin/plugin.json`**

- Required fields: `name` (unique identifier)
- Optional: `description`, `version`, `author`, `commands`, `agents`, `hooks`, `mcpServers`
- All paths relative to plugin root, starting with `./`
- Can inline MCP server configs or reference `.mcp.json`

**`plugins/<name>/commands/*.md`**

- YAML frontmatter with `description` field
- User-invoked via `/plugin-name:command-name` syntax

**`plugins/<name>/agents/*.md`**

- YAML frontmatter: `name`, `description`, `tools` (optional), `model` (optional)
- System prompt in markdown body
- Invoked automatically by Claude or explicitly by user

**`plugins/<name>/skills/*/SKILL.md`**

- YAML frontmatter: `name`, `description`, `allowed-tools` (optional)
- Model-invoked based on description matching task context
- Auto-discovered when plugin installs

**`plugins/<name>/hooks/hooks.json`**

- Maps hook events to executable scripts
- Available events: SessionStart, SessionEnd, PreToolUse, PostToolUse, UserPromptSubmit, Notification, Stop, PreCompact
- Use `${CLAUDE_PLUGIN_ROOT}` for plugin-relative paths

**`plugins/<name>/.mcp.json`**

- MCP server configurations (command, args, env)
- Supports variable expansion: `${VAR}`, `${VAR:-default}`
- Servers start automatically when plugin enabled

## Plugin Development Workflow

### Creating a New Plugin

1. Create plugin directory: `mkdir -p plugins/<name>/.claude-plugin`
2. Create `plugins/<name>/.claude-plugin/plugin.json` with required metadata
3. Add features as needed: commands, agents, skills, hooks, or MCP servers
4. Create `plugins/<name>/README.md` with plugin documentation
5. Register plugin in `.claude-plugin/marketplace.json` plugins array

### Adding Plugin Features

**Commands**: Create `.md` files in `commands/` with YAML frontmatter
**Agents**: Create `.md` files in `agents/` with YAML frontmatter + system prompt
**Skills**: Create `skills/skill-name/SKILL.md` with YAML frontmatter + instructions
**Hooks**: Add `hooks/hooks.json` and corresponding shell scripts
**MCP**: Add `.mcp.json` at plugin root with server configurations

## Documentation

GitHub Pages hosted in `docs/` directory at https://claude.jd.boiv.in

When updating documentation:

- Edit `docs/index.html` for homepage changes
- Ensure documentation matches plugin functionality
- Keep README.md in sync with docs
- Focus on listing the features with their arguments (if any) with a brief description

ALWAYS update the README.md and docs/index.html when adding / removing / updating new plugins or plugin's features
ALSO update the relevant README.md from the plugin's folder.

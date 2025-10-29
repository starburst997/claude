---
description: Create a professional GitHub Pages (index.html) in docs/ to showcase the project
arguments:
  - name: theme
    description: Theme to use for the page (dark or light)
    required: false
    default: dark
---

# GitHub Pages Generator Command

Generate a professional, marketing-focused GitHub Pages documentation site for the current project.

## Objective

Create a professional `index.html` file in the `docs/` directory that serves dual purposes:
1. **Marketing page**: Attractive showcase of the project with clear value proposition
2. **Documentation cheatsheet**: Quick reference for features, inputs/outputs, and usage examples

## Theme Inspiration

You have access to two theme examples in the plugin context directory for **inspiration**:

- **dark.html**: Modern dark theme with gradient accents (default)
- **light.html**: Clean light theme with purple gradient

**Important**: These are inspiration sources, not strict templates. Use them to guide the visual style, color palette, and overall aesthetic, but adapt the structure and content to fit the specific project. The goal is to create something that feels similar in style while being tailored to the project's needs.

The `theme` argument determines which example to use as inspiration (defaults to "dark").

## Requirements

### Structure & Content

**Note**: Adapt sections based on what's relevant to the project. Not all projects need every section.

1. **Hero Section** (Required)
   - Project name as main heading with **gradient text** (MUST use CSS gradient)
   - Clear, concise tagline explaining what the project does
   - Call-to-action buttons (GitHub repo, documentation, etc.)

2. **Features Section** (Required)
   - Grid layout showcasing key features
   - Icons or visual elements for each feature
   - Brief descriptions (1-2 sentences max)

3. **Usage/Quick Start Section** (Optional - include if project has code examples)
   - Practical code examples showing real-world usage
   - Multiple workflow examples if applicable (dev, staging, production)
   - ALL code examples MUST use syntax highlighting with colored text

4. **Reference Section** (Optional - include if project has inputs/outputs/parameters)
   - Complete inputs/outputs documentation
   - Organized in clear categories
   - Parameter names, descriptions, and defaults
   - Mark required vs optional parameters clearly

5. **Footer** (Required)
   - Links to GitHub repo, issues, releases, documentation
   - Author/creator credit

### Code Highlighting

**CRITICAL**: All code blocks, inline code, and usage examples MUST use colored syntax highlighting:

- Use semantic CSS classes for syntax elements (keywords, strings, variables, comments)
- Define color schemes in `<style>` that match the chosen theme
- Examples should be visually distinct and easy to scan
- Use monospace fonts for all code

### Design Principles

- **Self-contained**: Single HTML file with embedded CSS (no external dependencies)
- **Responsive**: Mobile-friendly with appropriate media queries
- **Professional**: Clean, modern design that builds trust
- **Scannable**: Clear hierarchy, whitespace, and visual structure
- **Accessible**: Proper semantic HTML, good contrast ratios

### Theme Consistency

- Use the selected theme as visual inspiration, not a strict copy
- Match the general color palette and aesthetic feel
- Maintain consistent spacing, typography, and component styling
- Adapt gradients, borders, shadows to fit the theme aesthetic
- **CRITICAL**: The project name/logo (h1) MUST always use a gradient effect with `background: linear-gradient(...)` and `background-clip: text`

## Process

1. **Analyze the project**:
   - Read README.md, action.yml, or relevant configuration files
   - Identify key features, inputs, outputs, and usage patterns
   - Understand the target audience and use cases

2. **Select and study the theme**:
   - Load the appropriate inspiration file (dark.html or light.html) from context
   - Extract color schemes, typography, component patterns as guidance
   - Note the syntax highlighting approach
   - Use as inspiration, not as a strict template to copy

3. **Generate content**:
   - Write clear, benefit-focused copy for features
   - Create practical, realistic code examples (if relevant)
   - Document all parameters comprehensively (if the project has inputs/outputs)
   - Apply colored syntax highlighting to ALL code
   - Include only sections that make sense for this specific project

4. **Create the file**:
   - Generate `docs/index.html` in the project root
   - Ensure all sections are complete and polished
   - Validate HTML structure and CSS styling

## Output Location

Always create the file at: `docs/index.html` (relative to project root)

If the `docs/` directory doesn't exist, create it first.

## Example Invocation

```
/common:gh-pages theme=dark
/common:gh-pages theme=light
/common:gh-pages
```

## Important Notes

- Focus on clarity and scannability over verbosity
- Every code snippet should have colored syntax highlighting
- Balance marketing appeal with technical accuracy
- Make it easy for users to find the information they need quickly
- The page should work standalone (no external JS/CSS dependencies)
- **The project name/title MUST use a gradient effect** - this is non-negotiable
- Adapt the structure to fit the project - not every project needs usage examples or reference docs
- Use theme files as inspiration for style, not as rigid templates to copy exactly

## Encoding Guidelines

**CRITICAL**: To prevent encoding issues in generated HTML files:

1. **Use HTML entities for special characters**:
   - For emojis in HTML: Use decimal HTML entities (e.g., `&#127919;` for 🎯, `&#9889;` for ⚡, `&#128260;` for 🔔)
   - For bullet separators: Use `&bull;` instead of the • character
   - For arrows: Use `&rarr;` for → and `&larr;` for ←
   - For other special symbols: Use HTML entity equivalents

2. **Always include proper charset**:
   - Ensure `<meta charset="UTF-8" />` is in the `<head>` section

3. **Common HTML entities to use**:
   - `&bull;` for bullet points (•)
   - `&rarr;` for right arrow (→)
   - `&larr;` for left arrow (←)
   - `&mdash;` for em dash (—)
   - `&ndash;` for en dash (–)
   - `&hellip;` for ellipsis (…)
   - `&copy;` for copyright (©)
   - `&trade;` for trademark (™)

4. **For emojis**: Convert to decimal HTML entities using the Unicode code point
   - Find emoji code point (e.g., U+1F3AF for 🎯)
   - Convert to decimal: `&#127919;`
   - Or use hex format: `&#x1F3AF;`

This ensures the HTML file displays correctly across all systems and browsers without encoding corruption.

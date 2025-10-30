---
description: Create a PR to fix the current GitHub issue
---

# GitHub Issue to PR Command

Transform the current GitHub issue into a pull request. This command is designed to work with the `claude-code-action` GitHub Action where issue context is automatically provided.

## Objective

1. Treat the issue description and comments as the implementation request
2. Implement all necessary changes to address the issue
3. Create a pull request using the `gh` CLI with proper formatting

## Comment Priority

When reviewing the issue context, prioritize information in this order:

1. **First comment (issue description)** - This is the PRIMARY requirement and most important source of truth
2. **Comments from the repository owner** - Highest priority as they have final authority on requirements and direction
3. **Follow-up comments from the issue author** - High priority, often contains clarifications or additional requirements
4. **Comments from other users** - Lower priority but still useful for additional context and edge cases

## Process

1. **Understand the requirements**:

   - Focus primarily on the first comment (issue description) as the main request
   - Give highest priority to comments from the repository owner
   - Review follow-up comments from the issue author for clarifications
   - Consider comments from other users as supplementary context
   - Identify what needs to be fixed or implemented
   - Plan the necessary changes

2. **Implement the solution**:

   - Make all necessary code changes to address the issue
   - Follow existing code patterns and conventions
   - Ensure changes fully address the requirements

3. **Create the pull request**:
   - Create a new branch for the changes (if needed)
   - Commit all changes with a descriptive commit message
   - Push the branch to remote
   - Create PR using `gh pr create` with the following body format:

```markdown
## Summary

[Brief 1-2 sentence summary of what was changed and why]

## Changes

- [Specific change 1]
- [Specific change 2]
- [Specific change 3]

Fixes #<issue_number>
```

**IMPORTANT**: Do NOT add any footer text like "Generated with Claude Code" or "Co-Authored-By: Claude" to the PR body or commit messages. Keep the PR body clean and professional with only the content shown above.

4. **Output**:
   - Display the URL of the newly created pull request

## Example Invocation

```
/common:issue
```

## Important Notes

- **CRITICAL**: You MUST create the pull request using `gh pr create` command - this is a mandatory step that cannot be skipped or deferred
- The PR body **must** include `Fixes #<issue_number>` to auto-link and auto-close the issue
- Changes should fully address all requirements mentioned in the issue
- The PR summary should be concise but informative (1-2 sentences)
- All changes must be committed and pushed before creating the PR
- Follow the repository's existing commit and PR conventions
- Use `gh pr create` to create the pull request (not manual git operations)

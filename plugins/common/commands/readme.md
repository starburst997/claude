---
description: Create / Update a professional README
arguments:
  - name: folder_path
    description: The folder path where the README.md should be created/updated
    required: false
    default: repository root
---

# README Command

Create or update a professional README.md file.

## Usage

```
/common:readme
/common:readme folder_path=./path/to/folder
/common:readme folder_path=plugins/common
```

## Instructions

1. If the `folder_path` argument is provided, use that as the target directory. Otherwise, use the repository root.
2. Analyze the contents of the specified folder to understand the project structure and purpose.
3. Create or update the README.md file in that folder with:
   - Clear project title and description
   - Installation instructions (if applicable)
   - Usage examples
   - Key features
   - Project structure overview
   - Any other relevant sections based on the folder contents
4. Ensure the README is well-formatted using proper markdown syntax.
5. Keep it brief and to the point
6. DO NOT use emoji unless it is relevant (like ✅, ❌, 🟢, 🔴, etc.)
7. NO code of conduct and NO contributing

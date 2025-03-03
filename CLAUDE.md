# CLAUDE.md - Agent Assistant Guide

## Document Structure

- file name format
  - Daily notes format: `YYYY-MM-DD.md` in Daily/ directory
  - Other filenames should use snake_case with alphabetic characters
  - Directory names should use PascalCase
- Files created via the FSNotes app use the filename format `YYYYMMDDHHmmSS`
- Store images in `i/` subdirectories
- Use Markdown with appropriate headers and task lists `- [ ]`

## Git Workflow

Write commit messages that clearly indicate "which state/point in time" the repository was in, to make it easier to understand when reviewing later

- Command to view daily changes: `git diff --stat`
- Commit daily changes at end of day: `git commit -am "本日終了"`
- Morning commit convention: `git commit -am "朝"`
- Pre-work commit convention: `git commit -am "仕事前"`

## Note Formatting Guidelines

- Use level 1 header `#` for note title (typically date for daily notes)
- Use level 2 headers `##` for major sections
- Use level 3 headers `###` for subsections
- Use task lists with `- [ ]` for tasks, `- [x]` for completed tasks
- Use emoji prefixes for categories (🔵 Yourstand, 🔴 dotfiles, ⭐️ Private)
- Links: Use standard Markdown links `[text](url)` for external links
- References: Use footnotes with `[^1]` syntax

## File Modification Guidelines

- For personal matters without specific mention, please refer to that day's notes.
- For nesting in bullet points, use tabs instead of spaces.
- When extracting part of a file's content into a separate file, unless otherwise instructed:
  - Add a link to the new file in place of the extracted content in the original file. Use markdown link format without heading (example: [[New File Name]])
  - The original file should remain, with only the extracted portion replaced by the link
  - Add cross-references in both the original file and the new file
  - In the new file, add a reference link at the end, without heading (example: ## References \n\n [[Original File Name]])

## Tools

- Primary editor: FSNotes (Mac, iPad, iPhone)
- Secondary tools: Raycast, Zed
- No specific IDE is required

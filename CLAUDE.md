# CLAUDE.md - Agent Assistant Guide

## Document Structure

- file name format
  - Daily notes format: `YYYY-MM-DD.md` in Daily/ directory
  - Other filenames should use snake_case with alphabetic characters
  - Directory names should use PascalCase
- Files created via the FSNotes app use the filename format `YYYYMMDDHHmmSS`
- Store images in `i/` subdirectories
- Use Markdown with appropriate headers and task lists `- [ ]`
- For nesting in bullet points, use tabs instead of spaces.

## Git Workflow

Write commit messages that clearly indicate "which state/point in time" the repository was in, to make it easier to understand when reviewing later

- Command to view daily changes: `git diff --stat`
- Commit daily changes at end of day: `git commit -am "本日終了"`
- Morning commit convention: `git commit -am "朝"`
- Pre-work commit convention: `git commit -am "仕事前"`

## Formatting Guidelines

### Basic Formatting Guidelines

- Use level 1 header `#` for note title (typically date for daily notes)
- Use level 2 headers `##` for major sections
- Use level 3 headers `###` for subsections
- Use task lists with `- [ ]` for tasks, `- [x]` for completed tasks
- Use emoji prefixes for categories (🔵 Yourstand, 🔴 dotfiles, ⭐️ Private)
- External links: Use standard Markdown links `[text](url)`
- Internal links: Markdown links `[[File Title]]` without heading
- References: Use footnotes with `[^1]` syntax

- Below the title, add `## Links` heading and add links to corresponding files with bullet points like `- [[link]]` as needed.
  - In some cases, this section may be placed at the end of the file

### Directory Structure & Specific Formatting Rules

Define the directory structure, purpose and keywords of Japanese

- `Yourstand` Directory related to work at Yourstand. Keywords: `ユアスタンド`, `YS`
  - `1on1`/`{Name}` Records of 1on1 meetings. Directory created for each member. `oki` is for meetings between yourself and your supervisor, while others are for meetings with other members
    - File naming format: `YYYY-MM-DD_1on1_{Name}.md`
    - Title format: `YYYY-MM-DD 1on1 Name`
    - Below the `## Links`, add `## Summary of Previous Meeting [[link]]` with a simple summary of the previous meeting in about 3 points
  - `Backlog` Backlog の各課題に関するノート Keywords: `Backlog`, `課題`, `課題管理`, `タスク`
    - File naming format: `{Task Key}.md`
    - Title format: `{Task Name}` mostly in Japanese
    - Below the `## Links`, add the source file reference (typically a daily note) like `[[YYYY-MM-DD]]`
    - Then add `## Backlog Link` heading followed by a blank line and the URL of the backlog task page like `https://yourstand.backlog.com/view/PDM_S-1234`
    - Always add a `## メモ` heading before the task notes content
    - When a Backlog task is mentioned in a daily note, add a link to the Backlog file at the end of the task (example: `- [ ] Task description [[PDM_S-1234]]`)

## File Modification Guidelines

### Extracting Content into Separate File

- For personal matters without specific mention, please refer to that day's notes.
- When extracting part of a file's content into a separate file, unless otherwise instructed:
  - Add a link to the new file in place of the extracted content in the original file. Use markdown link format without heading (example: [[New File Name]])
  - The original file should remain, with only the extracted portion replaced by the link
  - Add cross-references in both the original file and the new file
  - In the new file, add a reference link in the Links section (example: `[[Original File Name]]`)
  - For Backlog tasks, follow the specific format described in the Backlog section above

### Backlog Task Management Process

- When identifying Backlog tasks in daily notes:
  1. Extract the task key (PDM_S-XXXX) from the URL or task description
  2. Check if a file for that task already exists in the Yourstand/Backlog directory
  3. If not, create a new file named after the task key (e.g., PDM_S-1234.md) following the Backlog file format
  4. Add links to relevant daily notes in the Backlog file under the Links section
  5. Add a link to the Backlog file at the end of the task item in the daily note
  6. Ensure all information from the daily note about the task is reflected in the Backlog file

## Tools

- Primary editor: FSNotes (Mac, iPad, iPhone)
- Secondary tools: Raycast, Zed
- No specific IDE is required

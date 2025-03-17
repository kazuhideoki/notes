# CLAUDE.md for Daily/ Directory

## Daily Note Structure and Format

- File name format: `YYYY-MM-DD.md`
- Always use Level 1 header `#` for note title (typically date)
- Use Level 2 headers `##` for major sections
- Use Level 3 headers `###` for subsections
- Use task lists with `- [ ]` for tasks, `- [x]` for completed tasks
- Use emoji prefixes for categories (🔵 Yourstand, 🔴 dotfiles, ⭐️ Private)

## Internal Links Format

- For daily notes, do NOT add a separate `## Links` section
- Instead, add internal links directly in the relevant task items
- Always use file title format for internal links (not file paths)
  - Correct: `[[File Title]]`
  - Incorrect: `[[directory/file_name]]`

## Backlog Task Management

- When mentioning Backlog tasks in daily notes:
  - Add a link to the Backlog file at the end of the task item (example: `- [ ] Task description [[PDM_S-1234]]`)
  - If there's a task key (PDM_S-XXXX), check if a corresponding Backlog file exists in the Yourstand/Backlog directory
  - If it doesn't exist, create a new file based on the task key

## 1on1 Meeting Notes

- When mentioning 1on1 meetings in daily notes:
  - Add a link to the 1on1 file to the relevant task in the daily note
  - Add a link to today's daily note in the 1on1 file's `## Links` section

## Git Workflow

- Command to view daily changes: `git diff --stat`
- Commit daily changes at end of day: `git commit -am "本日終了"`
- Morning commit convention: `git commit -am "朝"`
- Pre-work commit convention: `git commit -am "仕事前"`
- Write commit messages that clearly indicate "which state/point in time" the repository was in
- When committing, annotations like `Generated with Claude Code` in the message are unnecessary - never include these
- Do not automatically commit or stage changes after work unless specifically instructed
- NEVER automatically commit changes - always wait for an explicit instruction to commit
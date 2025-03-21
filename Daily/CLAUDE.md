# CLAUDE.md for Daily/ Directory

Directory for daily notes and activity records.

## Directory Structure

- Flat structure of daily note files
- Related files stored in `files/` subdirectory if needed
- Images stored in `i/` subdirectory

## File Naming Conventions

- File name format: `YYYY-MM-DD.md`
- Always use Level 1 header `#` for note title (typically date)
- Use Level 2 headers `##` for major sections
- Use Level 3 headers `###` for subsections

## Content Guidelines

- Use task lists with `- [ ]` for tasks, `- [x]` for completed tasks
- For daily notes, do NOT add a separate `## Links` section
- Instead, add internal links directly in the relevant task items
- Backlog task management:
  - Add a link to the Backlog file at the end of the task item (example: `- [ ] Task description [[PDM_S-1234]]`)
  - If there's a task key (PDM_S-XXXX), check if a corresponding Backlog file exists in the Yourstand/Backlog directory
  - If it doesn't exist, create a new file based on the task key

## Editing Process

- ALWAYS check the most recent daily note (today's date) using View tool before working
- Check yesterday's note and today's note to understand context and pending tasks
- When creating a new file referenced in a daily note, ensure links are added to ALL daily notes that reference it
- When creating files based on tasks, check ALL daily notes that might reference the task

## File Templates

```markdown
# YYYY-MM-DD

[[Yesterday]] [[Tomorrow]] // YYYY-MM-DD for each day

## 本日のタスク

- [ ] Task 1
- [ ] Task 2 [[Related File]]

## 明日のタスク

- [ ] Work task 1
- [ ] Work task 2 [[PDM_S-XXXX]]
- [ ] Meeting with team [[YYYY-MM-DD_1on1_Name]]

## 積み上げタスク

- [ ] Task 1
- [ ] Task 2 [[Related File]]
```

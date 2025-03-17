# CLAUDE.md for Yourstand/ Directory

Directory for work-related notes at Yourstand. Keywords: `ユアスタンド`, `YS`

## Subdirectories and File Formats

### 1on1 Directory

- Records of one-on-one meetings
- Directory created for each member (`oki`, `morishita`, `seki`, `yoshino`, etc.)
- `oki` is for meetings between yourself and your supervisor, while others are for meetings with team members

#### File Format

- File naming format: `YYYY-MM-DD_1on1_{Name}.md`
- Title format: `YYYY-MM-DD 1on1 Name`
- Follow standard linking conventions for 1on1 files and daily notes
- Below the `## Links`, add `## Summary of Previous Meeting [[link]]` with a simple summary of the previous meeting in about 3-4 bullet points

### Backlog Directory

Notes related to Backlog tasks. Keywords: `Backlog`, `課題`, `課題管理`, `タスク`

#### File Format

- File naming format: `{Task Key}.md` (e.g., `PDM_S-1234.md`)
- Title format: `{Task Name}` mostly in Japanese
- Follow standard linking conventions as defined in the master CLAUDE.md
- Add `## Backlog Link` heading followed by a blank line and the URL of the backlog task page like `https://yourstand.backlog.com/view/PDM_S-1234`
- Always add a `## メモ` heading before the task notes content
- When a Backlog task is mentioned in a daily note, add a link to the Backlog file at the end of the task (example: `- [ ] Task description [[PDM_S-1234]]`)

### Recruitment Directory

Notes related to recruitment activities

#### File Format

- File names should use snake_case in English (`new_grad_test_plan.md`, etc.)
- Title should be the file name converted to a readable format
- Follow standard linking conventions as defined in the master CLAUDE.md

## Backlog Task Management Process

1. Extract the task key (PDM_S-XXXX) from the URL or task description in daily notes
2. Check if a file for that task already exists in the Yourstand/Backlog directory
3. If not, create a new file named after the task key (e.g., PDM_S-1234.md)
4. Add links to relevant daily notes in the Backlog file under the Links section
5. Add a link to the Backlog file at the end of the task item in the daily note
6. Ensure all information from the daily note about the task is reflected in the Backlog file

## 1on1 Meeting Notes Process

When creating a new 1on1 meeting note:

1. Use `GlobTool` to check if a file for today's meeting already exists
2. Create the file with the format: `YYYY-MM-DD_1on1_{Name}.md` in the appropriate directory
3. Set up the basic structure:

```
# YYYY-MM-DD 1on1 Name

## Links

- [[YYYY-MM-DD]] (link to today's daily note)

## Summary of Previous Meeting [[previous_meeting_file_name]]

- (concise bullet points summarizing key points from previous meeting)
```

4. Find and read the previous meeting file to create a meaningful summary (usually 3-4 bullet points)
5. Update today's daily note to include a link to the 1on1 meeting file
6. Add today's date to any Backlog tasks mentioned in the daily note
# CLAUDE.md for Yourstand/ Directory

Directory for work-related notes at Yourstand. Keywords: `ユアスタンド`, `YS`

## Directory Structure

- Primary directory with subdirectories for specific types of content
- `1on1/` - Directory for one-on-one meeting notes, with subdirectories for each team member
- `Backlog/` - Directory for Backlog task notes
- `Recruitment/` - Directory for recruitment-related notes

## File Naming Conventions

- All files should follow standard naming conventions as defined in the master CLAUDE.md
- Specifically, filenames should use snake_case with alphabetic characters in English only
- Title should match the file name in a readable format
- Follow standard linking conventions as defined in the master CLAUDE.md
- Use the Meta section format as specified in the master CLAUDE.md

## Subdirectory Guidelines

### 1on1 Directory

- Records of one-on-one meetings
- Directory created for each member (`oki`, `morishita`, `seki`, `yoshino`, etc.)
- `oki` is for meetings between yourself and your supervisor, while others are for meetings with team members

#### Content Guidelines

- File naming format: `YYYY-MM-DD_1on1_{Name}.md`
- Title format: `YYYY-MM-DD 1on1 Name`
- Follow standard linking conventions for 1on1 files and daily notes
- Below the `## Meta` section, add `## Summary of Previous Meeting` with a simple summary of the previous meeting in about 3-4 bullet points

#### Editing process

When creating a new 1on1 meeting note:

1. Use `GlobTool` to check if a file for today's meeting already exists
2. Create the file with the format: `YYYY-MM-DD_1on1_{Name}.md` in the appropriate directory
3. Set up the basic structure following the template
4. Find and read the previous meeting file to create a meaningful summary (usually 3-4 bullet points)
5. Update today's daily note to include a link to the 1on1 meeting file
6. Add today's date to any Backlog tasks mentioned in the daily note
7. In the previous meeting file, add a link to the new meeting file under the ## Meta section to create bidirectional linking

#### File Templates

**1on1 Meeting Template:**

```markdown
# YYYY-MM-DD 1on1 Name

## Meta

[[YYYY-MM-DD_1on1_Name]] [[YYYY-MM-DD]]
# meeting #1on1

## Summary of Previous Meeting

- (concise bullet points summarizing key points from previous meeting)
```

**Backlog Task Template:**

```markdown
# Task Title

## Meta

[[YYYY-MM-DD]]
#backlog

## Backlog Link

https://yourstand.backlog.com/view/PDM_S-XXXX

## 課題内容

(Paste the actual Backlog task content here. This content should be retrieved (and summarized if needed) from Backlog. Surround the content with code blocks above and below)

## メモ
```

### Backlog Directory

Notes related to Backlog tasks. Keywords: `Backlog`, `課題`, `課題管理`, `タスク`

#### Content Guidelines

- File naming format: `{Task Key}.md` (e.g., `PDM_S-1234.md`)
- Title format: `{Task Name}` mostly in Japanese, matching the Backlog issue summary
- Follow the Meta section format as specified in the master CLAUDE.md
- Include #backlog tag in the Meta section for all Backlog task files
- Add `## Backlog Link` heading followed by a blank line and the URL of the backlog task page like `https://yourstand.backlog.com/view/PDM_S-1234`
- Always add a `## メモ` heading before the task notes content
- When a Backlog task is mentioned in a daily note, add a link to the Backlog file at the end of the task (example: `- [ ] Task description [[PDM_S-1234]]`)
- ⚠️ **CRITICAL REQUIREMENT** When creating an initial file, request information about that task from the Backlog MCP Server and reflect this information in the file

#### Editing process

1. ALWAYS check the most recent daily note (today's date) using View tool before starting work
2. If a Backlog link (`https://yourstand.backlog.com/view/PDM_S-XXXX`) is included in a task, recognize it as a Backlog task
3. Create a corresponding Backlog task note under Yourstand/Backlog/ with the format `PDM_S-XXXX.md`
4. Add links in the format `[[PDM_S-XXXX]]` to task items in all related daily notes (including the current day)
5. Also add links to all related daily notes in the Backlog task note's Meta section
6. When necessary, create concept notes and link them bidirectionally

### Recruitment Directory

Notes related to recruitment activities

#### Content Guidelines

- File names should use snake_case in English (`new_grad_test_plan.md`, etc.)
- Title should be the file name converted to a readable format
- Follow standard linking conventions as defined in the master CLAUDE.md

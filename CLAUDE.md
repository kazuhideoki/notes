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
- When committing, annotations like `Generated with Claude Code` in the message are unnecessary - never include these
- Do not automatically commit or stage changes after work unless specifically instructed
- NEVER automatically commit changes - always wait for an explicit instruction to commit
- File creation or modification isn't enough reason to commit - only commit when directly asked

## Formatting Guidelines

### Daily Note Identification

- When starting work, first identify today's daily note:
  - Check the most recently created note in the Daily/ directory
  - The current day's note will typically be named in the format `YYYY-MM-DD.md`
  - Always make sure you're working with and referencing the correct day's note
  - When creating or modifying content, always check how it relates to today's daily note first

### Basic Formatting Guidelines

- Use level 1 header `#` for note title (typically date for daily notes)
- Use level 2 headers `##` for major sections
- Use level 3 headers `###` for subsections
- Use task lists with `- [ ]` for tasks, `- [x]` for completed tasks
- Use emoji prefixes for categories (🔵 Yourstand, 🔴 dotfiles, ⭐️ Private)
- External links: Use standard Markdown links `[text](url)`
- Internal links: Markdown links `[[File Title]]` without heading
- References: Use footnotes with `[^1]` syntax

- Internal links structure depends on the file type:
  - For non-daily notes: Add a `## Links` section directly below the title with bullet points to related files
  - For daily notes: Do NOT add a separate `## Links` section. Instead, add internal links directly in the relevant task items

### Directory Structure & Specific Formatting Rules

Define the directory structure, purpose and keywords of Japanese

- `AI` Directory for AI-related tools, notes, and resources

  - File names should reflect content (e.g., `ai_tool.md`, `mcp_server_guide.md`)
  - Title format should match file name in a readable format (e.g., "AIツールまとめ", "MCP サーバーまとめ")
  - Include a `## Links` section with references to related documents
  - Use proper formatting with headers, code blocks, and task lists

- `Learning` Directory for learning materials, technical notes, and references

  - Files should be organized by topic
  - Use descriptive file names and titles
  - Include code examples, commands, and explanations as needed

- `Yourstand` Directory related to work at Yourstand. Keywords: `ユアスタンド`, `YS`
  - `1on1`/`{Name}` Records of 1on1 meetings. Directory created for each member. `oki` is for meetings between yourself and your supervisor, while others are for meetings with other members
    - File naming format: `YYYY-MM-DD_1on1_{Name}.md`
    - Title format: `YYYY-MM-DD 1on1 Name`
    - Always create mutual links between daily notes and 1on1 files:
      - Add the daily note link in the 1on1 file's `## Links` section
      - Add the 1on1 file link to the relevant task in the daily note
    - Below the `## Links`, add `## Summary of Previous Meeting [[link]]` with a simple summary of the previous meeting in about 3-4 bullet points
  - `Backlog` Backlog の各課題に関するノート Keywords: `Backlog`, `課題`, `課題管理`, `タスク`
    - File naming format: `{Task Key}.md`
    - Title format: `{Task Name}` mostly in Japanese
    - Include a `## Links` section with references to related daily notes (e.g., `- [[YYYY-MM-DD]]`)
    - Add `## Backlog Link` heading followed by a blank line and the URL of the backlog task page like `https://yourstand.backlog.com/view/PDM_S-1234`
    - Always add a `## メモ` heading before the task notes content
    - When a Backlog task is mentioned in a daily note, add a link to the Backlog file at the end of the task (example: `- [ ] Task description [[PDM_S-1234]]`)

## File Modification Guidelines

### Internal Links Format

- For internal links, always use the file title format (not file path)
  - Correct: `[[File Title]]`
  - Incorrect: `[[directory/file_name]]`
- This ensures consistent linking across all notes regardless of file location
- When files are moved to different directories, update all references to use the title format

### Extracting Content into Separate File

- For personal matters without specific mention, please refer to that day's notes.
- When creating a new file template or extracting content to a separate file, follow these steps:
  1. Create the new file with appropriate name in the correct directory
  2. Add minimal structure including:
     - Title (level 1 header matching the filename)
     - A `## Links` section with references to related files
     - A minimal content section (e.g., `## 内容` or `## 概要`) with a brief one-line description
  3. Do NOT populate the file with detailed content unless explicitly requested
  4. Do NOT add sections, headings, or content structure beyond the basics unless specifically instructed
  5. In the original file, replace extracted content or add a link to the new file using title format `[[New File Title]]`
  6. For Backlog tasks, follow the specific format described in the Backlog section above
  7. NEVER create fictional content - only extract actual content from existing sources
  8. **Always create mutual links between daily notes and new files:**
     - Add the daily note link in the new file's `## Links` section
     - Add the new file link to the relevant task or section in the daily note
  9. When asked to extract content to a Backlog task file or create a new task file:
     - Always check current day's note (`Daily/YYYY-MM-DD.md`) first for the most relevant content
     - If content or task isn't in current day's note, search for it in previous notes before creating content
     - Add links to all relevant daily notes in the Backlog file's Links section, including the current day
     - Add link to the Backlog file from all related tasks in daily notes

### Content Organization by Topic

- Related content about a specific topic should be organized in its own directory:
  - For work-related topics, create directories under the `Yourstand` directory
  - For personal projects, create dedicated directories at the root level (using PascalCase)
  - For learning materials and reference notes, use the `Learning` directory
  - For AI tools and related notes, use the `AI` directory
- When moving content to a dedicated directory:
  1. Create the directory if it doesn't exist
  2. Move relevant files to the directory
  3. Update all links to use the file title format (not file paths)
  4. Ensure all cross-references are maintained

### Backlog Task Management Process

- When identifying Backlog tasks in daily notes:
  1. Extract the task key (PDM_S-XXXX) from the URL or task description
  2. Check if a file for that task already exists in the Yourstand/Backlog directory
  3. If not, create a new file named after the task key (e.g., PDM_S-1234.md) following the Backlog file format
  4. Add links to relevant daily notes in the Backlog file under the Links section
  5. Add a link to the Backlog file at the end of the task item in the daily note
  6. Ensure all information from the daily note about the task is reflected in the Backlog file
  7. When a task is mentioned in a new daily note, always add that day's link to the Backlog file's Links section

### 1on1 Meeting Notes Process

- When creating a new 1on1 meeting note:

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

## Tools

- Primary editor: FSNotes (Mac, iPad, iPhone)
- Secondary tools: Raycast, Zed
- No specific IDE is required

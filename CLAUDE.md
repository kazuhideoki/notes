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
- When committing, annotations like `Generated with Claude Code` in the message are unnecessary
- Do not automatically commit or stage changes after work unless specifically instructed

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

- `AI` Directory for AI-related tools, notes, and resources

  - File names should reflect content (e.g., `ai_tool.md`, `mcp_server_guide.md`)
  - Title format should match file name in a readable format (e.g., "AIツールまとめ", "MCP サーバーの自作方法")
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
    - Below the `## Links`, add `## Summary of Previous Meeting [[link]]` with a simple summary of the previous meeting in about 3 points
  - `Backlog` Backlog の各課題に関するノート Keywords: `Backlog`, `課題`, `課題管理`, `タスク`
    - File naming format: `{Task Key}.md`
    - Title format: `{Task Name}` mostly in Japanese
    - Below the `## Links`, add the source file reference (typically a daily note) like `[[YYYY-MM-DD]]`
    - Then add `## Backlog Link` heading followed by a blank line and the URL of the backlog task page like `https://yourstand.backlog.com/view/PDM_S-1234`
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
- When extracting part of a file's content into a separate file, follow these steps:
  1. Create the new file with appropriate name in the correct directory
  2. Add standard structure including title (level 1 header) and a Links section
  3. Copy the content to be extracted into the new file
  4. In the original file, replace the extracted content with a link to the new file using title format `[[New File Title]]`
  5. Add cross-references in both the original file and the new file
  6. In the new file's Links section, add reference links to all related files (example: `[[Original File Title]]`)
  7. Update any other files that might reference the extracted content
  8. For Backlog tasks, follow the specific format described in the Backlog section above

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

## Tools

- Primary editor: FSNotes (Mac, iPad, iPhone)
- Secondary tools: Raycast, Zed
- No specific IDE is required

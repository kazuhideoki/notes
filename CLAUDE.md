# CLAUDE.md - Master Guide

This is the master CLAUDE.md file containing common guidelines. Only major directories (Daily/ and Yourstand/) have their own CLAUDE.md files with specific guidelines for that directory's content.

## Words

- All `note(ノート)` `document(ドキュメント)` `file(ファイル)` means a file that contains information or data.
- `link(リンク)` always refers to a mutual link. A mutual link indicates that the target file also links back to the source file.

## Directory & Files

### Directory Structure

- `Daily/` - Daily notes organized hierarchically
  - `{year}/` - Year folders (e.g., `2025/`)
    - `{month}/` - Month folders (e.g., `04/`)
      - `YYYY-MM-DD.md` - Daily note files
- `etc/` - Miscellaneous files, including AI-related content and idea documents
  - `i/` - Images for etc/ files
- `Yourstand/` - Work-related notes for Yourstand
  - `1on1/` - One-on-one meeting notes
  - `Backlog/` - Backlog task notes
  - `Recruitment/` - Recruitment-related notes

### File and Directory Naming

- Daily notes format: `YYYY-MM-DD.md` in `Daily/{year}/{month}/` directory structure
- Other filenames should use snake_case with alphabetic characters
- Directory names should use PascalCase
- Files created via the FSNotes app use the filename format `YYYYMMDDHHmmSS`
- Store images in `i/` subdirectories

## Tags

### Used Tags

Only use these tags:
#category #fsnotes #idea #ai #learning #programming #meeting #1on1 #backlog

## Document Structure

- Use Markdown with appropriate headers and task lists `- [ ]`
- For nesting in bullet points, use tabs instead of spaces
- Use level 1 header `#` for note title
- Use level 2 headers `##` for major sections
- Use level 3 headers `###` for subsections
- Use task lists with `- [ ]` for tasks, `- [x]` for completed tasks

### Linking

- External links: Use standard Markdown links `[text](url)`
- Internal links: Markdown links `[[File Title]]` without heading
  - **Always use the actual file title (first level 1 header) for internal links, not the filename**
  - Example: Use `[[File Title]]` not `[[file_name]]`
- References: Use footnotes with `[^1]` syntax

### Meta Section Format

Non-daily files should use a standardized meta section for organizing metadata:

1. **Every non-daily file must have a `## Meta` section directly below the title**
2. **Content of the Meta section:**

   - Links to related files in inline format: `[[File A]] [[File B]] [[File C]]`
   - Tags with # prefix: `#tag1 #tag2 #tag3`
   - All links should be on a single line, not as bullet points
   - All tags should be on a separate line after the links

3. **Example Meta section:**

   ```markdown
   ## Meta

   [[Related File 1]] [[Related File 2]] [[Daily Note]]
   #tag1 #tag2
   ```

### Special rule for daily notes:

- Daily notes do NOT have a separate `## Meta` section
- Instead, add internal links directly within relevant task items

### Mutual Link Procedure for New Files

When creating a new file, always:

1. New file side: Add links to the source file in the `## Meta` section
2. Source file side: Add links to the new file (in task items for daily notes, in the `## Meta` section for other files)
3. Related file side: Add links to the new file in the `## Meta` section of any other related files

## Content Creation/Extraction Guidelines

When creating a new file or extracting content to a separate file:

1. Create the new file with appropriate name in the correct directory
2. Add minimal structure including:
   - Title (level 1 header matching the filename)
   - **REQUIRED**: A `## Meta` section with references to related files and appropriate tags
   - A minimal content section (e.g., `## 内容` or `## 概要`) with a brief one-line description
3. **Implement mutual links** (highest priority):
   - New file: Add links to source file and related files in the Meta section
   - Source file: Add links to the new file
   - Related files: Add links to the new file
4. Do NOT populate the file with detailed content unless explicitly requested
5. Do NOT add sections, headings, or content structure beyond the basics unless specifically instructed
6. In the original file, replace extracted content or add a link to the new file using title format `[[New File Title]]`
7. For links with daily notes:
   - Add the daily note link in the new file's `## Meta` section
   - Add the new file link to the relevant task or section in the daily note
8. When adding tags, select one or more relevant tags from the `## Tags` section of this document (for example, use `#ai` for AI-related content) and include them in the `## Meta` section on the line after the links
9. NEVER create fictional content - only extract actual content from existing sources

## Git Workflow

- Command to view daily changes: `git diff --stat`
- Commit message is written in Japanese.
- Commit daily changes at end of day: `git commit -am "本日終了"`
- Morning commit convention: `git commit -am "朝"`
- Pre-work commit convention: `git commit -am "仕事前"`
- Write commit messages that clearly indicate "which state/point in time" the repository was in
- When committing, annotations like `Generated with Claude Code` in the message are unnecessary - never include these
- Do not automatically commit or stage changes after work unless specifically instructed
- NEVER automatically commit changes - always wait for an explicit instruction to commit
- File creation or modification isn't enough reason to commit - only commit when directly asked

## Subdirectory CLAUDE.md Files

Only larger and more complex directories (Daily/ and Yourstand/) possibly have their own CLAUDE.md files. These files contain directory-specific guidelines that MUST be consulted before performing operations in these directories.

### IMPORTANT: Directory-Specific Operations

- ⚠️ CRITICAL STEP: BEFORE performing ANY operations in a specific directory:

  1. **MANDATORY**: Check if a CLAUDE.md file exists in that directory

     - `View` the directory's CLAUDE.md file first (e.g., `/Daily/CLAUDE.md` or `/Yourstand/CLAUDE.md`)
     - This is the FIRST operation you must perform before any file operation
     - This step CANNOT be skipped under any circumstances

  2. **READ AND UNDERSTAND** the directory-specific guidelines completely

  3. Only AFTER fully understanding the specific requirements should you proceed with operations

- This step is especially crucial for:
  - Daily/ directory - has special templates and formatting rules
  - Yourstand/ directory - contains subdirectories with specialized formats (Backlog tasks, 1on1 notes, etc.)
  - Any directory that contains its own CLAUDE.md file

### Standard Format for Subdirectory CLAUDE.md Files

```markdown
# CLAUDE.md for <Directory Name> Directory

<Brief description of the directory purpose>

## Directory Structure

<Description of directory structure, including subdirectories>

## File Naming Conventions

- Basically file name is in English
- File naming rules specific to this directory
- Title formatting conventions
- Any directory-specific naming requirements

## Content Guidelines

- Basically content is in Japanese
- Content expectations for this directory
- Required sections or elements
- Directory-specific formatting rules

## Editing process

- Step-by-step process for creating/editing files in this directory
- File creation workflows specific to this content type
- Tasks to perform when updating content in this directory
- Integration with related files (e.g., maintaining links with daily notes and other relevant files)

## File Templates

<Example templates for common file types in this directory>

## <Additional sections as needed>

<Process guidelines, workflows, or other directory-specific information>
```

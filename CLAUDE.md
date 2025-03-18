# CLAUDE.md - Master Guide

This is the master CLAUDE.md file containing common guidelines. Only major directories (Daily/ and Yourstand/) have their own CLAUDE.md files with specific guidelines for that directory's content.

## Directory Structure

- `AI/` - AI-related tools, notes, and resources
- `Daily/` - Daily notes in YYYY-MM-DD.md format
- `Idea/` - Ideas and concept documents
- `Learning/` - Learning materials, technical notes, and references
- `Programming/` - Programming-related notes and articles
- `Yourstand/` - Work-related notes for Yourstand
  - `1on1/` - One-on-one meeting notes
  - `Backlog/` - Backlog task notes
  - `Recruitment/` - Recruitment-related notes
- `etc/` - Miscellaneous files
- `fsnote/` - FSNotes app operation information

## Common Formatting Guidelines

### File and Directory Naming

- Daily notes format: `YYYY-MM-DD.md` in Daily/ directory
- Other filenames should use snake_case with alphabetic characters
- Directory names should use PascalCase
- Files created via the FSNotes app use the filename format `YYYYMMDDHHmmSS`
- Store images in `i/` subdirectories

### Document Structure

- Use Markdown with appropriate headers and task lists `- [ ]`
- For nesting in bullet points, use tabs instead of spaces
- Use level 1 header `#` for note title
- Use level 2 headers `##` for major sections
- Use level 3 headers `###` for subsections
- Use task lists with `- [ ]` for tasks, `- [x]` for completed tasks

### Linking

- External links: Use standard Markdown links `[text](url)`
- Internal links: Markdown links `[[File Title]]` without heading
- References: Use footnotes with `[^1]` syntax
- All non-daily files must maintain mutual links:
  - Add a `## Links` section directly below the title with bullet points to related files
  - When referencing another file, ensure both files link to each other
- For daily notes only: Do NOT add a separate `## Links` section. Instead, add internal links directly in the relevant task items

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

## Content Creation/Extraction Guidelines

When creating a new file or extracting content to a separate file:

1. Create the new file with appropriate name in the correct directory
2. Add minimal structure including:
   - Title (level 1 header matching the filename)
   - A `## Links` section with references to related files
   - A minimal content section (e.g., `## 内容` or `## 概要`) with a brief one-line description
3. Do NOT populate the file with detailed content unless explicitly requested
4. Do NOT add sections, headings, or content structure beyond the basics unless specifically instructed
5. In the original file, replace extracted content or add a link to the new file using title format `[[New File Title]]`
6. For links with daily notes:
   - Add the daily note link in the new file's `## Links` section
   - Add the new file link to the relevant task or section in the daily note
7. NEVER create fictional content - only extract actual content from existing sources

## Subdirectory CLAUDE.md Files

Only larger and more complex directories (Daily/ and Yourstand/) possibly have their own CLAUDE.md files. These files contain directory-specific guidelines that MUST be consulted before performing operations in these directories.

### IMPORTANT: Directory-Specific Operations

- When creating, editing, or processing files (like Daily/ or Yourstand/ directories):

  1. ALWAYS first check the directory's CLAUDE.md file (e.g., `/Daily/CLAUDE.md` or `/Yourstand/CLAUDE.md`)
  2. Follow the directory-specific formats, templates, and workflows defined in that file
  3. Only after understanding the specific requirements should you proceed with operations

- Examples:
  - For 1on1 meeting notes in Yourstand/1on1/, check Yourstand/CLAUDE.md for proper file naming format (YYYY-MM-DD*1on1*{Name}.md) and required content structure
  - For Daily notes, consult Daily/CLAUDE.md for the correct template and task formatting

### Standard Format for Subdirectory CLAUDE.md Files

```markdown
# CLAUDE.md for <Directory Name> Directory

<Brief description of the directory purpose>

## Directory Structure

<Description of directory structure, including subdirectories>

## File Naming Conventions

- File naming rules specific to this directory
- Title formatting conventions
- Any directory-specific naming requirements

## Content Guidelines

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

## Tools

- Primary editor: FSNotes (Mac, iPad, iPhone)
- Secondary tools: Raycast, Zed
- No specific IDE is required

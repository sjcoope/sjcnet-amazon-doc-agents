# Amazon Document Writing Toolkit

A Claude Code toolkit for writing Amazon-style narrative documents. Template-driven — add a template to `templates/` for any new document type and the agents will follow it automatically.

After running `./install.sh`, all agents and commands are available globally from any directory.

## Agents (installed globally)

| Agent | Purpose |
|---|---|
| `doc-researcher` | Reads files, notes, and web sources → produces a Research Brief |
| `doc-writer` | Writes Amazon-style narrative prose using a template as the structural guide |
| `doc-reviewer` | Critiques drafts against the template structure and Amazon writing standards |

## Slash Commands (installed globally)

| Command | Usage |
|---|---|
| `/new-doc [template] [topic]` | Full pipeline for any doc type |
| `/research [topic]` | Research phase only |
| `/outline [template] [topic]` | Generate outline from research |
| `/draft [template] [topic]` | Draft from approved outline |
| `/review [template] [topic or file]` | Review an existing draft |

## Workflow

Three-stage pipeline with human review gates:

    /research → [YOU REVIEW] → /outline → [YOU REVIEW] → /draft → /review → [YOU REVIEW]

Or run the full pipeline at once:

    /new-doc 6pager Project Phoenix — reduce API latency by 40%
    /new-doc 2pager Customer auth proposal
    /new-doc op2-plan H2 2025 priorities

## Available templates

| Template | Use for |
|---|---|
| `6pager` | Long-form narrative: Introduction, Goals, Tenets, Current State, Lessons Learned, Path Forward |
| `2pager` | Concise proposal: Problem, Solution, Impact, Ask |
| `1pager` | Executive summary (~500-700 words) |
| `op2-plan` | H2 operating plan: Retrospective, Goals, Initiatives, Risks, Investment asks, Headcount |
| `prfaq` | Press release + FAQ (working backwards format) |

## Adding a new document type

1. Create `templates/[name].md` with sections, length targets, and guidance notes
2. That is it — all agents will use it automatically when you pass `[name]` as the template argument

## Project structure

    templates/      Document type templates (add new ones here)
    research/       Research briefs (auto-created)
    outlines/       Approved outlines (auto-created)
    drafts/         Document drafts, versioned v1/v2/v3 (auto-created)
    reviews/        Review feedback (auto-created)
    agents/         Agent source files (installed globally by install.sh)
    .claude/commands/  Command source files (installed globally by install.sh)

## Source material

Drop relevant files into the working directory before starting:
- Markdown notes (`.md`)
- Data files (`.csv`, `.txt`)
- Existing documents or bullet-point notes

The `doc-researcher` agent will find and read them automatically.

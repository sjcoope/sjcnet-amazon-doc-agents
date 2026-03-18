# Amazon Doc Agents

A Claude Code toolkit for writing Amazon-style narrative documents. Template-driven — works with any document type, from any directory.

## Setup (once per machine)

```bash
./install.sh
```

This installs agents and slash commands globally to `~/.claude/`. After installation, you can use them from any directory.

## Usage

### Start a document

```
/new-doc 6pager Project Phoenix — reduce API latency by 40%
/new-doc 2pager Customer authentication proposal
/new-doc op2-plan H2 2025 operational priorities
```

The full pipeline runs with a review gate after each stage:

    Research → [YOU REVIEW] → Outline → [YOU REVIEW] → Draft → Review → [YOU REVIEW]

### Run individual stages

```
/research topic or file paths
/outline 6pager project-phoenix
/draft 6pager project-phoenix
/review 6pager project-phoenix
```

## Templates

| Name | Document type |
|---|---|
| `6pager` | Long-form narrative (Introduction, Goals, Tenets, Current State, Lessons Learned, Path Forward) |
| `2pager` | Concise proposal (Problem, Solution, Impact, Ask) |
| `1pager` | Executive summary (~500-700 words) |
| `op2-plan` | H2 operating plan (Retrospective, Goals, Initiatives, Risks, Investments, Headcount) |
| `prfaq` | Press release + FAQ (working backwards format) |

### Adding a new template

Create `templates/[name].md` with your sections, length targets, and guidance notes.
The agents will follow whatever structure you define — no other changes needed.

## What gets installed

### Agents (`~/.claude/agents/`)

| Agent | Model | What it does |
|---|---|---|
| `doc-researcher` | Sonnet | Reads local files + web → Research Brief |
| `doc-writer` | Sonnet | Writes prose following the template structure |
| `doc-reviewer` | Opus | Reviews draft against template + Amazon standards |

### Commands (`~/.claude/commands/`)

| Command | What it does |
|---|---|
| `/new-doc` | Full pipeline for any document type |
| `/research` | Research phase only |
| `/outline` | Generate outline from research |
| `/draft` | Draft from approved outline |
| `/review` | Review an existing draft |

### Project-only (not installed globally)

| Location | What it is |
|---|---|
| `.claude/agents/doc-orchestrator.md` | Pipeline orchestrator agent |
| `templates/*.md` | Document type templates |

## Project structure

```
amazon-doc-agents/
├── CLAUDE.md
├── README.md
├── install.sh
├── agents/                         # Source files for global agents
│   ├── doc-researcher.md
│   ├── doc-writer.md
│   └── doc-reviewer.md
├── templates/                      # Document type templates
│   ├── 6pager.md
│   ├── 2pager.md
│   ├── 1pager.md
│   ├── op2-plan.md
│   └── prfaq.md
├── .claude/
│   ├── settings.json
│   ├── agents/
│   │   └── doc-orchestrator.md
│   └── commands/                   # Source files for global commands
│       ├── new-doc.md
│       ├── research.md
│       ├── outline.md
│       ├── draft.md
│       └── review.md
├── research/                       # Output: research briefs
├── outlines/                       # Output: approved outlines
├── drafts/                         # Output: document drafts
└── reviews/                        # Output: review feedback
```

## Installing on a new machine

### macOS / Linux / Git Bash

```bash
cd amazon-doc-agents
./install.sh
```

### Windows (manual)

1. Create `%USERPROFILE%\.claude\agents\` and `%USERPROFILE%\.claude\commands\`
2. Copy all files from `agents/` into the agents folder
3. Copy all files from `.claude/commands/` into the commands folder

## Keeping up to date

Re-run `./install.sh` after pulling changes — it overwrites safely.

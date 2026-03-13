# Amazon Doc Agents

A Claude Code workspace for writing Amazon-style narrative documents. Template-driven — works with any document type.

## Setup (once per machine)

```bash
./install.sh
claude .
```

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
| `op2-plan` | H2 operating plan (Retrospective, Goals, Initiatives, Risks, Investments, Headcount) |

### Adding a new template

Create `templates/[name].md` with your sections, length targets, and guidance notes.
The agents will follow whatever structure you define — no other changes needed.

## Agents

### Global (`~/.claude/agents/` — available everywhere after install)

| Agent | Model | What it does |
|---|---|---|
| `doc-researcher` | Sonnet | Reads local files + web → Research Brief |
| `doc-writer` | Sonnet | Writes prose following the template structure |
| `doc-reviewer` | Opus | Reviews draft against template + Amazon standards |

### Project (`.claude/agents/` — this project only)

| Agent | What it does |
|---|---|
| `doc-orchestrator` | Runs the full pipeline for any doc type |

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
├── templates/                      # One file per document type
│   ├── 6pager.md
│   ├── 2pager.md
│   └── op2-plan.md
├── .claude/
│   ├── settings.json
│   ├── agents/
│   │   └── doc-orchestrator.md
│   └── commands/
│       ├── new-doc.md
│       ├── research.md
│       ├── outline.md
│       ├── draft.md
│       └── review.md
├── research/
├── outlines/
├── drafts/
└── reviews/
```

## Installing on a new machine

### macOS / Linux / Git Bash

```bash
cd amazon-doc-agents
./install.sh
claude .
```

### Windows (manual)

1. Create `%USERPROFILE%\.claude\agents\`
2. Copy all files from `agents/` into it
3. Open Claude Code from this project directory

## Keeping agents up to date

Re-run `./install.sh` after pulling changes — it overwrites safely.

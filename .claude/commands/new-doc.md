Start a new Amazon document. Arguments: $ARGUMENTS

The arguments should be in the format: [template-name] [topic description]
Examples:
  6pager Project Phoenix — reduce API latency by 40%
  2pager Customer authentication proposal
  op2-plan H2 2025 operational priorities

Steps:
1. Parse the first word as the template name (e.g. "6pager", "2pager", "op2-plan")
2. Parse the rest as the topic description
3. Check that templates/[template-name].md exists. If it does not, list available templates in the templates/ directory and ask the user to choose one.
4. Ask me: "What source files or notes should I use? You can list file paths, paste bullet points, or just describe the topic."

Then run the full pipeline, pausing for my approval at each gate:

Stage 1 — Research
  - Use the doc-researcher agent to gather and synthesise the source material
  - Save to research/[topic]-research-brief.md
  - Present the brief — PAUSE and wait for my approval before continuing

Stage 2 — Outline
  - Read templates/[template-name].md for required sections and structure
  - Generate a detailed outline based on the research brief and the template
  - Save to outlines/[topic]-outline.md
  - Present the outline — PAUSE and wait for my approval before continuing

Stage 3 — Draft and review
  - Use the doc-writer agent, passing it the template, research brief, and approved outline
  - Save to drafts/[topic]-draft-v1.md
  - Use the doc-reviewer agent, passing it the draft and the template
  - Save review to reviews/[topic]-review-v1.md
  - Present the Overall Assessment and Must Fix items — PAUSE and ask for direction

Create any missing subdirectories (research/, outlines/, drafts/, reviews/) as needed.
Do not proceed from one stage to the next without my explicit approval.

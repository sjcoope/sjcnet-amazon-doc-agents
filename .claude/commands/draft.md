Use the doc-writer agent to draft the document for: $ARGUMENTS

The arguments should be in the format: [template-name] [topic]
Example: op2-plan H2 2025

Steps:
1. Parse the first word as the template name, the rest as the topic
2. Read templates/[template-name].md — this is the structural guide the writer must follow
3. Check outlines/ for an approved outline for this topic — read it in full
4. Check research/ for the research brief — read it in full
5. Pass all three (template, outline, research brief) to the doc-writer agent

The writer must:
- Follow the template's section structure and length targets exactly
- Write in Amazon narrative prose (no bullets in body sections unless the template allows them)
- Draw only from the research brief and outline — do not invent data

Save the draft to drafts/[topic]-draft-v1.md (increment the version number if a draft already exists).

After drafting, report:
- A brief summary of what was written
- Sections where assumptions were made due to missing information
- Data gaps that should be filled before review

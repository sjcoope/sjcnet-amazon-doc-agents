Use the doc-researcher agent to research: $ARGUMENTS

Instructions:
- Use Glob to find any relevant .md, .txt, or .csv files in the current directory
- Read and synthesise all relevant source material
- If local sources are thin or the user asks for it, use WebSearch and WebFetch for additional context
- Note the intended document type in the Research Brief if it is known

Save the output to research/[topic]-research-brief.md (create the research/ directory if it does not exist).

After presenting the brief, ask: "Does this capture what you need? Anything missing or incorrect before I move on?"

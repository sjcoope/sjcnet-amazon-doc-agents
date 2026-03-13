Generate a document outline for: $ARGUMENTS

The arguments should be in the format: [template-name] [topic]
Example: 6pager Project Phoenix

Steps:
1. Parse the first word as the template name, the rest as the topic
2. Read templates/[template-name].md in full — this defines the required sections and structure
3. Check the research/ directory for an existing research brief for this topic. If found, read it.
4. Create a detailed outline with:
   - All section headings from the template
   - 2-3 bullet points per section describing what each paragraph will cover
   - Callouts for specific data points, metrics, or quotes to include
5. Save to outlines/[topic]-outline.md (create the directory if needed)
6. Present the outline and ask: "Does this look right? Approve or tell me what to change."

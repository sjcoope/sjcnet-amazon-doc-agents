Use the doc-reviewer agent to review: $ARGUMENTS

The arguments can be in the format: [template-name] [topic], or just a file path to the draft.
Example: 6pager project-phoenix
Example: drafts/project-phoenix-draft-v1.md

Steps:
1. If a file path is given, read that file directly
2. Otherwise, check drafts/ for the latest draft matching the topic
3. Identify the template to use:
   - If a template name was given, read templates/[template-name].md
   - Otherwise, infer from the research brief or outline in the corresponding folders
4. Pass both the draft and the template to the doc-reviewer agent
5. Save the review feedback to reviews/[topic]-review-v1.md (increment if a review already exists)

After presenting the review summary (Overall Assessment + Must Fix), ask:
"Want me to apply the Must Fix items now, or would you like to read the full review file first?"

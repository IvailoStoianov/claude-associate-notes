# M2: Prompting & Task Execution

## Component stack
Build each prompt from these five components. Choose which ones you need based on the task.

1. **Role**: who Claude should act as (e.g. "financial analyst")
2. **Context**: what Claude can't know on its own (audience, situation, background)
3. **Task**: what Claude must do
4. **Constraints**: limits on scope, length, tone, etc.
5. **Output format**: how the result should look

> [!tip] Don't assume Claude knows things. Be as explicit as possible.

## Weak vs strong prompt

**Weak**
> "Write a summary of our quarterly operations."

**Strong**
> "You are an operations analyst *(role)*. I am preparing a one-page update for our regional director, who cares about throughput and cost, not process detail *(context and audience)*. Summarize the attached Q3 operations data *(task)*, covering only the three metrics that moved more than 10 percent against target *(constraint)*. Format as a short headline followed by three bullet points, each one sentence *(output format)*."

## Task decomposition for complex requests
If a request is too large or complex, split it into discrete, ordered steps and run them in sequence. Don't ask for everything at once.

### Example
**Scenario:** A communications manager needs to turn a dense 20-page policy change into an internal announcement, an FAQ for staff, and a short briefing for executives.

**Decomposition:**
1. **Extract** the substantive changes from the policy document and what each one means in practice.
2. **Verify** the extraction is complete and accurate before building anything on top of it.
3. **Draft the staff announcement** from the confirmed change list, tuned to a general audience.
4. **Draft the FAQ**, anticipating the questions staff will likely ask about those changes.
5. **Draft the executive briefing**, compressed down to decisions and impact.

Note the verification step (2): every later step builds on the extraction, so errors there would spread to all three deliverables.

## Iterating prompts to improve output
When a prompt doesn't give the output you want, don't just rewrite the whole thing. Instead:

1. Read the output.
2. Work out which component fell short (role, context, task, constraints or format).
3. Fix that component only.
4. Stop when changes become marginal. You don't need the perfect prompt.

### Symptom → cause → fix
| Symptom | Likely cause | Fix |
| --- | --- | --- |
| Generic or off-base | Context was thin | Add the background Claude couldn't infer |
| Answered the wrong question | Task verb was ambiguous | Sharpen the instruction |
| Wrong length, tone or shape | Missing constraint or format | Add it |
| Close, but one section misses | n/a | Iterate on that section only. Don't discard a mostly-right draft |

### Example iteration cycle
Task: follow-up email to a client about a delayed deliverable.
1. **Round 1:** "Write a follow-up email about the delay." → generic and defensive, no date, no reason. *Diagnosis: thin context, no tone constraint.*
2. **Round 2:** added the cause, the new delivery date, the tone ("accountable, not over-apologetic") and a length limit (under 120 words). → strong; only the subject line is missing.
3. **Round 3:** "Add a subject line that signals resolution, not just delay."

## Adapting strategy by task type
The component stack applies to every task, but the emphasis shifts depending on the type of task.

### Quick reference
| Task type | Tighten | Loosen |
| --- | --- | --- |
| Analysis | Criteria, standards, scope | Phrasing |
| Research | Question, sources, citations | Synthesis approach |
| Drafting | Audience, tone, format | Word choice |
| Brainstorming | Goal and guardrails only | Quantity and direction |

### Examples
- **Analysis:** "Compare these two vendor contracts on payment terms, termination rights and liability caps. State which is more favorable and why, in a three-row table." Tight criteria, defined output.
- **Research:** "Using current sources, summarize how three named competitors positioned their Q2 launches. Cite each source. Flag anything you can't verify." Scope and citation discipline up front.
- **Drafting:** "Draft a 150-word LinkedIn post announcing our new reporting feature, for operations managers, confident but not salesy." Audience, length and tone fixed; phrasing left open.
- **Brainstorming:** "Give me 20 angles for a campaign around faster month-end close. Range widely; don't self-edit yet." Goal and one guardrail only. Add constraints later.

> [!warning] Citations
> Citations are checkable when they come from a grounded source (web search or Research). Citations from training memory alone can look just as confident, so verify them independently.

## Key takeaways
1. **Structure drives quality, not cleverness.** Run the five components before sending anything that matters.
2. **Context is the component you'll forget.** Claude can't see what's only in your head. Generic output is usually a context gap, not a model limit.
3. **Decompose complex work into ordered steps.** Each step should give a checkable result, with the high-stakes foundation built first.
4. **Iterate on the component that failed.** Treat the output as a diagnostic, change one thing, and stop when rounds stop improving it.
5. **Match strategy to task type.** Analysis wants constraints, brainstorming wants latitude. Decide where you need control and where you need range.

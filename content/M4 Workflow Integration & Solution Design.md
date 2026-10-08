# M4: Workflow Integration & Solution Design

**The big idea:** "I use Claude" is a personal habit; "our workflow uses Claude" is a repeatable team process. It only works if you choose on purpose which steps Claude does (**Delegation**: AI, human or both).

## Analyzing Requirements and Use Cases with Claude

Give Claude messy inputs (documents, email threads, verbal asks) and ask for a **structured analysis**, not a summary.

### Vague need → specific tasks
"We need better reporting" isn't actionable. Pin it down:
- What report?
- For whom?
- How often?
- From what data?
- In what format?

### Step 1: Extract
Ask Claude to pull out every requirement. For each one, have it give:
- A short label
- Where it came from (source section)
- Whether it's already answered
- Anything ambiguous

Return it as a table.

### Step 2: Pressure-test
Ask Claude to challenge its own list:
- Which items are ambiguous?
- Which could be read two ways?
- Which are only implied?

This finds **hidden requirements** (buried in side clauses or implied by scoring criteria). Missing them can lose the job.

> [!tip] Extract first, then pressure-test
> Together they're much stronger than either alone. It's the M3 "don't trust it blindly" habit, applied at the start.

### Example: RFP response
- **Input:** 40-page RFP plus a messy email thread of internal answers
- **Prompt:** "Extract every requirement. Give a label, the RFP section, whether our thread answers it, and anything ambiguous. Return a table."
- **Output:** one table the team works from, with answered/open status and questions to send the client
- **Setup:** use a **Project**, not a one-off chat, since it repeats. Past proposals go in the knowledge base, Skills handle formatting, standing instructions hold the extraction format (more in Module 5)

## Research, Planning & Process Optimization
Planning mixes two things Claude handles differently:
- **Synthesis** (combining and structuring information): Claude is strong
- **Calculation:** must be verified

**Best approach:** Claude synthesizes, code execution computes. The plan then rests on numbers that were computed, not generated.

### Research & synthesis
- Claude can gather considerations, structure options and lay out trade-offs
- **Current info** (after its training): web search in chat for quick lookups, Research for deeper, up-to-date inputs
- Synthesis is where unverified claims can slip in, so use the M3 verification habits throughout

### Code execution for numbers
- If the plan depends on numbers, upload the data and have Claude **compute** them (calculations, trend charts, file processing)
- Staffing plan on a *guessed* utilization rate = a guess. On code-run analysis of *real* timesheet data = a plan

### Where AI changes the plan
| Step type | Who |
| --- | --- |
| **Synthesis-heavy** (weighing many considerations) | Claude adds the most here |
| **Judgment** (risk appetite, politics, budget) | Stays with a person |

Scan the workflow for its synthesis-heavy steps. That shows where to apply Claude and where to leave the call to a person.

### Example: capacity plan
- **Task:** an operations lead plans next quarter's headcount
- **Steps:**
  1. Upload 4 quarters of ticket data
  2. Code execution computes volume growth and tickets resolved per analyst
  3. Claude recommends headcount from those verified figures
- **Prompt:** "Using code execution on the attached ticket data, calculate quarterly volume growth and average tickets resolved per analyst. Then recommend the headcount needed to hold our current resolution time, and show the assumptions."
- **Why it works:** the figures came from code, so the plan can be defended line by line
- **Still human:** the decision to hire. Budget and hiring freezes are things Claude can't see
## Solution Design, Development & Iteration
Claude is a **design collaborator, not a vending machine**. The value comes from running a loop, not asking once.

### The iteration loop
1. **Ideate:** Claude gives options
2. **Prototype:** make one option concrete
3. **Feedback:** find what's wrong
4. **Refine:** fix it
5. **Repeat** until the solution holds

> [!tip] Run it inside a Project
> A Project keeps the context, constraints and past decisions stable, so each round builds on the last instead of restarting. That's what gives you a solution and not a pile of one-off drafts.

### Example: internal metrics dashboard
A business analytics team needed a small internal tool to track and chart a set of metrics. Instead of commissioning a build, they had Claude make it as a **web artifact** and iterated just by asking.

| Cycle | Request | Result |
| --- | --- | --- |
| **1. Build** | "Build a dashboard artifact showing these five metrics from the attached data, with a chart for each." | Working artifact |
| **2. Filter & totals** | "Add a filter by region and a summary row at the top with the totals." | Filter and totals added |
| **3. Color & print** | "Color-code the month-over-month deltas (green for improvement) and make the layout print cleanly." | Polished version |

Three cycles, no code written by the team. They refined by **describing the change**, not by coding it.

### When to escalate
- An artifact works when it serves a **small team's internal need**
- Once others **depend on it as infrastructure** (uptime, security, integrations), it's beyond Associate scope. Hand it to a Developer or Architect
- **Signal:** people rely on it. Then it's no longer a prompt-and-iterate exercise

## Delegation Mapping: Redesigning Workflows with Claude Inside
**The core skill of the module.** Before redesigning a workflow, map it step by step and decide for each step who owns it:
- **AI-appropriate:** Claude does it
- **Human-retained:** a person does it
- **Collaborative:** both together

### Three criteria (judge every step on each)
| Criterion | Question | Rule |
| --- | --- | --- |
| **Reversibility** | Can it be undone if Claude gets it wrong? | Reversible = more delegation. Irreversible = needs a human |
| **Stakes** | What does an error cost here? | High cost = human-owned or human-reviewed |
| **Accountability** | Who answers for the outcome? | Accountability never delegates, even if the drafting does |

### Building the redesign
- **Skill** for repeatable procedure steps, **code execution** for data steps
- A configured Skill beats "heroic prompting" that relies on remembering the right wording
- Human-retained steps become **explicit review gates**, not afterthoughts

### Example: contract review (a common first-win workflow)
| Step | Who | Why |
| --- | --- | --- |
| Extract clauses | AI | Reversible, low stakes, mechanical |
| Flag departures from the company playbook | AI | Reversible; a Skill carries the playbook rules |
| Draft the redline and rationale | Collaborative | AI drafts, human judges each edit |
| Approve or reject each change | Human | High stakes, accountability doesn't delegate |
| Compute financial exposure of a penalty clause | AI (code execution) | Numeric: compute, don't estimate |
| Sign and send | Human | Irreversible, external, legally binding |

The AI does real work (the redline draft, not just a summary). The human owns the decisions and the irreversible steps. **That split is the redesign.**

### Over-delegation
Giving AI more than the risk justifies, such as letting it approve clauses or send the contract because it drafted them well. **Good drafting is not a license to delegate the decision.** This is where the second team in the intro went wrong.

### Common mapping errors
- **Halo delegation:** handing off a step because the previous one went well. Judge each step on its own
- **Collaborative quietly becomes automated:** "AI drafts, human reviews" turns into "AI drafts" if the review gate is never staffed. No real reviewer = automated step
- **Mapping the tool, not the work:** mapping around features you like (a Skill you built). Map the work first, then pick features

## Communicating Value and Limitations to Stakeholders 
You'll have to explain the workflow to people who didn't build it (manager, client, risk team). **Credibility comes from accurate claims**, so state the limits as clearly as the value. Overstating is how you lose trust at the first visible mistake.

### Describe capability accurately
Say what Claude reliably does and what it doesn't. No inflation, no false modesty.
- Accurate: "Claude drafts the first-pass redline, which a lawyer reviews."
- Overstated: "Claude handles contract review." (invites the question your first error will answer badly)

### Match the message to the audience
Same workflow, same human gate. Only the detail changes.
| Audience | Wants |
| --- | --- |
| **Technical / high AI literacy** (e.g. legal lead) | Feature detail and failure modes |
| **Executive** | Outcome, oversight in place, risk posture |

Example for a legal lead: "Claude extracts clauses, flags playbook departures and drafts the redline. It does not approve changes, that gate stays with you. Known weak spot: it can miss obligations that are only implied, so treat the flags as a prompt for your read, not a substitute."

> [!tip] Set expectations that match the capability boundary
> So nobody is surprised later. It's the Description skill from M2, aimed at stakeholders instead of Claude.

### Document the human oversight
Name the review gates that stay in place, e.g. "Every output destined for a client passes human review." Stakeholders trust an AI workflow **more** when the human checkpoints are explicit.

### Overstated vs accurate
| Overstated | Accurate |
| --- | --- |
| "Our new AI system reviews contracts automatically." (sets an expectation the workflow can't meet, hides the human gate) | "Claude drafts the redline and flags playbook departures; our legal lead reviews and approves every change before anything is sent. Review time is down about half, with the same approval standard." (value and limits in one breath) |

### Phrases that quietly overstate
- **"Fully automated"**: almost never true, and the first visible error exposes it
- **"Claude handles X"**: drops the human gate from the sentence
- **"Basically as good as a person at Y"**: sets a standard it will eventually miss in public

**Fix every time:** state what the tool does, then name the human checkpoint.

## Key takeaways
1. **Delegate deliberately, don't automate indiscriminately.** Value comes from choosing which steps Claude does, not from handing it everything.
2. **Claude is a requirements-analysis partner.** Feed it messy inputs, get back structured, traceable, testable needs.
3. **Build plans on verified numbers.** Pair Claude's synthesis with code execution, so figures are computed, not generated.
4. **Map every step against three criteria.** Reversibility, stakes and accountability decide: AI, human or collaborative.
5. **Communicate limits as clearly as value.** Accurate claims, with the human review gates named, earn and keep stakeholder trust.


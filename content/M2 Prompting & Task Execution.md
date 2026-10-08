
## Component stack
choose based on need
1. Role - "financial analyst"
2. Context - the stuff Claude could not know
3. Task - what Claude must do
4. Constraints
5. Output format
Don't assume Claude knows things, be as explicit as possible.

## "Weak" vs "Strong" prompt examples

Weak
>"Write a summary of our quarterly operations."

Strong
>"You are an operations analyst _(role)_. I am preparing a one-page update for our regional director, who cares about throughput and cost, not process detail _(context and audience)_. Summarize the attached Q3 operations data _(task)_, covering only the three metrics that moved more than 10 percent against target _(constraint)_. Format as a short headline followed by three bullet points, each one sentence _(output format)_."

## Task Decomposition for Complex Requests
If an request is too large/complex its better to split it into discrete, ordered steps, then running them in sequence rather than asking for everything at once.

### Example

Scenario - A communications manager needs to turn a dense 20-page policy change into an internal announcement, an FAQ for staff, and a short briefing for executives. Before reading on, decompose this into an ordered sequence of steps you would run with Claude.

Model decomposition -
**Step 1:** Extract the substantive changes from the policy document and what each one means in practice.

**Step 2:** Confirm the extraction is complete and accurate before building anything on top of it.

**Step 3:** Draft the staff announcement from the confirmed change list, tuned to a general audience.

**Step 4:** Draft the FAQ, anticipating the questions staff will likely ask about those changes.

**Step 5:** Draft the executive briefing, compressed down to decisions and impact.**Step 1:** Extract the substantive changes from the policy document and what each one means in practice.

**Step 2:** Confirm the extraction is complete and accurate before building anything on top of it.

**Step 3:** Draft the staff announcement from the confirmed change list, tuned to a general audience.

**Step 4:** Draft the FAQ, anticipating the questions staff will likely ask about those changes.

**Step 5:** Draft the executive briefing, compressed down to decisions and impact.
## Iterating Prompts to Improve Output
Whenever a prompt doesn't give us desired output instead of just rewriting the same prompt. Read the output and determine which component fell short, then fix it. Stop when the change is marginal and not clearly better. You don't need the perfect prompt
![[Pasted image 20261007144312.png]]
### Example iteration cycle
![[Pasted image 20261007144402.png]]
## Adapting Strategy by Task Type
The component stack applies to every task but switch the emphasizes based on the task.
### Quick reference
![[Pasted image 20261007144902.png]]
### Example
![[Pasted image 20261007145001.png]]
## Key Takeaways
![[Pasted image 20261007150052.png]]
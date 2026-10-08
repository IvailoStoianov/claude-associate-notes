# M3: Evaluating & Validating Claude's Output

## Goals
1. Learn to evaluate output
2. Recognize failure patterns
3. Build verification into your prompts
4. Know the thresholds where human review is mandatory
5. Choose the right task format

---

## Discernment: evaluating accuracy, completeness and fitness

### Evaluation
Check the output against three fixed references:
1. **Requirements.** Does the output reflect what you asked for?
2. **Source material.** Where the output relies on documents you supplied, does it match them?
3. **Professional standards.** Would this pass in your field?

### Discernment protocol
Run the same evaluation check, the same way, every time.

### Stakes calibration
Match the level of review to the stakes.
- **Zero-tolerance work** (legal analysis, financial figures, compliance reporting): accuracy matters more than speed.
- **Low-stakes work:** a lighter review is appropriate.

### Three-way triage
After review, sort each output into one of three states.

| Verdict | When it applies |
| --- | --- |
| **Ready to use** | Meets requirements, matches sources, clears professional standards. Ship it. |
| **Needs revision** | Close, but a specific gap remains. Note the gap and iterate. |
| **Needs human override** | Stakes, errors or uncertainty mean it shouldn't go out on Claude's draft alone. Escalate to a person. |

### Conclusion
- **Accuracy:** is what's present correct?
- **Completeness:** is anything missing?

Always check both.

### Example: triaging three outputs
1. **Competitor-pricing summary** (from uploaded PDFs)
   - Requirements met, but the source check fails: "$40/user" omitted "minimum 10 seats", which changes the comparison
   - **Needs revision.** Fix with a source-restricted re-prompt, not a rewrite
2. **Internal process recommendation** (3 options to cut invoice-processing time)
   - Requirements met, no sources to check, standards cleared, low stakes
   - **Ready to use.** Over-verifying wastes the time the tool saved
3. **Compliance-gap analysis** (policy vs. regulation)
   - Flags four gaps confidently, but the regulation wasn't uploaded, so Claude used training-data recall of a rule that may have changed. Stakes are regulatory
   - **Needs human override.** A useful prompt for a compliance expert, not a substitute for one

---

## Hallucinations, inconsistencies & bias

> [!warning] Plausible ≠ verified
> Claude writes fluently whether it is right or wrong. Never rely on tone or confidence to flag an error.

### Hallucination patterns

#### 1. Plausible-but-unsupported claims
- Sounds right and fits the topic, but nothing in the source or in fact backs it up
- The most dangerous kind, because nothing about it looks wrong
- **Check:** can I trace the claim back to the source?

#### 2. Fabricated specifics
- Made-up stats, dates, names, quotes and citations
- Specific details sound authoritative, which makes them persuasive
- **Check:** verify every number, name and citation independently

#### 3. Confident tone masking uncertainty
- Claude doesn't hedge in proportion to how sure it actually is
- A guess and a well-grounded fact sound exactly the same
- Never use tone as a signal of accuracy
### Inconsistencies and bias
- **Internal contradictions** Be careful when reading a longer output because a claim early on can be contradicted later.
- **Confirmation bias in framing.** Claude tends to agree with the view built into your prompt. If you hint at the answer you want, it may go along with it.
## Fact-Checking and Grounding Techniques
### "The strongest verification is build into the prompt." Good prompt habits.

#### Prompt verifiability
- Explicitly allow Claude to say "I don't know".
- Restrict to provided resources.
- Ask for sources behind each claim.
#### Grounding techniques
- When dealing with larger documents, first ask Claude to extract the supporting quotes before drawing conclusions.
- Re-run the same request and compare. Where runs agree = confidence rise, where they diverge = soft spots that need human look.
- Validate against authoritative sources.
#### Examples
- Permission to not know
	"If the answer is not supported by the documents I provided, say so explicitly rather than estimating. It is acceptable to answer 'the provided materials do not cover this.'"

- Source restriction
	"Answer using only the attached contract. Do not use general knowledge. For anything the contract does not address, list it under 'Not covered by this document.'"

- Auditable citation
	"For every claim, cite the section and clause number it comes from, in parentheses, so I can verify it against the source."

- Quote-grounding
	"Before you analyze, extract the exact sentences from the document that bear on my question. Then base your analysis only on those quotes."





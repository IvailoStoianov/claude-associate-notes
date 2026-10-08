# M3: Evaluating & Validating Claude's Output

**Big idea:** Claude's output can sound perfect and still be wrong. This module is about how to check it, and when to hand it to a human.

## Goals
1. Check Claude's output before using it
2. Recognize the common ways it goes wrong
3. Write prompts that make errors easier to catch
4. Know when a human must review
5. Pick the right output format for the job

---

## 1. Discernment: how to check an output
Compare every output against **three things**, in the same order each time:

| Check | Question to ask |
| --- | --- |
| **Requirements** | Did it do everything I asked, not just the easy parts? |
| **Source material** | Does it match the documents I gave it? |
| **Professional standards** | Would this pass in my field? |

Also check two things about the content itself:
- **Accuracy:** is what's written correct?
- **Completeness:** is anything missing?

**Match effort to risk.** Legal, financial or compliance work: check everything. Low-stakes work: a quick look is enough.

### Sort every output into one of three verdicts
| Verdict | When | What to do |
| --- | --- | --- |
| **Ready** | Passes all three checks | Use it |
| **Revise** | Almost right, one specific problem | Name the problem, re-prompt |
| **Human override** | Too risky or too uncertain to trust Claude alone | Hand it to a person |

**Examples**
- A pricing summary that left out "minimum 10 seats" → **Revise** (re-prompt using only the source file)
- Three internal ideas for faster invoicing → **Ready** (checking harder would waste the time you saved)
- A compliance review done from memory, with no regulation uploaded → **Human override**

---

## 2. How Claude goes wrong

> [!warning] Plausible does not mean verified
> Claude writes smoothly whether it's right or wrong. A confident tone tells you nothing about accuracy.

### Hallucinations (made-up content)
| Type | What it looks like | How to check |
| --- | --- | --- |
| **Plausible but unsupported** | A reasonable-sounding claim with no basis | Find it in the source. If you can't, don't trust it |
| **Fabricated specifics** | Invented statistics, dates, names, quotes or citations | Verify each one yourself. Specific details *feel* trustworthy, which is the danger |
| **Confident tone hiding doubt** | A guess and a fact sound identical | Don't use tone as a signal |

### Other problems
- **Contradictions:** in long answers, something said later may conflict with something said earlier. Reread the whole thing.
- **Confirmation bias:** if your prompt hints at the answer you want, Claude tends to agree. If it agrees too easily on a question that should be open, rephrase neutrally or ask it to argue the other side.

---

## 3. Grounding: make Claude stick to the facts
*Grounding* means tying Claude's answer to real material, so it can't just make things up. The best time to do this is in the prompt, before the answer exists.

**Three prompt habits**
1. Let Claude say "I don't know"
2. Limit it to the sources you provide
3. Ask for a source for each claim

**Extra techniques**
- **Quotes first:** with long documents, have Claude pull out the relevant quotes before it draws conclusions
- **Run it twice and compare:** where the answers match, you can trust it more; where they differ, have a human look
- **Check against authoritative sources** (official documents, original data)

**Prompts you can reuse**
| Goal | Prompt |
| --- | --- |
| Allow "I don't know" | "If the documents don't support an answer, say so instead of estimating." |
| Limit to sources | "Use only the attached contract. List anything it doesn't cover under 'Not covered'." |
| Show where it came from | "Cite the section and clause for every claim." |
| Quotes first | "Extract the relevant sentences first, then base your analysis only on them." |

---

## 4. Diligence: when a human must review
Some work should never go out on Claude's draft alone, however good it looks. Decide these rules **ahead of time**, so you aren't making the call under pressure after something has gone wrong.

### Four questions to ask
| Question | Why it matters |
| --- | --- |
| **Stakes:** what does a mistake cost? | High cost means human review, however confident the output sounds |
| **Reversibility:** can it be undone? | Something sent or filed is harder to undo than a draft |
| **Audience:** who will see it? | Clients, executives and regulators need more checking than internal drafts |
| **Regulation:** does a rule, contract or law apply? | Using AI doesn't remove your obligations |

### Always get review for
- Final client deliverables
- Financial figures that matter, or anything that will be audited
- Regulated, confidential or sensitive data
- Public or legal statements

### Keep iterating, or hand it off?
- Each round makes it better → keep going
- Rounds stop improving it → **stop prompting and ask a human.** More prompts can't add the judgment the situation needs.

> [!warning] You own what you ship
> Using Claude doesn't move responsibility to Claude. Once you send it, it's your work, held to the same standard as if you'd written it yourself.

### Three scenarios
| Situation | Result |
| --- | --- |
| **Internal meeting agenda.** Low stakes, easy to change, internal | Ship it quickly |
| **Board financial summary that looks clean.** High stakes, executive audience, hard to undo | Human review, and recompute the figures with code. Looking clean doesn't matter |
| **Client proposal revised five times; rounds 3 to 5 barely changed it.** High stakes, external | Stop prompting, get a colleague's fresh read. The warning sign is no more improvement, not a visible error |

---

## 5. Editing Claude's draft
**Claude drafts, you deliver.** Before sending, adjust three things:
1. **Clarity:** Claude tends to be thorough; good editing makes it precise
2. **Tone:** match it to the task and the reader
3. **Formatting:** shape it for how it will actually be read

---

## 6. Choosing an output format
| Format | Use it for |
| --- | --- |
| **Inline** | Conversational answers |
| **Artifacts** | Documents and code |
| **Structured** (tables, defined schemas) | Data |
| **Code execution** | Numbers that must be right |

### Code execution for numbers
**When numbers must be right, have Claude calculate them with code instead of writing them out.** Code gives a result you can trace and re-run. It can still have a bug, so check the code.

| Path | Example | Problem or benefit |
| --- | --- | --- |
| **Written in prose** | "Q3 revenue was about $4.7 million." | A guess shaped like an answer, and a wrong total spreads into every slide that uses it |
| **Computed with code** | Claude runs code on the real file and returns $4,712,380, the top accounts ranked, and a chart | Traceable to the exact rows. Use this when the number feeds a decision |

### Give Claude clean inputs
**Organized inputs give organized outputs.** Also say what structure you want back. Three habits:
- **Remove duplicates:** so Claude isn't reconciling three near-identical copies
- **Label each source:** e.g. "this is the approved policy; these are the draft responses"
- **Cut what's irrelevant:** noise in the input becomes noise in the output

---

## Key takeaways
1. **You stay accountable.** You own every claim you ship, whoever wrote it. This is the exam's largest section.
2. **Check against three things:** requirements, source, professional standards. Use the same check each time, with effort scaled to the stakes.
3. **Plausible is not verified.** Made-up specifics, confident guesses and missing pieces all look competent. Learn the signs.
4. **Build checking into the prompt.** Allow "I don't know", limit to sources, require citations. It's cheaper to prevent errors than to dig them out later.
5. **Set your review rules ahead of time.** Stakes, reversibility, audience and regulation decide when a human must look.
6. **Pick the format by how reliable it must be.** For numbers that must be right, use code, not prose.

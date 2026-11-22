# Pinterest

> Pinterest engineers have written two careful posts on testing agent behavior: whether coding agents load a skill at all, and an automated loop that tunes an internal analytics agent.

**The headline:** In Pinterest's tests, coding agents decided correctly whether to load a repo skill only **73%** (Codex) and **62%** (Claude) of the time at baseline. An automated tuning loop took an analytics agent to **89.3%**, but **10.3%** of cases flipped verdict between identical runs.

## Practitioner sources

- 🟢 **[How Pinterest Improved Analytics Agent Compliance with Loop Engineering](https://medium.com/pinterest-engineering/how-pinterest-improved-analytics-agent-compliance-with-loop-engineering-d3c52d0abaa2)** — Skyler Zheng et al., 2026-11
  An automated loop that tunes an internal agent's prompts, skills and tools, with paired required and skip test suites, a regression guard, an anti-overfitting critic and a shrinking edit budget. Each fresh session gets a structured handoff, and the first run reached 89.3%, but most of the gain came from the first change and 10.3% of cases flipped verdict between runs.
  Tags: `evals`, `self-improvement`, `memory`

- **[An Engineer's Guide to Better AI Skills: Implementing a Testing Process to Optimize Agent Performance in Any Repository or Skill](https://medium.com/pinterest-engineering/an-engineers-guide-to-better-ai-skills-implementing-a-testing-process-to-optimize-agent-a000c9c9abcd)** — Daniel Reed, 2026-05
  A small Bash harness that tests whether Codex and Claude Code load a repo skill, using 15 positive and 5 negative prompts run 5 times each. Combining every fix took Codex to 95% but left Claude at 69%, below the 73% one change alone reached, and explicit, verbose prompts stayed the most reliable lever.
  Tags: `skills`, `evals`, `agents-md`

## Related

- [Evals & QA](../topics/evals-qa.md)
- [Internal tooling & agent harnesses](../topics/harnesses.md)

## What's still missing here

Both posts test agent behavior. Pinterest has not published org-level numbers on coding-agent use; its "Becoming an AI Team" post (2026-09) is a manager essay with estimated figures. The loop post tested one model and used an LLM labeler that was never calibrated against humans.

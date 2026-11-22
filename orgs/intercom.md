# Intercom (Fin)

> Intercom set one productivity target for all of R&D, hit it, and keeps publishing the side effects. Fin is Intercom's AI agent, and the engineering posts live on ideas.fin.ai. They are among the most candid on review, skills and cost.

**The headline:** Merged PRs per R&D head doubled in **nine months** and reached about **3x in 16 months**. **93.6% of PRs** are agent-driven, and **19.2%** of merged PRs are auto-approved with no human reviewer.

## Practitioner sources

- 🟢 **[2x – nine months later: We did it](https://ideas.fin.ai/p/2x-nine-months-later)** — Darragh Curran, 2026-04
  The clearest org-scale account of running on one metric: merged PRs divided by all R&D headcount, from IC engineers to the VP of product design. It reports the side effects next to the win: static-analysis code quality fell as AI use grew, with only an early sign of recovery, and the top 5% of engineers produce more than 6x the median.
  Tags: `metrics`, `org-rollout`, `code-quality`

- 🟢 **[AI is approving our pull requests: Here's how we made it safe](https://ideas.fin.ai/p/ai-is-approving-our-pull-requests)** — Kesha, Niamh Young, 2026-04
  How an AI reviewer was allowed to approve PRs with no human: review splits into independent sub-agents (problem statement, diff-to-intent, safety, logic, best practices), large PRs go back to be split, every decision is logged, and auditors came in early. 497 PRs went through fully autonomously in the first four weeks, and AI-authored backend code had a 0.53% revert rate against 5.39% for human-authored code.
  Tags: `code-review`, `auto-approval`, `compliance`

- **[Webinar Q&A: How Fin 3x'd R&D output in 16 months](https://ideas.fin.ai/p/webinar-q-and-a-how-fin-3xd-r-and)** — Darragh Curran, 2026-05
  72 answered questions on skills governance, fully loaded cost per PR, the review agent and what went wrong. A skill is promoted to the base plugin at 50 weekly active users, hooks inject skills because system-prompt reminders were unreliable, and one agent pushed hundreds of thousands of changes to the Rails monolith and broke the repo.
  Tags: `skills`, `code-review`, `lessons`

- **[Claude Code: Good skills, bad skills](https://ideas.fin.ai/p/claude-code-good-skills-bad-skills)** — Brian Scanlan, 2026-07
  A central skills repo in practice: 267 skills from 153 contributors (31% of R&D), with a public subset at github.com/intercom/2x-skills. Good skills do one thing, script the deterministic parts and keep evals and owners, and a 7-category review rubric plus hooks that force a skill to load (for example before Snowflake queries) keep the rest in line.
  Tags: `skills`, `hooks`, `governance`

- **[How we use Claude Code today at Intercom](https://ideas.fin.ai/p/how-we-use-claude-code-today-at-intercom)** — Brian Scanlan, 2026-03
  The best public example of enforcing agent rules mechanically. A PreToolUse hook blocks raw `gh pr create` unless the create-pr skill ran, another hook blocks all changes to merged PR branches, and a weekly GitHub Action fact-checks every CLAUDE.md; 13 plugins and 100+ skills ship to Macs through JAMF.
  Tags: `hooks`, `enforcement`, `skills`

- **[How eight people hold the bar for 200+ builders](https://ideas.fin.ai/p/how-eight-people-hold-the-bar-for)** — Clíona de Róiste, 2026-07
  A small frontend platform team encodes its conventions as auto-installed skills and a design-system knowledge base. With it, 96% of the components agents reached for existed in the design system (7% without), and the team says a quarter of pages still use wrong props and there is no reliable judge yet for design-guidance compliance.
  Tags: `platform-team`, `design-systems`, `evals`

- **[Context management is an underrated habit](https://ideas.fin.ai/p/context-management-is-an-underrated)** — Akshay Katyal, 2026-10
  Org-level context hygiene for Claude Code: Fin auto-compacts at 320,000 tokens and nudges at 200,000 context tokens, $75 of session cost or 100 prompts. The advice is to compact by hand at stopping points and run about one subagent per PR. Borderline: practical thresholds, but the author says the benefits are anecdotal.
  Tags: `context`, `memory`, `cost`, `borderline`

## Related

- [Code review & PR workflow](../topics/code-review.md)
- [Metrics that hold up](../topics/metrics.md)
- [Internal tooling & agent harnesses](../topics/harnesses.md)
- [Memory and context](../topics/memory-and-context.md)
- [Adoption and rollout](../topics/adoption-rollout.md)
- [Brian Scanlan](../people/brian-scanlan.md): author of the skills and hooks posts

## What's still missing here

Intercom says code quality fell as AI use grew, but there is no full write-up of how it measures quality, or of the Stanford code-quality study that came up in a DX talk summary. A judge for design-guidance compliance is also still open.

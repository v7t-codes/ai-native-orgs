# Vercel

> Vercel's engineers publish controlled evals on how agents use software and project docs, and the Next.js team has shown agent triage at open-source scale.

**The headline:** In Vercel's evals, an 8KB docs index in AGENTS.md scored **100%** on Next.js 16 APIs, against **79%** for the best skill setup. A research agent helped the Next.js team close **1,462 issues** in about three weeks.

## Practitioner sources

- 🟢 **[AGENTS.md outperforms skills in our agent evals](https://vercel.com/blog/agents-md-outperforms-skills-in-our-agent-evals)** — Jude Gao, 2026-01
  One of the few controlled evals on how to give agents project knowledge: an 8KB docs index in AGENTS.md hit 100% on Next.js 16 APIs absent from training data. Skills peaked at 79% with explicit instructions and were never invoked in 56% of cases, and small changes in instruction wording changed what the agent missed.
  Tags: `agents-md`, `skills`, `evals`

- **[How we closed 1,500 GitHub issues in one month](https://nextjs.org/blog/how-we-closed-1500-github-issues)** — Marcos Hernanz, 2026-09
  A safe pattern for agent triage: a read-only research agent reproduces each issue across versions in a sandbox and returns structured confidence, humans work the queue, and the agent ignores instructions found in issue text. The backlog went from 2,244 to under 1,000, and auto-close now starts at up to 25 issues a week.
  Tags: `triage`, `oss`, `security`

- **[Agents are users, so your software needs evals](https://vercel.com/blog/agent-evals)** — George Fahmy, Yury Selivanov, 2026-11
  A worked eval setup for software that agents use, which separates pass@k (can it do this at all) from pass^k (can I rely on it): 3 of 5 trials passing gives about 99% pass@5 and about 8% pass^5, assuming independent trials. The first run scored 0% because agents never found the tool, and for Codex 9 of 10 "impossible request" passes were the agent giving up without looking.
  Tags: `evals`, `agent-ux`, `verification`

## Related

- [Evals & QA](../topics/evals-qa.md)
- [Memory and context](../topics/memory-and-context.md)

## What's still missing here

These are team-level posts. None of them covers how agents changed Vercel's own engineering org, such as agent PR share, review load or incidents.

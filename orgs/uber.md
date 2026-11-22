# Uber

> Uber publishes the most detailed numbers on what an agent-heavy engineering org costs to run, and it has taken the same agents into business teams.

**The headline:** **70%+ of PRs** are attributed to local or cloud agents. From February to August 2026, weekly active users grew **7x** while total AI spend stayed roughly flat from April, and cost per session fell **52%** from its June peak.

## Practitioner sources

- 🟢 **[Running a Software Factory Efficiently at Uber Scale](https://www.uber.com/us/en/blog/efficient-software-factory/)** — Uday Kiran Medisetty, 2026-08
  Uber splits agent spend into terms that multiply together and holds the model fixed to see what its own changes saved: cost per session fell 52% from the June peak. The levers are named: a cheaper default subagent model, auto-compaction at 400k tokens, a Medium reasoning default, a 1h prompt cache, and loading tools on demand through CLI and tool search (preloading MCP schemas cost 50-70k tokens with 100+ tools).
  Tags: `cost`, `metrics`, `harnesses`

- **[Agentic AI at Uber beyond engineering: Agentic Pods](https://x.com/praveenTweets/status/2074605343439810922)** — Praveen Neppalli Naga, 2026-07
  A repeatable format for taking agents past engineering: AI-proficient engineers pair with business experts for 10-day sprints (shadow, prioritize, build, validate, ship). Uber ran 16 pods across 16 business functions in two months, and capital allocation across 150 cities went from 15 hours to 30 minutes. Borderline: CTO post with self-reported outcomes and no method detail.
  Tags: `adoption`, `org-rollout`, `borderline`

## Voices to follow

- **[@praveenTweets](https://x.com/praveenTweets)** — Praveen Neppalli Naga, Uber SVP and CTO

## Related

- [Metrics that hold up](../topics/metrics.md)
- [Adoption and rollout](../topics/adoption-rollout.md)
- [Internal tooling & agent harnesses](../topics/harnesses.md)

## What's still missing here

Uber has talked at conferences about agent-driven migrations (Shepherd, Fox), but there is no primary blog post yet, only session listings and secondary summaries. The software factory post also mentions an AI Context Graph of 24M nodes and 80M edges. A dedicated write-up on how that graph is built and kept fresh would help.

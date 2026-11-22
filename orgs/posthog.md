# PostHog

> PostHog publishes throughput next to the quality signals that go with it, and shares the actual skill files behind its review setup.

**The headline:** Monthly PRs went from **1,441 to 4,725** between January and June 2026 while engineering headcount grew about 10%. Reverts were **0.2%** in June (9 of 4,868 merged PRs).

## Practitioner sources

- 🟢 **[10,000 PRs a month is easy: How devex is evolving at PostHog](https://x.com/posthog/status/2083231950744244360)** — Paul D'Ambra, 2026-07
  Throughput with its quality signals: agent-opened PRs went from about 20% to about 70% in four months, while p50 PR size grew from 120 to 144 lines and reverts were 0.2% in June. StampHog, an auto-approver built from deterministic checks plus an LLM, approves about 20% of PRs for about $300 a month in tokens, and merge queues became necessary once passing PRs started breaking main together.
  Tags: `metrics`, `code-review`, `ci`

- **[Stop being the code review bottleneck](https://x.com/posthog/status/2075645235724767739)** — Jinay Yoon, 2026-07
  A how-to for cutting human review load, with links to the SKILL.md files: the agent that wrote the code never reviews it, a qa-swarm runs several reviewers, and prompts cap each PR at 400 changed lines. StampHog only stamps PRs under 500 lines and 20 files that avoid a deny list (auth, secrets, billing, public APIs), and it handled 1.6k PRs on its own in a month.
  Tags: `code-review`, `skills`, `auto-approval`

## Voices to follow

- **[@posthog](https://x.com/posthog)** — PostHog's account, where these engineering articles are published

## Related

- [Code review & PR workflow](../topics/code-review.md)
- [Metrics that hold up](../topics/metrics.md)

## What's still missing here

PostHog reports reverts and PR size. It has not reported incidents tied to auto-approved PRs, or how often StampHog approves a change it should have held back.

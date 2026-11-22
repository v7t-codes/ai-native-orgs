# Cognition

> Cognition builds Devin and writes about multi-agent design from production use, including where its own earlier advice changed.

**The headline:** Devin Review catches about **2 bugs per PR**, roughly **58%** of them severe. A pricier lead model that delegated early ran **54% cheaper** than the same model working alone, at almost the same score.

## Practitioner sources

- 🟢 **[Multi-Agents: What's Actually Working](https://cognition.com/blog/multi-agents-working)** — Walden Yan, 2026-04
  The author's follow-up to "Don't Build Multi-Agents": multi-agent setups now work when writes stay single-threaded and the extra agents add intelligence, as a clean-context reviewer, a smarter model consulted for planning, or manager-child delegation. Devin Review catches about 2 bugs per PR (58% severe), while parallel writer swarms still see little real adoption and parent agents still wrongly assume they share state with their children.
  Tags: `multi-agent`, `code-review`, `harnesses`

- **[Verifying Agentic Development at Scale](https://cognition.com/blog/testing-development)** — Ido Pesok, 2026-05
  How Devin tests its own PRs end to end with computer use: a test plan grounded in source comes first, assertions are marked passed, failed or untested, and a deterministic login script lives in the repo as a skill. Approved test runs per day more than doubled in a couple of months, and early failures included over-testing, stalling in setup and forcing UI states with JavaScript.
  Tags: `verification`, `testing`, `computer-use`

- **[Making Fable Cheaper Than Opus](https://cognition.com/blog/making-fable-cheaper-than-opus)** — Joon Hee Lee, 2026-07
  Across 3,000 sessions, a pricier lead model that delegated early with tight briefs was cheaper overall: Fable 5 plus a sidekick scored 60.7 at $1.86 per run against 60.8 at $4.03 alone. In 81% of Fable-led runs the lead never edited code, and forcing Opus to delegate more tended to lower its score.
  Tags: `cost`, `multi-agent`, `harnesses`

## Related

- [Internal tooling & agent harnesses](../topics/harnesses.md)
- [Code review & PR workflow](../topics/code-review.md)
- [Metrics that hold up](../topics/metrics.md)
- [Replit](replit.md): its harness post benchmarks a similar sidekick design

## What's still missing here

There is no recent post on how Cognition uses Devin internally (the latest found is from February 2026), and no 2026 engineering update on DeepWiki or SWE-grep. Its COBOL modernization post (2026-04) is team-bylined and vendor-framed.

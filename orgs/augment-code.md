# Augment Code

> Augment Code sells coding agents and has written up both its own software factory and a rebuild of its CLI on the Pi harness.

**The headline:** Across 17,200 merged PRs from November 2025 to July 2026, median time to merge fell from 11.2 hours to 3.1 hours and the 14-day revert rate from 1.9% to 0.4%. The company calls it a longitudinal case study with no control group.

## Practitioner sources

- 🟢 **[Beyond AI Coding Agents: How We Built Augment's Software Factory](https://www.augmentcode.com/blog/beyond-ai-coding-agents-how-we-built-augments-software-factory)** — Akshay Utture, 2026-09
  Seven agents cover the path from project to incident (Project Builder through Incident Investigator), deployed in the order the bottlenecks showed up, and human touchpoints per PR fell from roughly 10-15 to three. Median time to merge went from 11.2h to 3.1h and 14-day reverts from 1.9% to 0.4%, and the author frames it as a longitudinal case study with the Opus 4.5 rollout as a confounder.
  Tags: `software-factory`, `metrics`, `human-gates`

- **[How we rebuilt the Auggie CLI harness to make tasks 53% cheaper than Claude Code](https://www.augmentcode.com/blog/auggie-cli-harness-rebuild-53-percent-cheaper)** — Tulga Tsogtgerel, Chris Kelly, 2026-08
  Version 1 had a specialized tool for everything; version 2 is a fork of [Mario Zechner's Pi](../people/mario-zechner.md) with bash plus three file tools, because every tool schema is sent on every call, and the context engine moved into Pi's extension system. On SWE-bench Pro (731 instances, Opus 4.7) it cost $927.50 at 61% against $1,970.74 at 61.4% for Claude Code. Borderline: a vendor benchmark against a competitor.
  Tags: `harnesses`, `cost`, `borderline`

## Related

- [SDLC & coding loops](../topics/sdlc-coding.md)
- [Metrics that hold up](../topics/metrics.md)
- [Internal tooling & agent harnesses](../topics/harnesses.md)

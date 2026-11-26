# Walden Yan

Co-founder of Cognition (Devin). Writes about multi-agent design from production use, including where the earlier advice changed.

**Where to follow:**
- X: [@walden_yan](https://x.com/walden_yan)
- Blog: [cognition.com/blog](https://cognition.com/blog)

## Best pieces

- 🟢 **[Don't Build Multi-Agents](https://cognition.ai/blog/dont-build-multi-agents)** — Walden Yan, 2025-06
  Two principles from Cognition's trial and error: share full agent traces instead of single messages, and remember that actions carry implicit decisions, so parallel subagents making conflicting choices produce bad results. The Flappy Bird example (one subagent builds a Mario-style background, another a bird that fits neither) is the standard illustration of the failure.
  Tags: `multi-agent`, `context-engineering`, `foundational`

- 🟢 **[Multi-Agents: What's Actually Working](https://cognition.com/blog/multi-agents-working)** — Walden Yan, 2026-04
  The follow-up: multi-agent setups now work when writes stay single-threaded and the extra agents add intelligence, as a clean-context reviewer, a smarter model consulted for planning, or manager-child delegation. Devin Review catches about 2 bugs per PR (58% severe), while parallel writer swarms still see little real adoption.
  Tags: `multi-agent`, `code-review`, `harnesses`

## Why Walden matters here

The two posts read as a pair: the 2025 rule, then the conditions under which Cognition relaxed it. See [orgs/cognition.md](../orgs/cognition.md) and [harnesses](../topics/harnesses.md).

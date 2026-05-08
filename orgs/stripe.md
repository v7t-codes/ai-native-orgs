# Stripe

> The 2026 anchor data point for what AI-native engineering looks like at scale.

**The headline:** **Minions** — Stripe's internal agent fleet — generated **1,300+ end-to-end PRs/week** in early 2026. Built on a fork of Block's Goose, with Stripe-specific blueprint architecture (deterministic + agentic nodes wired together). Humans still review every Minion PR before merge — agents have submission authority, not merge authority.

## Practitioner sources

- 🟢 **[Minions: Stripe's one-shot, end-to-end coding agents](https://stripe.dev/blog/minions-stripes-one-shot-end-to-end-coding-agents)** — Alistair Gray (Stripe), 2026-02
  The official engineering blog post. Mechanism: agents pick well-scoped tasks from a queue, plan → code → tests → PR end-to-end, humans review before merge. Built on a Goose fork, customized for Stripe's LLM infra.
  Tags: `harnesses`, `pr-workflow`, `metrics`, `must-read`

- **[Minions Part 2](https://stripe.dev/blog/minions-stripes-one-shot-end-to-end-coding-agents-part-2)** — Stripe Engineering
  The follow-up post — what they learned operating Minions in production, what they changed, what they'd do differently.
  Tags: `harnesses`, `lessons`

- **[How Stripe built "minions" (Lenny's Newsletter)](https://www.lennysnewsletter.com/p/how-stripe-built-minionsai-coding)** — Steve Kaliski (Stripe engineer), interviewed by Lenny Rachitsky
  Engineer-bylined interview on how Slack-emoji-reactions trigger PRs and the practical workflow. The non-engineering-blog version of the story.
  Tags: `interview`, `pr-workflow`

- **[Stripe Engineers Deploy Minions (InfoQ)](https://www.infoq.com/news/2026/03/stripe-autonomous-coding-agents/)** — InfoQ
  External coverage with engineer interviews. Useful for the architecture summary.
  Tags: `coverage`, `architecture`

## What Stripe is *not* a great source for (yet)

Reliability and incident-response patterns — most of the public material is about the build side. If you're trying to learn AI-in-prod, look at the [reliability topic](../topics/reliability.md) instead.

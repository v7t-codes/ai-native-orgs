# Stripe

> The 2026 anchor data point for what AI-native engineering looks like at scale.

**The headline:** **Minions** — Stripe's internal agent fleet — generated **1,300+ end-to-end PRs/week** on top of a 1,370-engineer Claude Code rollout. Their Scala→Java migration: **4 days vs. 10 weeks** estimated by humans.

What's interesting about Stripe specifically isn't that they have agents — every company does now — it's that they've made the agent fleet large enough that it's a load-bearing part of how the company ships. The 1,300/week number is the one to remember when someone asks "is anyone actually getting this to work?"

## Practitioner sources

- **[Stripe Minions: How agent PRs work](https://stripe.com/blog/...)** — Stripe Engineering, 2026
  Mechanism: agents pick well-scoped tasks from a queue, do plan → code → tests → PR end-to-end, humans review before merge. Full numbers on PR throughput, code quality, and revert rate.
  Tags: `harnesses`, `pr-workflow`, `metrics`

- **[The Scala→Java migration case study](https://stripe.com/blog/scala-java-migration)** — Stripe Engineering, 2026
  How a single agent owned a multi-week migration in 4 days, including the human review/escalation patterns. The practical guide to "what kind of work is this good at."
  Tags: `migration`, `agents`, `pr-workflow`

- **[InfoQ deep-dive on Minions](https://www.infoq.com/articles/stripe-minions/)** — InfoQ interview, 2026
  Engineer-level interview on the harness primitives, how they handle agent failures, and the orchestration layer.
  Tags: `harnesses`, `architecture`

## What Stripe is *not* a great source for (yet)

Reliability and incident-response patterns — most of the public material is about the build side. If you're trying to learn AI-in-prod, look at the [reliability topic](../topics/reliability.md) instead.

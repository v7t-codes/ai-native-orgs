# Stripe

> The 2026 anchor data point for what AI-native engineering looks like at scale. Later 2026 posts apply the same agents to repeated integration work and language upgrades, and add Kai, an org-wide knowledge agent.

**The headline:** **Minions** — Stripe's internal agent fleet — generated **1,300+ end-to-end PRs/week** in early 2026. Built on a fork of Block's Goose, with Stripe-specific blueprint architecture (deterministic + agentic nodes wired together). Humans still review every Minion PR before merge — agents have submission authority, not merge authority.

## Practitioner sources

### Minions

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

### After Minions: factories, migrations and an org-wide agent

See also: [Harnesses](../topics/harnesses.md), [Legacy modernization](../topics/legacy-modernization.md), [Org-wide personal agents](../topics/orgwide-personal-agents.md)

- 🟢 **[Stripe's Payment Method Factory: Orchestrating agents for repeated, custom integrations](https://stripe.dev/blog/stripes-payment-method-factory-orchestrating-agents-for-repeated-custom-integrations)** — David Dunne, Xenofon Vourliotis, Sai Samant, 2026-09
  The factory cut payment-method integration timelines from up to six months to 2-6 weeks, and in a bake-off vanilla Claude Code took about 20 days of engineering effort where the reusable prompts took 4. An observer agent reads the implementing agent's transcript to harden prompts, and coordination moved into code after an LLM orchestrator proved slow, expensive and unreliable ("predictable coordination is better implemented in code").
  Tags: `harnesses`, `integrations`, `orchestration`

- **[Modern Java at Stripe: Language upgrades as a service](https://stripe.dev/blog/modern-java-at-stripe-language-upgrades-as-a-service)** — Mahib Hosain, Cara Mecozzi, 2026-05
  A migration split between deterministic tooling and agents: AutoJDK computes upgrade eligibility from the live build graph and opens bounded, reviewable PRs, while Minions launched from Slack fix minor failures and an agentic skill runs upgrades across partitions and fixes CI. JDK 17 reached 93%+ service-level adoption within a week of rollout, and some risky targets are skipped on purpose.
  Tags: `legacy-modernization`, `migrations`, `minions`

- **[Meet Stripe's Knowledge AI Platform](https://stripe.dev/blog/meet-stripes-knowledge-ai-platform)** — Anna Mason, Sharadh Krishnamurthy, Anupam Upadhyay, 2026-07
  Kai, an org-wide agent run as a service, reached 83% weekly active users including nearly all of go-to-market, with 1,000+ internal and third-party skills and tools in a shared control plane where domain teams own their skills. It explains why two earlier attempts failed: a no-code builder produced 4,000+ agents of uneven quality, and coding agents for non-engineers raised security concerns and burdened code-quality teams.
  Tags: `personal-agents`, `skills`, `org-rollout`

## What Stripe is *not* a great source for (yet)

Reliability and incident-response patterns — most of the public material is about the build side. If you're trying to learn AI-in-prod, look at the [reliability topic](../topics/reliability.md) instead.

There is no Minions Part 3. The 2026 follow-ups are the integration factory, Java upgrade and Kai posts above.

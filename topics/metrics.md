# Metrics that hold up

> What to measure when AI is generating most of the code. Old SDLC metrics break in interesting ways.

## Practitioner sources

- 🟢 **[Block — Stage-1 to Stage-6 maturity ladder](https://engineering.block.xyz/blog/ai-assisted-development-at-block)** — the framework most teams steal. 95% adoption, largest population at Stage 5 (single agent outside IDE), second-largest at Stage 6 (3–5 agents in parallel).
- 🟢 **[Stripe Minions — PR throughput numbers](https://stripe.dev/blog/minions-stripes-one-shot-end-to-end-coding-agents)** — 1,300+ agent PRs/week as a north star
- **[Mercor × Cognition — APEX-SWE Leaderboard](https://www.mercor.com/blog/introducing-apex-swe/)** — every frontier model fails ~60% of real production tasks; honest data point
- **[Ramp Labs — Latent Briefing token efficiency metrics](https://x.com/RampLabs/status/2042660310851449223)** — 49% median token savings, 65% worker token reduction
- **[OpenAI Codex — 1M LOC, 0% manual code, 0% manual review over 5 months](https://openai.com/index/harness-engineering/)** — extreme but instructive

## Metrics that broke and what people use instead

- **Lines of code / commits per day** → mostly meaningless now. Replaced with *PR throughput*, *revert rate*, *time-to-merge*.
- **Code review velocity** → the new bottleneck. Tracked as *review queue depth*, *human-review-required rate*.
- **Bugs per KLOC** → still useful, but combine with *AI-attributed bug rate* (bugs traceable to agent-generated code).
- **Engineer productivity (any old proxy)** → most teams gave up and now measure *outcomes shipped per quarter* with a flat AI usage assumption.

## What's underexplored

- "Eval drift" — your eval set goes stale faster than you'd think
- Multi-agent metrics — when 5 agents collaborate, whose throughput is it?
- Cost-per-feature when AI inference is a real line item

## Voices

- See [evals-qa.md](evals-qa.md) — many of the same authors

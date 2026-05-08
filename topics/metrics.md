# Metrics that hold up

> What to measure when AI is generating most of the code. Old SDLC metrics break in interesting ways.

## Practitioner sources

- 🟢 **[Block — Stage-1 to Stage-6 maturity ladder](../orgs/block.md)** — the framework most teams steal
- 🟢 **[Stripe Minions — PR throughput numbers](../orgs/stripe.md)** — 1,300+ PRs/week as a north star
- **[APEX-SWE Leaderboard](https://x.com/adarsh_exe/status/...)** — every frontier model fails ~60% of real production tasks; honest data point
- **[Ramp's Latent Briefing — token efficiency metrics](../orgs/ramp.md)** — 49% median token savings, 65% worker token reduction

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

# Replit

> Replit's frontier blog is one of the most open sources on running a production coding agent: how changes get evaluated, how the harness delegates, and how agents are sandboxed.

**The headline:** Replit A/B tests most changes that affect its agent (prompts, tools, harness revisions, model swaps). Its harness scored **72% at $2.11 per task** on DeepSWE v1.1, against **61% at $1.34** for a cheaper single-sidekick design.

## Practitioner sources

- 🟢 **[Closing the loop: Evaluating and improving Replit Agent at scale](https://frontier.replit.com/evaluating-and-improving-agent-at-scale/)** — Daniel Furman et al., 2026-06
  A full eval loop for a production agent: an offline benchmark (ViBench) built from production PRDs, A/B tests that track whether users shipped, clustering of failed runs (Telescope), and an optimization loop that drafts fixes for engineers to approve. It warns that lower cost in an A/B test can mean the agent quietly stopped doing useful work, admits some offline wins regressed real users, and gives no task counts or effect sizes.
  Tags: `evals`, `ab-testing`, `harnesses`, `self-improvement`

- **[Free the models: Harness design at the frontier](https://frontier.replit.com/free-the-models/)** — Daniel Furman et al., 2026-09
  Replit argues against model routers and forced subagent spawning: its core loop picks subagent tier, effort and hand-offs mid-turn. Delegation differs by model (GPT-6 Astra hands work to general workers in 20% of turns, Fable 5 in 0.9%), and the design scored 72% at $2.11 per task on DeepSWE v1.1 against 61% at $1.34 for a cheaper sidekick setup.
  Tags: `harnesses`, `multi-agent`, `cost`

- **[Throwing Headcount at the Problem: Why agent swarms get better at optimizing code as they grow](https://frontier.replit.com/throwing-headcount-at-the-problem/)** — Vaibhav Kumar et al., 2026-11
  Measured scaling of swarms of 1, 8, 16 and 32 full agents on real performance work: one Opus 5.5 agent made the NumPy workloads 3.7x faster in two hours, and 32 agents reached about 18.9x. How a swarm coordinated mattered more than solo model strength; GPT-6.2 Astra was the strongest solo agent, yet at 32 agents its swarms fell below its solo score on three tasks.
  Tags: `multi-agent`, `performance`, `evals`

- **[Agent Habitat Architecture](https://frontier.replit.com/agent-habitat-architecture/)** — Luis Hector Chavez, Manish Mehta, 2026-10
  A reference security architecture for agent sandboxes: a broker as the only path to the network, a microVM as the floor, required negative tests (DNS tunneling, ICMP, IPv6, cloud metadata, direct IP) and side effects journaled with idempotency keys. Each control is tied to a real incident, such as a sandbox DNS resolver that bypassed a web proxy; the post presents it as a proposed architecture.
  Tags: `security`, `sandboxes`

## Voices to follow

- **[@pirroh](https://x.com/pirroh)** — Michele Catasta, President of Replit

## Related

- [Evals & QA](../topics/evals-qa.md)
- [Internal tooling & agent harnesses](../topics/harnesses.md)
- [Security](../topics/security.md)
- [Cognition](cognition.md): another measured study of a lead model plus a sidekick

## What's still missing here

Replit says offline wins sometimes regressed real users, and no published measure was found of how well offline eval scores predict online outcomes, at Replit or elsewhere. The habitat post is a proposal; a write-up of the sandbox Replit runs in production would be stronger.

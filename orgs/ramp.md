# Ramp / Ramp Labs

> Probably the most public AI-native engineering org outside the AI labs themselves. Publishes real research alongside production internal tools.

**The headline:** **Ramp Inspect** — internal review/PR system where **>50% of PRs are agent-originated**, with humans reviewing before merge. Plus **Latent Briefing** — Ramp Labs research on KV cache compaction for multi-agent systems.

Ramp is interesting because they treat AI-native engineering as a research org adjacent to the product org. Ramp Labs publishes papers and open notes; the product side ships tools that use those primitives. The two-sided thing is rare.

## Practitioner sources

- 🟢 **[Latent Briefing: Efficient Memory Sharing for Multi-Agent Systems via KV Cache Compaction](https://x.com/RampLabs/status/2042660310851449223)** — Ben Geist (Ramp Labs), 2026-04
  Three modifications on the AM Compaction Framework: task-guided query vectors, shared global token selection, MAD-normalized thresholding. Real numbers — 49% median token savings on 32k–100k token docs, 65% reduction in worker token consumption, ~1.7s overhead vs 30s for vanilla AM. Honest about limits (single benchmark, orchestrator variance).
  Tags: `harnesses`, `multi-agent`, `kv-cache`, `research`

- **[Ramp Inspect — how the agent-PR fleet works](https://ramp.com/blog/...)** — Ramp Engineering
  The core loop: agent picks a ticket, does plan/code/tests, opens a PR; human reviews. Specifics on what kind of work routes to agent vs human.
  Tags: `pr-workflow`, `harnesses`

- **[AI Software Factories — DataDrivenNYC talk](https://x.com/mattturck/status/2051708647865020870)** — Aaron Levitator (Ramp Labs), 2026-05
  The shift from writing code to maintaining code as the primary engineering activity. Demo of code self-maintaining software.
  Tags: `talks`, `architecture`

- **[Ramp Labs blog](https://ramplabs.com/)** — Ramp Labs
  Catch-all. Most posts are practitioner-grade; skip the founder-letter style ones.
  Tags: `index`

## Voices to follow

- **[@b_geist](https://x.com/b_geist)** — Ben Geist, Ramp Labs research engineer
- **[@a_levitator](https://x.com/a_levitator)** — Aaron Levitator, Ramp Labs
- **[@RampLabs](https://x.com/RampLabs)** — the org account, generally substantive

# Ramp / Ramp Labs

> Probably the most public AI-native engineering org outside the AI labs themselves. Publishes real research alongside production internal tools. By June 2026, 76.5% of PRs merged over six months had been created with Inspect, its background coding agent.

**The headline:** **Ramp Inspect** — internal review/PR system where **>50% of PRs are agent-originated**, with humans reviewing before merge. Plus **Glass**, the AI workspace every employee gets, with **Dojo**, a Git-backed marketplace of 350+ shared skills. Plus **Latent Briefing** — Ramp Labs research on KV cache compaction for multi-agent systems.

Ramp is interesting because they treat AI-native engineering as a research org adjacent to the product org. Ramp Labs publishes papers and open notes; the product side ships tools that use those primitives. The two-sided thing is rare.

## Practitioner sources

- 🟢 **[Latent Briefing: Efficient Memory Sharing for Multi-Agent Systems via KV Cache Compaction](https://x.com/RampLabs/status/2042660310851449223)** — Ben Geist (Ramp Labs), 2026-04
  Three modifications on the AM Compaction Framework: task-guided query vectors, shared global token selection, MAD-normalized thresholding. Real numbers — 49% median token savings on 32k–100k token docs, 65% reduction in worker token consumption, ~1.7s overhead vs 30s for vanilla AM. Honest about limits (single benchmark, orchestrator variance).
  Tags: `harnesses`, `multi-agent`, `kv-cache`, `research`

- 🟢 **[We Built Every Employee at Ramp Their Own AI Coworker](https://x.com/sebgoddijn/status/2042285915435937816)** — Seb Goddijn, 2026-04
  Why Ramp built Glass after reaching 99% adoption of AI tools and finding most people stuck on setup. One Okta sign-in connects every internal tool on day one. Skills are shared through Dojo, a marketplace of 350+ skills that are Git-backed, versioned and reviewed like code, and a recommender called Sensei picks the five most useful for a new hire's role and tools. A pipeline updates each user's memory every 24 hours from past sessions and connected tools. Ramp's main lesson is that the people who got the most value installed a skill on day one and got a result straight away, more than those who attended training.
  Tags: `skills`, `adoption`, `memory`, `org-rollout`

- **[Introducing Glass: Learn things once](https://ramp.com/blog/introducing-glass)** — Eric Glyman, 2026-10
  The external launch of Glass, with Ramp-reported numbers: 323 employees (PMs, CX agents, salespeople, marketers, analysts) have made 6,500+ edits to what Glass knows, and a saved prompt that pulls feature requests from customer calls took capture from about 300 a month by hand to 20,000. Ramp burned $1.5M in tokens in one week in May; Glass now puts a cost meter on every project, and moving Ramp's own work onto Ramp Router cut its bill by 30%. Borderline: a CEO launch post, with numbers that are not independently measured.
  Tags: `adoption`, `cost`, `skills`, `borderline`

- **[AI Software Factories — DataDrivenNYC talk](https://x.com/mattturck/status/2051708647865020870)** — Aaron Levitator (Ramp Labs), 2026-05
  The shift from writing code to maintaining code as the primary engineering activity. Demo of code self-maintaining software.
  Tags: `talks`, `architecture`

- **[Inspect at Scale](https://x.com/_dylanga/status/2067999346780524753)** — Dylan Garcia, 2026-06
  Adoption, latency and cost numbers for Inspect: 76.5% of PRs merged over six months were created with it, and sandbox time-to-interactive fell from about 6.5s to 2s. It also reports a failed token-compression experiment, where the tokens saved were offset by the model retrying commands it no longer recognised.
  Tags: `background-agents`, `metrics`, `cost`

- **[How we built OCA, our AI on-call assistant](https://builders.ramp.com/post/how-we-built-oca-our-ai-on-call-assistant)** — Richard Marmorstein, Austin Ray, 2026-09
  An incident agent built from Claude Code or Codex in a monorepo checkout and run on Temporal, which assisted with 575 of 1,220 merged incident-fix PRs in four weeks. Hooks that demanded proof of compliance caused retry loops, so the team switched to one-shot detours, and memory indexed by monitor, team and service sped up investigations without moving ratings.
  Tags: `reliability`, `on-call`, `harnesses`, `memory`

- **[Building LLM Judges to Judge LLMs](https://builders.ramp.com/post/building-llm-judges-to-judge-llms)** — Sachet Bangia, Shaiyon Hariri, 2026-11
  An internal coding benchmark built from Inspect sessions that ended in merged PRs, used to guide token spend. The tests shipped with those PRs were over- or under-specified, and splitting "find the differences" from "judge whether they matter" raised agreement between two model judges from 54.2% to 76.4% on first vote and 93.6% after deliberation.
  Tags: `evals`, `llm-judges`, `benchmarks`

- **[Ramp Builders](https://builders.ramp.com/)** — Ramp engineering blog index
  Catch-all. Most posts are practitioner-grade; skip the founder-letter style ones.
  Tags: `index`

## Voices to follow

- **[@b_geist](https://x.com/b_geist)** — Ben Geist, Ramp Labs research engineer
- **[@a_levitator](https://x.com/a_levitator)** — Aaron Levitator, Ramp Labs
- **[@RampLabs](https://x.com/RampLabs)** — the org account, generally substantive
- **[@_dylanga](https://x.com/_dylanga)** — Dylan Garcia, Senior Staff Engineer on Inspect
- **[@sebgoddijn](https://x.com/sebgoddijn)** — Seb Goddijn, built Glass at Ramp

## What's still missing here

- A write-up on builders.ramp.com of how Inspect is built, with current adoption numbers. The latest numbers are in an X article.
- A primary engineering source on total token spend and how it is budgeted.

# Foundational reading

> The pieces that frame the whole space. Read these once even if you only care about one specific topic. The newest additions are field-wide evidence on what agents do to commits, review time and what actually ships.

## Reasoning, models, and where this is all going

- 🟢 **[Lilian Weng — Why We Think](https://lilianweng.github.io/posts/2025-05-01-thinking/)** — the serious technical look at how LLMs reason. Test-time compute, chain-of-thought, latent thoughts, why "more thinking time" works (or doesn't). 40-minute read.
  Tags: `reasoning`, `inference`

- **[Eric Jang — As Rocks May Think](https://evjang.com/2026/02/04/rocks.html)** — interactive essay on thinking models, automated research, where they're headed. Title is a Vannevar Bush homage.
  Tags: `essay`, `research-direction`

- 🟢 **[Karpathy on the AI-native dev shift](https://x.com/karpathy/status/2015883857489522876)** — "Easily the biggest change to my basic coding workflow in 2 decades."
  Tags: `cultural-inflection`

## The harness vocabulary

- 🟢 [Anthropic — Effective harnesses for long-running agents](../orgs/anthropic.md)
- 🟢 [OpenAI — Harness engineering: leveraging Codex in an agent-first world](../orgs/openai.md)

## The "is anyone actually shipping" data

- 🟢 [Stripe Minions](../orgs/stripe.md) — yes, at fleet scale (1,300+ PRs/week)
- 🟢 [Ramp Inspect + Latent Briefing](../orgs/ramp.md) — yes, with research
- [Mercor × Cognition — APEX-SWE Leaderboard](https://www.mercor.com/blog/introducing-apex-swe/) — and honestly, still failing ~60% of real tasks

- **[MIT / Wharton / BU — Writing Code vs. Shipping Code: Productivity Effects Across Generations of AI Coding Tools](https://www.mertdemirer.com/Papers/Demirer_Writing_vs_shipping_code.pdf)** — Mert Demirer, Leon Musolff, Liyuan Yang, 2026-09
  Using public GitHub activity plus internal Microsoft telemetry, commit gains build from 30% (autocomplete) to 180% (plus sync agents) and 240% (plus async agents), but the 240% shrinks to 80% for projects and 30% for releases. Developers who adopt sync agents add 7.0x as many lines but delete 12.2x as many, so commit counts overstate what ships.
  Tags: `evidence`, `productivity`, `research`

- **[Harvard (Jellyfish data) — Artificial Intelligence in the Firm: Bottlenecks in Software Production](https://fion.ac/jellyfish.pdf)** — Fiona Chen, James Stratton, 2026-11
  A staggered difference-in-differences study of 655 firms (445M work events) finds coding agents raise PRs about 36% but resolved Jira issues only about 14%, and points to review as the constraint: time from review submission to merge rises 56.1%. The employment effect of agents so far is -2.6% and not significant; the paper has not been peer reviewed.
  Tags: `evidence`, `review-bottleneck`, `research`

- **[GitHub — Octoverse: Commits, pushes reach new highs in 2026 as developers build with agents](https://github.blog/news-insights/octoverse/octoverse-commits-pushes-reach-new-highs-in-2026-as-developers-build-with-agents/)** — GitHub Staff, 2026-10
  GitHub's platform-wide count: more than 40% of PRs started with an agent's first draft by September 2026, up from 17% in March, and agent-involved PRs merged within two weeks at 90% against about 86% for others. GitHub calls its agent detection "a floor" and gives no data on defects, reverts or security incidents. Borderline: corporate data report with a staff byline, included as first-party platform data.
  Tags: `evidence`, `adoption`, `borderline`

## The cultural inflection points

- 🟢 [Karpathy's CLAUDE.md / agent coding shift](https://x.com/karpathy/status/2015883857489522876) — Jan 2026
- 🟢 [Tobi Lütke — "Reflexive AI usage is now a baseline expectation"](https://x.com/tobi/status/1909251946235437514) — Apr 2025

## Multi-agent setups that work today

- **[Cognition — Multi-Agents: What's Actually Working](https://cognition.com/blog/multi-agents-working)** — Walden Yan, 2026-04
  The author's follow-up to "Don't Build Multi-Agents": multi-agent systems work best today when writes stay single-threaded and extra agents add intelligence, as a clean-context reviewer, a "smart friend" model for planning, or a manager that delegates to child agents ("map-reduce-and-manage"). Parallel writer swarms still see little real adoption, and parent agents wrongly assume they share state with their children.
  Tags: `multi-agent`, `agent-architecture`

## What's still missing here

- A randomized trial of agents on real work. The strongest evidence so far (Chen and Stratton, Demirer et al.) is quasi-experimental and comes from working papers.
- Field-wide quality data. Octoverse counts agent PRs and merge rates and has no defect, revert or incident numbers.
- Evidence on parallel writer agents in day-to-day production work. Cognition reports they still see little real adoption.

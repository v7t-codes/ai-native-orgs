# SDLC & coding loops

> How code gets written and shipped once agents write most of it. The inner loop has moved out of the editor into background and cloud agents. The 2026 write-ups agree on what that takes: a repo agents can run on their own, checks they can pass without a human, and a plan for where the bottleneck moves next.

## What the best teams converged on

- **Make the repo runnable by agents first.** Cursor gave agents one CLI for starting services and a Cloud Doctor automation that fixes broken setup. Shopify built device-free business logic and a CLI that loads screens in milliseconds before migrating any screens. Will Larson modernized CI/CD and feature flags as a prerequisite.
- **Expect the bottleneck to move.** Augment deployed its agents in the order the bottlenecks showed up. Larson lists his in sequence and concludes the real limit was PR quality. PostHog needed merge queues once passing PRs started breaking main together.
- **Turn repeated corrections into durable rules.** Meta makes any mistake repeated more than twice into a permanent rule. Shopify's agent turns each day's review comments into skill updates. Stripe feeds transcripts and PR comments into prompt updates after every integration.
- **Limit what an agent can do alone.** Vercel's triage agent cannot comment on or close issues by itself. OpenAI's Sevbot never applies a mitigation on its own. Stripe moved coordination into code after an LLM orchestrator proved slow and sometimes did steps itself.
- **Report quality next to throughput.** PostHog publishes a 0.2% revert rate next to its PR counts, Augment reports 14-day reverts, and Addy Osmani says to measure cycle time, reverts and rework and calls % AI-written code not a useful goal.

## Practitioner sources

- 🟢 **[Karpathy — "80% agent coding and 20% edits+touchups"](https://x.com/karpathy/status/2015883857489522876)** — Andrej Karpathy, 2026-01
  The cultural inflection — going from 80/20 manual+autocomplete to 80/20 agent coding. Spawned a derivative CLAUDE.md repo with 100K+ stars.
  Tags: `cultural-inflection`, `claude-code`

- 🟢 **[Boris Cherny — Vanilla Claude Code setup](https://x.com/bcherny/status/2007179832300581177)** — Boris Cherny (Anthropic, Claude Code creator)
  Counter-thesis: simpler is better. Single CLAUDE.md per repo, slash commands for inner loops, Plan mode → auto-accept edits, Opus 4.5 with thinking. No fancy harness, no orchestration.
  Tags: `claude-code`, `simplicity`

- **[Simon Willison — Agentic Engineering Patterns](https://simonwillison.net/guides/agentic-engineering-patterns/)** — Simon Willison
  Multi-chapter pattern catalog. "Hoard things you know how to do," "Writing code is cheap now," and chapters on cognitive debt are particularly useful.
  Tags: `patterns`, `practitioner-bylined`

- **[Gergely Orosz — When AI writes almost all code](https://newsletter.pragmaticengineer.com/p/when-ai-writes-almost-all-code-what)** — Gergely Orosz, 2026-01
  What changes for engineering managers when 80%+ of code is AI-generated. Personal account from his winter break.
  Tags: `engineering-management`, `velocity`

### Software factories at company scale

- 🟢 **[Augment Code — Beyond AI Coding Agents: How We Built Augment's Software Factory](https://www.augmentcode.com/blog/beyond-ai-coding-agents-how-we-built-augments-software-factory)** — Akshay Utture, 2026-09
  Seven agents cover the path from project to incident (Project Builder through Incident Investigator), deployed in the order the bottlenecks showed up, and human touchpoints per PR fell from roughly 10-15 to three. Median time to merge went from 11.2h to 3.1h and 14-day reverts from 1.9% to 0.4%, and the author frames it as a longitudinal case study with the Opus 4.5 rollout as a confounder.
  Tags: `software-factory`, `metrics`, `human-gates`

- **[Uber — Running a Software Factory Efficiently at Uber Scale](https://www.uber.com/us/en/blog/efficient-software-factory/)** — Uday Kiran Medisetty, 2026-08
  A detailed account of agent cost per unit of work at scale. With 70%+ of PRs attributed to agents and the model held fixed, cost per session fell 52% from its June peak through plain defaults: a cheaper subagent model, auto-compaction at 400k tokens, Medium reasoning and on-demand tool search.
  Tags: `software-factory`, `cost`, `context`

- **[OpenAI — Inside OpenAI's agentic software factory](https://newsletter.pragmaticengineer.com/p/openai-software-factory)** — Gergely Orosz, 2026-09 (paywalled)
  Seven named OpenAI engineering leads describe the pipeline: review by domain-specialist agents, changes classified by risk, opt-in auto-approval for low-risk areas, and a deploy agent told to "Handhold this change until it is safely and fully rolled out into production." Some systems saw "roughly a 10x increase in load," and Codex use on non-engineering teams went from about 0% to 90% in four months.
  Tags: `software-factory`, `deploy-agents`, `paywalled`

- **[Stripe — Stripe's Payment Method Factory: Orchestrating agents for repeated, custom integrations](https://stripe.dev/blog/stripes-payment-method-factory-orchestrating-agents-for-repeated-custom-integrations)** — David Dunne, Xenofon Vourliotis, Sai Samant, 2026-09
  Repeated integration work run as a factory: reusable prompts, an observer agent that reads the implementing agent's transcript to flag wasted investigation and re-learning, and provider API responses snapshotted into contracts. Integration timelines went from up to 6 months to 2-6 weeks. An LLM orchestrator proved slow and expensive, so coordination moved into code: "predictable coordination is better implemented in code."
  Tags: `software-factory`, `orchestration`, `prompts`

- **[PostHog — 10,000 PRs a month is easy: How devex is evolving at PostHog](https://x.com/posthog/status/2083231950744244360)** — Paul D'Ambra, 2026-07
  Monthly PRs went from 1,441 in January to 4,725 in June with about 10% more engineers, and agent-opened PRs from about 20% to 70%, with reverts at 0.2%. It covers the CI work the volume forced (merge queues, a pre-migrated database schema) and StampHog, an auto-approver that clears about 20% of PRs for about $300 a month.
  Tags: `software-factory`, `throughput`, `ci`

- **[Cursor — How we set up our cloud agent environment](https://cursor.com/blog/cloud-agent-environment)** — Mathew Hogan, Arvind Saripalli, 2026-07
  How Cursor made its monorepo runnable by cloud agents, which now write more than half of merged monorepo PRs (about 1 in 10 in December). What worked was a single `anydev` CLI with `--help` on every subcommand and a "Cloud Doctor" automation that reads agent traces and opens PRs to fix setup; skills "only helped on the margins" while the commands themselves stayed convoluted.
  Tags: `cloud-agents`, `dev-environment`, `harnesses`

- **[Vercel — How we closed 1,500 GitHub issues in one month](https://nextjs.org/blog/how-we-closed-1500-github-issues)** — Marcos Hernanz, 2026-09
  The Next.js team ran a research agent over its issue backlog in sandboxes (200 concurrent sessions, about 30 minutes each). The agent ignores instructions found in issue text and cannot comment or close by itself, humans worked the queue, and the backlog fell from 2,244 to under 1,000 while 218 new reports arrived.
  Tags: `triage`, `oss`, `prompt-injection`

- **[Meta — How Meta Built Forum With AI-Native Engineering](https://engineering.fb.com/2026/10/15/ml-applications/how-meta-built-forum-ai-native-engineering/)** — Shengbo Guo et al., 2026-10
  Forum reached core feature parity with Facebook Groups in eight weeks, and a task counted as done only once tests and visual checks passed inside the agent loop. The harness has five parts (rules, skills, agents, commands, hooks), and the main failure, the agent editing the wrong screen or guessing coordinates, was fixed by having it read the live view hierarchy before acting.
  Tags: `verification`, `harnesses`, `mobile`

- **[Shopify — How we rebuilt the Shopify app in 12 weeks](https://shopify.engineering/shopify-app-rebuild)** — Remi Vanhee, 2026-11
  Before migrating any screens, the team built the feedback loop (device-free business logic and a CLI that loads screens in milliseconds), then about 30 engineers in pairs rebuilt a 300+ screen app in 12 weeks. Written specs went out of date almost at once, so the running legacy app became the spec, and an agent turned each day's review comments into updates to skills and Architecture.md.
  Tags: `rewrite`, `verification`, `skills`

- **[Imprint — Shipping 100+ PRs to production in a week](https://lethain.com/passing-100-prs-in-a-week/)** — Will Larson, 2026-11
  Imprint's CTO went from 5-10 to 115 merged PRs a week and lists what he had to fix along the way: CI/CD and feature flags, stale docs that misled agents, an issue tracker agents can write to, a fleet harness for concurrent runs, and verification files that tell him when a full code review is needed. He concludes the real limit was PR quality, and treats the merged-PR count as a number that raises questions.
  Tags: `bottlenecks`, `cloud-agents`, `engineering-management`

- **[Monzo — Building Agent Chip: Monzo's in-house agentic tool](https://monzo.com/blog/building-agent-chip)** — Fabien Deshayes, Oli Haley, 2026-08
  Why a regulated bank built its own harness: each agent runs in an isolated bundle behind one egress proxy that keeps secrets out of reach, models can be swapped during an outage, and Linear, Slack and GitHub events trigger workflows with per-team cost attribution. It reached an MVP in about three weeks and now authors about 10% of merged PRs at 1,800+ tasks a day; engineers still review and merge every PR, and the authors call it "very early".
  Tags: `software-factory`, `harnesses`, `regulated`, `cost-attribution`

### How the engineer's job changes

- **[Anthropic — Your coding agents made you a manager](https://x.com/addyosmani/status/2119332146485891501)** — Addy Osmani, 2026-11
  Ten practices for working with agents, ordered roughly by impact. If the agent keeps ignoring a CLAUDE.md line, make it a hook. Approving a big diff on green tests is "code ratification" ("the unit of review is the unit of comprehension"). Measure cycle time, reverts and rework, since % AI-written code is not a useful goal.
  Tags: `practices`, `hooks`, `claude-code`

- **[HumanLayer — Why Software Factories Fail: Turning the lights back on (part 2)](https://x.com/dexhorthy/status/2081058573556306030)** — Dex Horthy, 2026-07
  A counterweight to lights-out factories. About 40% of tasks one-shot or need light feedback; larger ones go through four planning phases so humans can review and re-steer 100-200 line vertical slices, and he argues for a safe 2-3x speedup. His line: "You don't have too many PRs. You have too many bad PRs."
  Tags: `software-factory`, `planning`, `review`

- **[Amp — How I work with Agents](https://x.com/thorstenball/status/2114386050638336082)** — Thorsten Ball, 2026-10
  An Amp engineer's working rules: give agents tools to deploy, read logs and manage feature flags, test AGENTS.md and skills with blind control-vs-treatment runs, and write "this is not evidence" into AGENTS.md to demand end-to-end proof. He reviews only the fewer than 5 central files, such as database migrations, and treats agent threads linked to commits as team memory.
  Tags: `practices`, `agents-md`, `review-scope`

- **[Microsoft — AI Made Us Faster. That Was the Problem](https://x.com/davidfowl/status/2054084334848790652)** — David Fowler, 2026-05
  Fowler produced what felt like "six months of code in about a week" on Aspire's TypeScript support, then hit a review and understanding gap: "Production got cheaper. Maintenance did not." The public AGENTS.md, the .github/skills folder and human-approved agentic-workflow PRs in the Aspire repos show what an agent-ready open-source repo looks like.
  Tags: `maintenance`, `agents-md`, `open-source`

## Voices

- [Karpathy](../people/karpathy.md)
- [Simon Willison](../people/simon-willison.md)
- [Will Larson](../people/will-larson.md) — [agents-series](https://lethain.com/agents-series/) is gold
- [Boris Cherny](../people/boris-cherny.md)
- [Addy Osmani](../people/addy-osmani.md)
- [Gergely Orosz](../people/gergely-orosz.md)

## Related

- [code-review.md](code-review.md): where the extra PRs land
- [harnesses.md](harnesses.md): the harness pieces behind these factories
- [version-control.md](version-control.md): source control under agent load
- [legacy-modernization.md](legacy-modernization.md): verification-first rewrites and migrations
- [aidlc-and-spec-driven.md](aidlc-and-spec-driven.md): AI-DLC and spec-driven workflows
- [metrics.md](metrics.md) and [adoption-rollout.md](adoption-rollout.md)
- Orgs: [Uber](../orgs/uber.md), [Stripe](../orgs/stripe.md), [OpenAI](../orgs/openai.md), [PostHog](../orgs/posthog.md), [Cursor](../orgs/cursor.md), [Vercel](../orgs/vercel.md), [Meta](../orgs/meta.md), [Shopify](../orgs/shopify.md), [Anthropic](../orgs/anthropic.md), [Microsoft](../orgs/microsoft.md), [Sourcegraph (Amp)](../orgs/sourcegraph.md)

## What's still missing here

- Factory write-ups that report incidents and defects next to throughput. Most posts here use reverts as their only quality signal.
- Controlled comparisons. Almost every number here is one company's before and after. Augment names its confounders and Uber holds the model fixed, and that is as close as it gets.
- Cost per shipped change from anyone besides Uber.
- A write-up of Netflix's QCon SF talk on retrofitting its SDLC for coding agents (2026-11). No published version yet.

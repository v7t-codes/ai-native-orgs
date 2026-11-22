# Metrics that hold up

> What to measure when AI is generating most of the code. Old SDLC metrics break in interesting ways. The 2026 evidence keeps finding one pattern: output counts rise much faster than shipped work. PRs and commits jump, while resolved issues, releases and review wait move more slowly, and cost per task has become a metric of its own.

## Practitioner sources

- 🟢 **[Block — Stage-1 to Stage-6 maturity ladder](https://engineering.block.xyz/blog/ai-assisted-development-at-block)** — the framework most teams steal. 95% adoption, largest population at Stage 5 (single agent outside IDE), second-largest at Stage 6 (3–5 agents in parallel).
- 🟢 **[Stripe Minions — PR throughput numbers](https://stripe.dev/blog/minions-stripes-one-shot-end-to-end-coding-agents)** — 1,300+ agent PRs/week as a north star
- **[Mercor × Cognition — APEX-SWE Leaderboard](https://www.mercor.com/blog/introducing-apex-swe/)** — every frontier model fails ~60% of real production tasks; honest data point
- **[Ramp Labs — Latent Briefing token efficiency metrics](https://x.com/RampLabs/status/2042660310851449223)** — 49% median token savings, 65% worker token reduction
- **[OpenAI Codex — 1M LOC, 0% manual code, 0% manual review over 5 months](https://openai.com/index/harness-engineering/)** — extreme but instructive

### Causal and large-sample studies

- 🟢 **[Harvard — Artificial Intelligence in the Firm: Bottlenecks in Software Production](https://fion.ac/jellyfish.pdf)** — Fiona Chen, James Stratton, 2026-11
  A staggered difference-in-differences study of 655 firms and 445M work events from Jellyfish telemetry: a year after adopting coding agents, PRs rose about 36% while resolved Jira issues rose about 14% (borderline significant). Code review became the constraint, with time from review submission to merge up 56%; it is a job market paper and has not been peer reviewed.
  Tags: `metrics`, `review-bottleneck`, `causal`

- **[MIT / Wharton / BU — Writing Code vs. Shipping Code: Productivity Effects Across Generations of AI Coding Tools](https://www.mertdemirer.com/Papers/Demirer_Writing_vs_shipping_code.pdf)** — Mert Demirer, Leon Musolff, Liyuan Yang, 2026-09
  Across 500,000+ GitHub developers with Microsoft telemetry, cumulative commit gains were 30% (autocomplete), 180% (plus sync agents) and 240% (plus async agents), and the 240% shrinks to 80% for projects and 30% for releases. Most of the gap is experimentation and discarded work: after adopting sync agents, developers add 7.0x as many lines and delete 12.2x as many.
  Tags: `metrics`, `causal`, `shipped-output`

- **[Microsoft — Adoption and Impact of Command-Line AI Coding Agents: A Study of Microsoft's Early 2026 Rollout of Claude Code and GitHub Copilot CLI](https://arxiv.org/abs/2607.01418)** — Emerson Murphy-Hill, Jenna Butler, Alexandra Savelieva, 2026-07
  Over a 16-week rollout to tens of thousands of engineers, adopters merged 24% more PRs (95% CI +14.5% to +33.7%) by synthetic-control estimate, with an associational dose-response from +15.0% at 3 tool-use days a week to +50.1% at 5+. Adoption spread through skip-level peers and managers, and the authors note that merged PRs are an imperfect proxy for value.
  Tags: `metrics`, `rollout`, `causal`

- **[METR — We are Changing our Developer Productivity Experiment Design](https://metr.org/blog/2026-02-24-uplift-update/)** — Joel Becker et al., 2026-02
  The follow-up to METR's 2025 RCT (tasks took ~19% longer with AI) explains why that number is outdated and why a clean RCT broke down: 30-50% of developers withheld tasks they did not want to do without AI, and time tracking fails when people run several agents at once. Late-2025 estimates of task time (-18% for returning developers, -4% for new recruits) both have intervals that include zero, so read this before quoting any AI productivity percentage.
  Tags: `metrics`, `rct`, `methodology`

- **[METR — Independent Assessment of AI R&D Acceleration at Anthropic in October 2026](https://metr.org/blog/2026-11-05-anthropic-ai-rd-acceleration-assessment/)** — Tom Cunningham et al., 2026-11
  An outside measurement of agent speedup inside a frontier lab using LOC, PRs, headcount and inference spend: the internal capability index grew about 1.9x its prior rate since October 2025 (95% CI 1.5-2.8x). METR treats the ~12x self-reported uplift as very loose evidence and notes there is no controlled with-vs-without-AI baseline. Borderline: an outside research org, and Anthropic redacted most of the evidence METR found most informative.
  Tags: `metrics`, `self-report`, `borderline`

### Measuring against your own baseline

- **[Microsoft — Ten Months with Copilot Coding Agent in dotnet/runtime](https://devblogs.microsoft.com/dotnet/ten-months-with-cca-in-dotnet-runtime/)** — Stephen Toub, 2026-03
  Agent PRs measured against human baselines in the same repo: 67.9% of 878 agent PRs merged against 87.1% for Microsoft engineers, with reverts at 0.6% vs 0.8% (not statistically meaningful). Adding an instruction file and unblocking NuGet feeds moved success from 38.1% to 69%, and the breakdowns by task type and review load make it a template for measuring an agent against your own team.
  Tags: `metrics`, `baselines`, `coding-agents`

- **[Intercom — 2x – nine months later: We did it](https://ideas.fin.ai/p/2x-nine-months-later)** — Darragh Curran, 2026-04
  One metric for the whole org (merged PRs divided by all R&D headcount) hit 2x in nine months and about 3x in 16, reported next to its side effects: static-analysis code quality fell with only an early sign of recovery, adoption was uneven, and review became the bottleneck. 19.2% of merged PRs were auto-approved with no human reviewer, and those merged in a median 14.6 minutes against 75.8 org-wide.
  Tags: `metrics`, `pr-throughput`, `code-quality`

- **[Augment Code — Beyond AI Coding Agents: How We Built Augment's Software Factory](https://www.augmentcode.com/blog/beyond-ai-coding-agents-how-we-built-augments-software-factory)** — Akshay Utture, 2026-09
  A before/after over 17,200 merged PRs as agents were added at each SDLC step in bottleneck order: size-adjusted output per developer rose 4.5x, median time to merge fell from 11.2h to 3.1h, and the 14-day revert rate fell from 1.9% to 0.4%. The author is clear it is a longitudinal case study with no control group, and the Opus 4.5 rollout is a confounder.
  Tags: `metrics`, `software-factory`, `reverts`

- **[Will Larson — Shipping 100+ PRs to production in a week](https://lethain.com/passing-100-prs-in-a-week/)** — Will Larson, 2026-11
  One leader went from 5-10 to 115 merged PRs in a week, and the bottleneck moved in order: deployment, stale context, issue structure, orchestration, approvals, verification, then running out of easy work. He concludes PR quality and verifiability were the real limit, and that merged PRs per week is a number that raises questions more than it answers them.
  Tags: `metrics`, `pr-throughput`, `bottlenecks`

- **[Anthropic — How employment is changing at Anthropic](https://www.anthropic.com/research/employment-at-anthropic)** — Nathan Wilmers et al., 2026-10
  First-party workforce data: agent work hours passed human hours in March 2026, about 80% of interactive session time is idle waiting on a human, and commits per engineer reached about 5x the level of six months earlier. A comparison of 192 adopters with 74 non-adopters found no difference in how often agent-written and human-written lines were later removed or reverted.
  Tags: `metrics`, `workforce`, `code-quality`

- **[Anthropic — When AI builds itself](https://www.anthropic.com/institute/recursive-self-improvement)** — Marina Favaro, Jack Clark, 2026-06
  Internal measurements, each with its caveat: over 80% of merged code attributed to Claude in May 2026 (conservative, given attribution gaps), about 8x code merged per engineer per day against 2024 (which the authors call an overstatement of productivity), and judge-scored session success rising from about 26% to 91% in a September update. Borderline: a policy-team report, included for its first-party data and explicit measurement caveats.
  Tags: `metrics`, `attribution`, `borderline`

### Cost per unit of work

- **[Uber — Running a Software Factory Efficiently at Uber Scale](https://www.uber.com/us/en/blog/efficient-software-factory/)** — Uday Kiran Medisetty, 2026-08
  The most detailed public account of agent cost per unit of work: with the model held fixed, cost per session fell 52% from its June peak while weekly active users grew 7x and total AI spend stayed roughly flat since April. The levers are named defaults: a cheaper subagent model, auto-compaction at 400k tokens, Medium reasoning, a 1h prompt cache, and CLI or tool search so the schemas of 100+ MCP tools (50-70k tokens) no longer load up front.
  Tags: `metrics`, `cost`, `software-factory`

- **[Airbnb — How Airbnb uses cost per task to operate coding agents on Amazon Bedrock](https://aws.amazon.com/blogs/machine-learning/how-airbnb-uses-cost-per-task-to-operate-coding-agents-on-amazon-bedrock/)** — Alan Yao et al., 2026-11
  Airbnb sets default models and effort ceilings for its internal coding agent by cost per task across seven eval suites; going from low to high effort on one model bought 0.8 score points at 2.5x the cost. Production spend still diverged from evals: a model with the same eval cost ran several times more expensive per user, because each request cost about 3x as much and users sent about 3x as many. Borderline: published on the AWS blog with AWS co-authors, though the practice and data are Airbnb's.
  Tags: `metrics`, `cost`, `model-selection`, `borderline`

### Industry-wide data

- **[GitHub — Octoverse: Commits, pushes reach new highs in 2026 as developers build with agents](https://github.blog/news-insights/octoverse/octoverse-commits-pushes-reach-new-highs-in-2026-as-developers-build-with-agents/)** — GitHub Staff, 2026-10
  More than 40% of PRs on GitHub started with an agent's first draft by September 2026, up from 17% in March, and agent-involved PRs merged within two weeks 90% of the time against about 86% for the comparison group. GitHub says its agent detection is a floor and gives no data on defects, reverts or security incidents. Borderline: corporate data report with a staff byline, included as GitHub's first-party data on agent PRs.
  Tags: `metrics`, `adoption`, `borderline`

- **[Stack Overflow — 2026 Stack Overflow Developer Survey: AI](https://survey.stackoverflow.co/2026/ai)** — Stack Overflow, 2026-10
  A large self-report baseline (10,926-13,857 responses per question): Claude Code (66%) and GitHub Copilot (59%) lead coding agents, top uses are familiar-area code (69%) and debugging or refactoring (64%), and 48% trust AI when they can easily validate the answer. Use it to calibrate internal adoption surveys; it does not measure productivity. Borderline: self-reported survey with no named authors.
  Tags: `metrics`, `survey`, `borderline`

## Metrics that broke and what people use instead

- **Lines of code / commits per day** → mostly meaningless now. Replaced with *PR throughput*, *revert rate*, *time-to-merge*.
- **Code review velocity** → the new bottleneck. Tracked as *review queue depth*, *human-review-required rate*.
- **Bugs per KLOC** → still useful, but combine with *AI-attributed bug rate* (bugs traceable to agent-generated code).
- **Engineer productivity (any old proxy)** → most teams gave up and now measure *outcomes shipped per quarter* with a flat AI usage assumption.
- **PR and commit counts** → inflate shipped output. Read them next to *resolved issues*, *releases* and *review wait*: in Chen & Stratton, agents lift PRs ~36% and resolved issues ~14%; in Demirer et al., a 240% commit gain becomes 30% for releases.
- **Share of PRs or code written by agents** → overstates the agent's share of the work. Toub says the agent's 22.2% of Microsoft-originated PRs overstates its share of effort, and Anthropic's authors call their own 8x lines-per-engineer figure an overstatement. Pair it with *success rate*, *reverts* and *review load* against a human baseline.
- **Raw token spend** → *cost per task* or *cost per session* with the model held fixed (Uber, Airbnb). Airbnb saw a model with the same eval cost run several times more expensive per user in production.

## What's still missing here

- A controlled human-baseline productivity study of coding agents from May-November 2026. Searches found none, and METR's Anthropic assessment names the same gap.
- Defect, revert and security-incident rates for agent PRs at platform scale. Octoverse reports acceptance only.
- Cost per shipped feature. Uber and Airbnb measure per session and per task, and no source here ties spend to features shipped.
- Multi-agent attribution: when five agents collaborate on one change, whose throughput is it?

## Voices

- See [evals-qa.md](evals-qa.md) — many of the same authors
- [Will Larson](../people/will-larson.md)

## Related

- [Code review](code-review.md): where the review bottleneck gets worked on
- [Rollout & adoption](adoption-rollout.md): how agent use spread inside orgs
- [Org, hiring & culture](org-and-hiring.md): workforce effects of the same shift
- [Harnesses](harnesses.md): the context and delegation choices behind cost per task
- Orgs: [Uber](../orgs/uber.md), [Intercom](../orgs/intercom.md), [Microsoft](../orgs/microsoft.md), [GitHub](../orgs/github.md), [Anthropic](../orgs/anthropic.md)

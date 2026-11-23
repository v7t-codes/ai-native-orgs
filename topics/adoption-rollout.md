# Rollout & adoption: how orgs actually got there

> First-person accounts of taking coding agents org-wide, with numbers. The common arc: a small platform team ships skills and hooks to every laptop, use spreads through peers and champions, PR counts climb fast, and review, verification and code quality become the new limit. Most figures are company-reported; Microsoft's two pieces are the ones measured against a baseline.

## What the best teams converged on

- **One metric, published with its side effects.** Intercom tracked merged PRs per R&D head, hit 2x in nine months, and reported falling static-analysis code quality next to it. Microsoft's rollout study calls merged PRs an imperfect proxy for value.
- **A small platform team ships conventions as code.** At Intercom a skill is promoted to the base plugin at 50 weekly active users and pushed to Macs through MDM (JAMF). Trail of Bits enforces package cooldowns through Jamf and makes sandboxes the default.
- **Hooks enforce what prompts only suggest.** Intercom blocks raw `gh pr create` with a PreToolUse hook and moved to hooks because system-prompt skill reminders were unreliable. Meta's Forum team runs a linter after every agent turn and checks tests before PR creation.
- **Use spreads through people.** At Microsoft, the odds of first use were 216% higher when over a quarter of skip-level peers used the tool and 82% higher when the direct manager did. Rippling used AI champions and SPARK demo sessions; Uber paired about 30 AI-proficient engineers with business teams.
- **Make the repo agent-ready first.** Razorpay scores repos against an 80% "Agent Ready" bar. In dotnet/runtime, an instructions file and unblocked NuGet feeds moved agent PR success from 38.1% to 69%. Spotify saw agents do measurably worse in fragmented codebases.
- **Review and verification become the limit.** FurtherAI invested in tests and CI (91% of changes now include tests) and planning and review grew to 70% of feature time. Agent PRs in dotnet/runtime drew 16.5 review comments each against 12.4 for human PRs.
- **One agent on top of the existing systems of record.** Sierra merged four role-specific agents into one and kept GitHub, Salesforce and Linear as the source of truth. Razorpay runs the same agent, memory and toolchain across Slack, tickets and CI.
- **Usage counts measure activity.** Sierra warns against agents that "tokenmaxx" an adoption chart and says it has no good outcome measure yet.

## Practitioner sources

### First-person rollout accounts

- 🟢 **[Intercom (Fin) — 2x – nine months later: We did it](https://ideas.fin.ai/p/2x-nine-months-later)** — Darragh Curran, 2026-04
  Intercom set one metric (merged PRs divided by all R&D headcount, "from IC engineers to VP of product design") and hit 2x in nine months. It reports the side effects next to the win: 93.6% of PRs agent-driven, 19.2% auto-approved with no human reviewer, defect backlog down 54%, and static-analysis code quality falling as AI use grew, with only an early sign of recovery.
  Tags: `org-rollout`, `metrics`, `code-quality`

- **[Intercom (Fin) — Webinar Q&A: How Fin 3x'd R&D output in 16 months](https://ideas.fin.ai/p/webinar-q-and-a-how-fin-3xd-r-and)** — Darragh Curran, 2026-05
  Seventy-two answered questions on the mechanics behind the 2x post. A skill is promoted to the base plugin at 50 weekly active users, updates are forced through IT MDM after the auto-updating marketplace proved unreliable, and the list of what went wrong includes an agent that pushed hundreds of thousands of changes to the Rails monolith and broke the repo.
  Tags: `org-rollout`, `skills`, `governance`

- **[Intercom (Fin) — How eight people hold the bar for 200+ builders](https://ideas.fin.ai/p/how-eight-people-hold-the-bar-for)** — Clíona de Róiste, 2026-07
  Fin's frontend platform team gives agents design-system context ("Surge Intelligence") and migration skills, and measures the effect: 7% of the components agents reached for existed in the design system without that context and 96% with it, and code that passes typechecking was 0% without it and 74% with it. It names what is still unsolved: a quarter of pages still use wrong props, and there is no reliable judge yet for design guidance.
  Tags: `platform-team`, `skills`, `evals`

- **[Intercom — How we use Claude Code today at Intercom](https://ideas.fin.ai/p/how-we-use-claude-code-today-at-intercom)** — Brian Scanlan, 2026-03
  A concrete example of enforcing agent rules mechanically: a PreToolUse hook blocks raw `gh pr create` unless the create-pr skill ran, another hook blocks edits to merged PR branches, and a weekly GitHub Action fact-checks every CLAUDE.md. 13 plugins and 100+ skills ship to Macs through JAMF.
  Tags: `hooks`, `enforcement`, `skills`

- 🟢 **[Trail of Bits — How we made Trail of Bits AI-native (so far)](https://blog.trailofbits.com/2026/03/31/how-we-made-trail-of-bits-ai-native-so-far/)** — Dan Guido, 2026-03
  A playbook from a security firm where about 5% of staff were on board a year earlier: an AI handbook with approved tools and data rules, a role-specific maturity matrix, public and internal skills repos (94 plugins, 201 skills), sandboxes by default and Jamf-enforced package cooldowns. Auditors went from about 15 to about 200 bugs a week on engagements where scope allows.
  Tags: `org-rollout`, `security`, `skills`

- **[Razorpay — Razorpay Engineers Built Slash. Slash Builds the Rest.](https://razorpay.com/blog/razorpay-engineers-built-slash-slash-builds-the-rest/)** — Prabu Ram, 2026-05
  One internal agent, memory and toolchain shared across Slack, tickets and CI; Slash-created PRs went from about 100 a week to about 1,000 inside a month. Repos must clear an 80% "Agent Ready" bar across context (AGENTS.md, scoped skills, docs), testing and CI/CD, shown on POD health dashboards, and the post admits the same agent performs very differently across repos.
  Tags: `org-rollout`, `agent-ready`, `india`

- **[FurtherAI — Building an AI-native engineering org](https://x.com/sgondala2/status/2115832070274723875)** — Sashank Gondala, 2026-10
  A startup CTO's rebuild of the shipping process: merged changes per engineer per day up about 5x since January with reverts under 0.5%, paid for with tests and CI (91% of changes include tests, up from 15%; 20x the tests in the same 17 minutes). Planning and review grew from 40% to 70% of feature time; all numbers are self-reported.
  Tags: `org-rollout`, `testing`, `ci`

- **[Spotify — Coding Is No Longer the Constraint: Scaling Developer Experience to Teams and Agents at Spotify](https://engineering.atspotify.com/2026/6/code-with-claude-coding-is-no-longer-the-constraint)** — Spotify Engineering (talk by Niklas Gustavsson), 2026-06
  Honk, Spotify's background coding agent, runs Claude through the Agent SDK inside Spotify's own harness in Kubernetes pods, and Fleet Management has produced more than 2.5 million automated maintenance PRs, most auto-merged. PR frequency rose 76%, and agents did measurably worse in fragmented codebases with inconsistent patterns. Borderline: company byline summarizing a conference talk, with self-reported survey figures.
  Tags: `org-rollout`, `background-agents`, `borderline`

- **[Rippling — How Rippling learned to work differently](https://www.rippling.com/blog/ai-at-rippling-from-personal-boosts-to-org-level-leverage)** — Ankur Bhatt, 2025-10
  BugBot reviews more than 9,000 PRs a week with over half of its findings fixed automatically, and Cursor went from 300 engineers to more than 1,200 daily active users in a few months. Adoption spread through AI champions and SPARK demo sessions, with one joint legal, security and procurement review before a pilot touches a critical workflow; "AI slop is real" and some pilots ended. Borderline: Head of AI writing at org level, with mostly anecdotal time savings.
  Tags: `org-rollout`, `champions`, `borderline`

- **[Sierra — Pinecone: Harnessing the wisdom of the workforce](https://sierra.ai/blog/pinecone-harnessing-the-wisdom-of-the-workforce)** — Allen Chen, Tess Rosania, 2026-07
  Sierra's single internal agent uses a classifier to pick the repo, environment, harness (Codex or Claude Code), model and reasoning budget for each prompt; 96% of engineering uses it and 70% of PRs were opened through it in the last month. Usage tripled monthly since April while costs fell, and fixed workflows "didn't last long" as models improved, so the team switched to building primitives.
  Tags: `internal-agent`, `harnesses`, `org-rollout`

- **[Meta — How Meta Built Forum With AI-Native Engineering](https://engineering.fb.com/2026/10/15/ml-applications/how-meta-built-forum-ai-native-engineering/)** — Shengbo Guo et al., 2026-10
  The Forum team reached core feature parity with Facebook Groups in eight weeks, counting a task done only when tests and visual checks passed inside the agent loop. Its harness has five parts (rules, skills, agents, commands, hooks), a mistake repeated "more than twice" becomes a permanent rule, and the authors call verification "the hard part to get right".
  Tags: `team-operating-model`, `hooks`, `verification`

### Spreading agents beyond engineering

- **[Sierra — AI-pilling our company: lessons learned](https://sierra.ai/blog/ai-pilling-our-company-lessons-learned)** — Neil Rahilly, 2026-07
  Four role-specific agents failed and were merged into one agent with one Slack handle, which reaches 37 systems through the MCP Gateway and inherits each employee's access. 75,000+ sessions for 600+ people, and the author warns that session counts measure activity: "We don't have a good way to measure that yet."
  Tags: `org-rollout`, `non-engineers`, `internal-agent`

- **[Ramp — We Built Every Employee at Ramp Their Own AI Coworker](https://x.com/sebgoddijn/status/2042285915435937816)** — Seb Goddijn, 2026-04
  At 99% adoption of AI tools, most Ramp staff were stuck on terminal, npm and MCP setup, so Ramp built Glass: one Okta sign-in connects every tool, Dojo shares 350+ reviewed skills, and scheduled automations and Slack assistants run on each person's setup. Ramp found that a skill installed on day one taught people more than its training sessions did.
  Tags: `org-rollout`, `non-engineers`, `skills`

- **[Uber — Agentic AI at Uber beyond engineering: Agentic Pods](https://x.com/praveenTweets/status/2074605343439810922)** — Praveen Neppalli Naga, 2026-07
  With 99% of engineers on AI tools and 70%+ of PRs attributed to agents, Uber paired about 30 AI-proficient engineers with business experts in 10-day pods (shadow, prioritize, build, validate, ship): 16 pods across 16 functions in two months. Reported results include capital allocation across 150 cities going from 15 hours to 30 minutes. Borderline: CTO self-report with no method detail, included for its concrete pod format.
  Tags: `non-engineers`, `pods`, `borderline`

- **[Postman — Steer Your Agents Until They Steer Themselves](https://blog.postman.com/steer-your-agents-until-they-steer-themselves/)** — Rohan Vaidya, 2026-10
  Coaching agents reach about 220 sellers a month, monthly questions grew 76% from July to September with 80% retention, and 1 in 10 users asked more than 100 questions. New account-memory versions go live only after checks, and prompt patches written against single symptoms piled up into "sediment" that pushed the wrong way when models changed.
  Tags: `non-engineers`, `internal-agent`, `governance`

### Measured against a baseline

- 🟢 **[Microsoft — Adoption and Impact of Command-Line AI Coding Agents: A Study of Microsoft's Early 2026 Rollout of Claude Code and GitHub Copilot CLI](https://arxiv.org/abs/2607.01418)** — Emerson Murphy-Hill, Jenna Butler, Alexandra Savelieva, 2026-07
  A measured rollout across tens of thousands of engineers: adopters merged 24% more PRs (95% CI +14.5% to +33.7%), with a placebo test near zero. Use spread through people: the odds of first use were 216% higher when over a quarter of skip-level peers used the tool and 82% higher when the direct manager did.
  Tags: `org-rollout`, `measurement`, `research`

- **[Microsoft — Ten Months with Copilot Coding Agent in dotnet/runtime](https://devblogs.microsoft.com/dotnet/ten-months-with-cca-in-dotnet-runtime/)** — Stephen Toub, 2026-03
  Agent PRs measured against human baselines in the same repo: 535 of 878 merged (67.9%) against 87.1% for Microsoft engineers, with a 0.6% revert rate against 0.8%. An instructions file and unblocked NuGet feeds took success from 38.1% to 69%, and agent PRs drew more review (16.5 comments per merged PR against 12.4).
  Tags: `baselines`, `metrics`, `code-review`

- **[Spotify — AI Changed How Spotify Builds. What We Learned (and Fixed) About Quality at Higher Velocity](https://engineering.atspotify.com/2026/9/ai-changed-how-spotify-builds-what-we-learned-and-fixed-about-quality-at-higher-velocity)** — Tyson Singer, 2026-09
  Merged changes in August more than doubled year over year (about 8,100 to 17,000) and rework rate did not rise. In the incidents reviewed, AI-authored code was not a material direct contributor; an automated dependency upgrade that passed checks and then failed in production led Spotify to schedule automated changes in owning teams' working hours. Borderline: SVP-authored, included for its incident dates, causes and named fixes.
  Tags: `quality`, `incidents`, `borderline`

## Related

- Orgs: [Intercom](../orgs/intercom.md), [Sierra](../orgs/sierra.md), [Uber](../orgs/uber.md), [Microsoft](../orgs/microsoft.md), [Spotify](../orgs/spotify.md), [Meta](../orgs/meta.md), [Razorpay](../orgs/razorpay.md), [Rippling](../orgs/rippling.md)
- Topics: [Metrics](metrics.md), [Org, hiring & culture](org-and-hiring.md), [Org-wide personal agents](orgwide-personal-agents.md), [Code review](code-review.md), [Security](security.md)
- People: [Stephen Toub](../people/stephen-toub.md) (dotnet/runtime), [Brian Scanlan](../people/brian-scanlan.md) (Intercom)

## What's still missing here

- Almost every number here is company-reported. Microsoft's study is the only one here measured against a synthetic control, and no other controlled human-baseline study from May to November 2026 was found.
- India-based orgs: Razorpay is the only one with a practitioner write-up. Other Indian figures (Meesho, CRED, Freshworks, Flipkart) are executive statements or press coverage.
- Rollouts that stalled: Amazon's Kiro usage mandate and the backlash to it appear only in press reports. No follow-up to Block's January post was found, and Ramp has shared no new Inspect adoption numbers.
- Rippling's centralized skills model: no public source was found.
- Intercom's code-quality study with Stanford has not been published by Intercom.

PRs welcome.

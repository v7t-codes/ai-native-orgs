# Org, hiring & culture

> What changes for engineering managers, ICs, and hiring once AI is shipping a meaningful share of the code. The first hard data arrived in 2026: the junior share of hires falling at Anthropic, review taking up the time coding used to, and AI-allowed interviews that had to be rebuilt as each model release caught up with candidates.

## Practitioner sources

- 🟢 **[Tobi Lütke — "Reflexive AI usage is now a baseline expectation at Shopify"](https://x.com/tobi/status/1909251946235437514)** — set the cultural tone. Reframed review, hiring, and headcount: managers asking for new human talent must explain why the job can't be done by AI.
- **[Will Larson — Building internal agents series](https://lethain.com/agents-series/)** — the management view of building AI capability inside an existing eng org
- **[Gergely Orosz — When AI writes almost all code, what happens to software engineering?](https://newsletter.pragmaticengineer.com/p/when-ai-writes-almost-all-code-what)** — what changes for managers
- **[Gergely Orosz — The grief when AI writes most of the code](https://blog.pragmaticengineer.com/the-grief-when-ai-writes-most-of-the-code/)** — the emotional/identity side, under-discussed
- **[Block — AI-Assisted Development at Block](https://engineering.block.xyz/blog/ai-assisted-development-at-block)** — the AI Champions org pattern + maturity ladder

### Workforce data

- 🟢 **[Anthropic — How employment is changing at Anthropic](https://www.anthropic.com/research/employment-at-anthropic)** — Nathan Wilmers et al., 2026-10
  First-party data on an AI-native workforce: the junior share of technical hires fell from 27% to 9%, and "meta-work" (building skills, plans and reviews for agents) rose from 10% of interactive sessions in fall 2025 to 22% in spring 2026. By August agents worked about 6x the hours of their human handlers, and the authors flag non-random adoption and business growth as possible sources of bias.
  Tags: `org-design`, `hiring`, `workforce`

- **[Harvard — Artificial Intelligence in the Firm: Bottlenecks in Software Production](https://fion.ac/jellyfish.pdf)** — Fiona Chen, James Stratton, 2026-11
  The labor side of the review bottleneck across 655 firms: in the authors' calibrated model, labor in coding falls 22.7% and labor in review rises 43.4%, and 82.8% of reviews come from reviewers already familiar with the code, so reviewers are hard to swap in. The measured employment effect of agents was -2.6% and not significant.
  Tags: `org-design`, `review`, `labor`

- **[Anthropic — Agentic coding and persistent returns to expertise](https://www.anthropic.com/research/claude-code-expertise)** — Zoe Hitzig et al., 2026-06
  Across about 400k Claude Code sessions, users make about 70% of planning decisions and Claude about 80% of execution decisions, and expertise still roughly doubles verified success (about 15% for novices against 28-33% for intermediate users and above). Verified success needs a hard signal such as git activity, passing tests or explicit user affirmation, a split from transcript-judged success that teams can reuse in their own metrics. Borderline: economics research, included for the verified-vs-judged split.
  Tags: `expertise`, `skills`, `metrics`, `borderline`

### Hiring loops

- 🟢 **[Anthropic — Designing AI-resistant technical evaluations](https://www.anthropic.com/engineering/AI-resistant-technical-evaluations)** — Tristan Hume, 2026-01
  A take-home that allows AI, given to about 1,000 candidates, is now on its third version because each model release caught up: by May 2025 over half of candidates would have done better delegating fully to Claude Code, and Opus 4.5 matched the best human in 2 hours. Version 3 uses novel Zachtronics-style puzzles with no debugging tools, so building your own tools becomes part of the signal.
  Tags: `hiring`, `interviews`, `ai-allowed`

- **[Coinbase — Interviewing Engineers in the AI Era: Lessons from a Year of Rebuilding](https://www.coinbase.com/blog/interviewing-engineers-in-the-ai-era-lessons-from-a-year-of-rebuilding)** — Coinbase engineering (shared by CTO Rob Witoff), 2026-07
  As the AI-generated share of merged code went from 5.7% in Q1 2025 to nearly all new code, interviews became repo-based debugging and review with AI tools allowed, scored on an "AI Fluency" rubric (usage, application, understanding limits). An 84% correlation between two rounds showed one was redundant, and 45/90-day pulse surveys check whether interview fluency predicts fluency on the job. Borderline: company byline, included for its specific data and honest "still figuring out" section.
  Tags: `hiring`, `interviews`, `borderline`

### Leading teams that run agents

- **[Will Larson — Revised rules of engineering leadership](https://lethain.com/revised-rules-of-engineering-leadership/)** — Will Larson, 2026-06
  A CTO's revised org-design rules with numbers: deploys went from about 6 a week to 200-400 in a year as headcount doubled, and daily Claude Code or Cursor use went from 25% to 100% of the team in two months with no mandate. He keeps durable high-ownership teams, lets one engineer own complex migrations (a monorepo move was 95% one person), argues working code still has a real cost, and doubts most non-engineers should ship code.
  Tags: `org-design`, `leadership`, `migrations`

- **[Addy Osmani — Your coding agents made you a manager](https://x.com/addyosmani/status/2119332146485891501)** — Addy Osmani, 2026-11
  Ten ranked practices for the engineer who now runs agents: give each agent a pass/fail validator, turn a correction made twice into CLAUDE.md text or a skill, and use hooks for rules that must never bend. He runs 4-5 background agents, says each one past a few adds an "orchestration tax", calls approving big diffs on green tests "code ratification", and says % AI-written code is not a useful goal; track PR cycle time, new-hire ramp, reverts and rework.
  Tags: `ic-role`, `agent-management`, `metrics`

- **[FurtherAI — Building an AI-native engineering org (X Article)](https://x.com/sgondala2/status/2115832070274723875)** — Sashank Gondala, 2026-10
  A startup CTO's rebuild of how the team ships: merged changes per engineer per day up about 5x with reverts under 0.5%, paid for by tests in 91% of changes (up from 15%) and CI that runs 20x the tests in the same 17 minutes. Planning and review grew from 40% to 70% of feature time, and he redefined seniority around end-to-end ownership; the numbers are self-reported.
  Tags: `org-design`, `seniority`, `review`

- **[Intercom — How eight people hold the bar for 200+ builders](https://ideas.fin.ai/p/how-eight-people-hold-the-bar-for)** — Clíona de Róiste, 2026-07
  How a small frontend platform team keeps quality up when agents write more than 90% of PRs: conventions ship as auto-installed skills plus a design-system knowledge base ("Surge Intelligence"), and agents now reach for components that exist in the design system 96% of the time against 7% without it. The team names what it still cannot measure: about a quarter of pages use wrong props, and there is no reliable judge yet for design-guidance compliance.
  Tags: `platform-team`, `skills`, `evals`

- **[Trail of Bits — How we made Trail of Bits AI-native (so far)](https://blog.trailofbits.com/2026/03/31/how-we-made-trail-of-bits-ai-native-so-far/)** — Dan Guido, 2026-03
  An org-wide playbook from a security firm that started with about 5% buy-in: it names four barriers (including identity threat and intolerance for imperfection), then answers with an AI handbook, a role-specific maturity matrix with consequences for staying stuck, and shared skills repos. On suitable engagements auditors went from about 15 to about 200 bugs a week, and about 20% of client-reported bugs were first found by AI, all validated by auditors.
  Tags: `org-rollout`, `maturity-matrix`, `security`

## Patterns showing up across companies

- **Skill that mattered 2 years ago** vs. **skill mattering now** — most pieces converge on: less syntax-recall, more taste/architecture/eval-design
- **Senior vs. junior role shifts** — seniors become reviewers and harness designers; juniors do the same work agents do, which is awkward
- **Skeptic vs over-reliant balancing** — the eng manager's new job is calibrating each engineer's AI use
- **AI Champions** (Block) — designating per-repo or per-team owners who set up the AI tooling foundation and unblock adoption
- **Fewer junior hires, more meta-work**: at Anthropic the junior share of technical hires fell from 27% to 9% while meta-work rose to 22% of interactive sessions.
- **Interviews allow AI and test judgment**: Anthropic is on the third version of its take-home as models keep catching up, and Coinbase moved to repo-based debugging scored on an AI Fluency rubric.
- **Review takes the time coding used to**: Chen & Stratton's model moves labor from coding into review, and at FurtherAI planning and review went from 40% to 70% of feature time.

## What's still missing here

- Performance review when agents did most of the work.
- Outcome data for AI-allowed interviews. Coinbase is checking whether interview fluency predicts on-the-job fluency, and no source here reports the answer.
- How juniors get trained once fewer are hired. Anthropic shows the hiring drop, and no source here describes a new path.
- "Capability degradation": whether engineers lose depth as they lean on AI. Anthropic's expertise study shows experts still get about twice the verified success, but nothing here tracks the same engineers over years.
- First-person engineering-manager essays with hard numbers beyond Larson and Gondala, and a primary source on Meta's AI-assisted coding interviews. Searches found neither.

## Voices

- [Will Larson](../people/will-larson.md)
- [Gergely Orosz](../people/gergely-orosz.md)
- [Addy Osmani](../people/addy-osmani.md)

## Related

- [Rollout & adoption](adoption-rollout.md): how agent use spread team by team
- [Metrics](metrics.md): measuring the same shift
- [Code review](code-review.md): where review time goes
- Orgs: [Anthropic](../orgs/anthropic.md), [Intercom](../orgs/intercom.md), [Coinbase](../orgs/coinbase.md), [Shopify](../orgs/shopify.md), [Block](../orgs/block.md)

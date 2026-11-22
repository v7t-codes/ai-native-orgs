# Reliability & failure modes

> AI in the critical product loop: hallucinations, latency, model deprecation, fallback architectures, observability for agents. Since mid-2026 it also covers what agent volume does to production. Agent write volume outgrew git infrastructure at Anthropic and GitHub, change volume ran ahead of verification at Spotify, and agents now work incidents and regressions next to engineers at Ramp, OpenAI and Figma.

## Practitioner sources

### Observability and incident management

- 🟢 **[Lorin Hochstein — Lots of AI SRE, no AI Incident Management](https://surfingcomplexity.blog/2026/02/14/lots-of-ai-sre-no-ai-incident-management/)** — Lorin Hochstein, 2026-02
  The missing critical voice. Argues current "AI for SRE" tools (PagerDuty, Datadog Bits, incident.io, Azure, Rootly, Cleric, Resolve.ai) help with detection and remediation, not with the messy human-coordinated work of incident management. The "common ground" framing is the right lens.
  Tags: `ai-sre`, `incident-management`, `practitioner-bylined`

- 🟢 **[Charity Majors — Honeycomb 10 Year Manifesto](https://www.honeycomb.io/blog/honeycomb-10-year-manifesto-part-1)** — Charity Majors
  Observability principles applied to a decade of running production. The argument for high-cardinality, observability-driven debugging holds doubly for agent systems.
  Tags: `observability`, `engineering-culture`

- **[Will Larson — Building an internal agent: Logging and debugability](https://lethain.com/agents-logging/)** — Will Larson
  The reliability and failure-mode posts in his agents-series — what observability for agent systems actually looks like in practice.
  Tags: `agents-in-prod`, `observability`, `practitioner-bylined`

- **[Will Larson — Evals to validate workflows](https://lethain.com/agents-evals/)** — Will Larson
  The eval discipline as a reliability primitive — exercising prompts and tools together and grading the results.
  Tags: `evals`, `agents-in-prod`

### Agents on call: triage, diagnosis and fixes

- 🟢 **[Ramp — How we built OCA, our AI on-call assistant](https://builders.ramp.com/post/how-we-built-oca-our-ai-on-call-assistant)** — Richard Marmorstein, Austin Ray, 2026-09
  An incident agent built from Claude Code or Codex in a monorepo checkout and run on Temporal. It assisted 575 of 1,220 merged incident-fix PRs in four weeks and was rated helpful 90% of the time; hooks that demanded proof of compliance caused retry loops, and the memory layer did not move ratings, though it sped up investigations.
  Tags: `ai-sre`, `on-call`, `hooks`, `memory`

- **[OpenAI — How OpenAI's Performance Factory keeps ChatGPT fast](https://openai.com/index/how-openai-performance-factory-keeps-chatgpt-fast/)** — Okay Zed, Cyrus Forbes, 2026-11
  An agent pipeline for performance regressions that root-caused over 600 cases from 1,700+ investigations in just over three months, and a manual review of 100 suggestions graded 70% accurate. A separate Codex session tries to disprove each diagnosis, engineers still review, merge and deploy every fix, and the authors say "Getting fixes right has been harder than finding the cause."
  Tags: `ai-sre`, `performance`, `adversarial-review`

- **[Figma — How we secure Figma's internal systems with agents](https://www.figma.com/blog/how-we-secure-figmas-internal-systems-with-agents/)** — Matthew Sullivan, Brad Girardeau, 2026-07
  A security operations agent with four memory types (case memory over past alerts, steering memory in markdown, state records, procedural memory for schema discoveries) cut alert time-to-resolution by about 70% and on-call pages by 20%. Saving every lesson as steering memory started overriding the agent's behavior, and PR drafting moved from the prompt to a deterministic post-step.
  Tags: `on-call`, `memory`, `security-operations`

- **[Vercel — How we closed 1,500 GitHub issues in one month](https://nextjs.org/blog/how-we-closed-1500-github-issues)** — Marcos Hernanz, 2026-09
  Next.js ran up to 200 concurrent sandboxed agent sessions, about 30 minutes per investigation, and closed 1,462 issues in about three weeks, taking the backlog from 2,244 to under 1,000 while 218 new reports arrived. The agent ignores instructions found in issue text and cannot comment or close by itself; auto-close now starts at up to 25 issues a week.
  Tags: `triage`, `open-source`, `prompt-injection`

### When agent volume breaks the system

- **[Anthropic — Redesigning source control at Anthropic](https://www.anthropic.com/engineering/redesigning-source-control)** — Nick G. and the source control team, 2026-10
  Merges went from about 2,500 a day in May 2026 to 30,000+ in September, and with 25M CI checkouts a day a naive git fetch would have meant 600+ PB of traffic daily. A seven-person team built Scion to replace the git mirrors, and since they could not replicate a global merge-queue lock at this scale, they put the weight on post-merge and pre-deploy testing.
  Tags: `version-control`, `ci`, `scale`

- **[GitHub — Building Git infrastructure for agent-scale development](https://github.blog/engineering/architecture-optimization/building-git-infrastructure-for-agent-scale-development/)** — Brian Celenza, 2026-10
  Commits reached 7.38B in September 2026, more than 5x a year earlier, and in GitHub's replicated storage a push is as slow as the slowest of five replicas. The redesign makes blob storage the source of truth with cache-backed compute workers, and shows up to 35x write throughput in internal benchmarks, with no production date.
  Tags: `version-control`, `storage`, `scale`

- **[Spotify — AI Changed How Spotify Builds. What We Learned (and Fixed) About Quality at Higher Velocity](https://engineering.atspotify.com/2026/9/ai-changed-how-spotify-builds-what-we-learned-and-fixed-about-quality-at-higher-velocity)** — Tyson Singer, 2026-09
  Merged changes in August more than doubled year over year (about 8,100 to 17,000). In the incidents reviewed, AI-authored code was not a material direct contributor; an automated dependency upgrade passed checks and failed in production, so Spotify now schedules automated changes in owning teams' working hours and added rollback capacity. Borderline: SVP-authored, included for its incident dates, causes and named fixes.
  Tags: `quality`, `incidents`, `change-volume`, `borderline`

- **[Cursor — What we've learned building cloud agents](https://cursor.com/blog/cloud-agent-lessons)** — Josh Ma, 2026-06
  More than 40% of Cursor's PRs come from cloud agents, and Temporal took the early beta from one nine of reliability to past two. The failure mode to watch is silent: "often the only indication is a subtle degradation in output quality".
  Tags: `agent-infrastructure`, `durable-execution`, `silent-failure`

- **[Anthropic — Using a "chaos loop" to harden the Claude Docs launch: 60 server errors across billions of requests](https://claude.dev/blog/chaos-loop-claude-docs-launch/)** — Vivek Nair, 2026-11
  A Claude coordinator with about 11 sub-agents load-tested and fixed a service before launch, which then handled 2 billion requests with 60 server errors and no rollbacks on about 50 pods. It cost about $125,000 of inference against an estimated six months of team effort, and the author thinks about half of that spend could have been saved.
  Tags: `load-testing`, `cost`, `multi-agent`

## What's still missing here

- Real fallback architecture: what happens when the model goes down or the API rate-limits? None of the 2026 sources cover it.
- Agent identity at scale: OpenAI gives each agent its own identity and runs its performance agent under a service identity (see [security.md](security.md)), but nobody publishes audit data on which agent did what, and for whom.
- Cost versus accuracy: Anthropic's chaos loop ($125,000 against six months of team effort) and Ramp lowering OCA's reasoning effort from max to high with no noted quality loss are rare data points.
- Fix quality: OpenAI says fixes are harder than diagnoses, and no team here publishes an acceptance rate for agent-written incident fixes.
- The human coordination side of incidents that Lorin Hochstein describes still has no practitioner write-up of an agent doing it.

## Voices

- [Lorin Hochstein](../people/lorin-hochstein.md)
- [Charity Majors](../people/charity-majors.md)
- [Will Larson](../people/will-larson.md)

## Related

- Topics: [Security](security.md), [Version control](version-control.md), [Memory and context](memory-and-context.md), [Adoption and rollout](adoption-rollout.md)
- Orgs: [Ramp](../orgs/ramp.md), [OpenAI](../orgs/openai.md), [Figma](../orgs/figma.md), [Vercel](../orgs/vercel.md), [Anthropic](../orgs/anthropic.md), [GitHub](../orgs/github.md), [Spotify](../orgs/spotify.md), [Cursor](../orgs/cursor.md)

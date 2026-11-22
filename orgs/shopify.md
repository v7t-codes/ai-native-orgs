# Shopify

> Tobi Lütke's "AI-as-baseline" memo became one of the most-referenced internal-engineering culture documents of the 2025–2026 window. Since mid-2026 Shopify engineers have published the follow-through: River, an internal agent that coauthors one in eight merged PRs, a 12-week rewrite of the Shopify app, and in-house security harnesses.

**The headline:** One in eight merged PRs across Shopify is coauthored by River, its internal agent. In one 30-day window River ran 59,918 sessions in 5,170 Slack channels.

## Practitioner sources

### Culture and policy

- 🟢 **["Reflexive AI usage is now a baseline expectation at Shopify"](https://x.com/tobi/status/1909251946235437514)** — Tobi Lütke (CEO), 2025-04
  The memo. Reframed review, hiring, and headcount: managers asking for new human talent must explain why the job can't be done by AI. AI usage added to performance and peer review.
  Tags: `org-rollout`, `culture`, `hiring`

- **[Tobi Lütke on AGENTS.md vs CLAUDE.md split-brain at Shopify](https://x.com/tobi/status/2092259436538495186)** — Tobi Lütke, 2026-08
  Said he was "thinking about banning Claude code at Shopify" until it read AGENTS.md and .agents/skills, because tool-specific instruction files split the brain of teams that use different agents (2.3M views). Claude Code 2.1.277 added an AGENTS.md fallback on 2026-09-18; neither post links the two. Borderline: a one-line CEO post, included as a signal that vendor-neutral AGENTS.md is becoming the norm in multi-tool orgs.
  Tags: `agents-md`, `culture`, `borderline`

### River and the agent platform

See also: [Harnesses](../topics/harnesses.md), [Org-wide personal agents](../topics/orgwide-personal-agents.md)

- 🟢 **[Under the River](https://shopify.engineering/under-the-river)** — Burke Libbey, Javier Moreno (River credited as co-author), 2026-05
  The architecture of River, which coauthors one in eight merged PRs across Shopify: each session is a durable, append-only event log in Postgres, while the harness and sandbox are disposable. New agent products ship as Nix-built "profiles" on the Aquifer platform, and River works only in public channels, so patterns seen in its sessions feed back into its skills, prompts and defaults.
  Tags: `harnesses`, `personal-agents`, `architecture`

### The Shopify app rewrite

See also: [Legacy modernization](../topics/legacy-modernization.md), [Evals and QA](../topics/evals-qa.md)

- 🟢 **[How we rebuilt the Shopify app in 12 weeks](https://shopify.engineering/shopify-app-rebuild)** — Remi Vanhee, 2026-11
  About 30 engineers in pairs rewrote a 300+ screen app in 12 weeks, after first building the feedback infrastructure: headless business logic and a CLI that loads screens in milliseconds. Spec-driven development failed because the specs went stale, so the running legacy app became the spec, and an agent turned each day's review comments into skill updates; Android P50 launch time fell from 1.71s to 0.87s.
  Tags: `legacy-modernization`, `verification`, `mobile`

- **[Helix: The internal tool powering our Shopify app's native migration](https://shopify.engineering/helix)** — Talha Naqvi, 2026-09
  The gate design behind the rewrite: each checkpoint must pass behavior tests against a CLI, a model-reviewed screenshot diff, two context-isolated adversarial reviewers and engineer approval, and a failed gate cannot be overridden. Pixel diffing failed because the two UI frameworks never render identically; approved feedback is kept so later checkpoints need less oversight.
  Tags: `verification`, `evals`, `legacy-modernization`

### Security work

See also: [Security](../topics/security.md)

- **[Building an agentic harness that outlasts the model](https://shopify.engineering/building-an-agentic-harness-that-outlasts-the-model)** — Zack Deveau, 2026-07
  Dispatch, an in-house security-scanning harness: parallel hunters, then verifiers on a different model that must prove exploitability inside each app's own test suite (an IDOR needs two-tenant fixtures and real cross-tenant data). It produced 300+ findings across 80+ apps in about six weeks at $50-$300 per full scan, and in one audit every one of 30+ candidates was downgraded, dismissed or reclassified after validation.
  Tags: `security`, `harnesses`, `verification`

- **[How River takes security work from a fix to merge](https://shopify.engineering/river-vulnerability-remediation)** — Erin Son, Kaiyi Li, 2026-09
  Security merges through the freshness-gated queue went from about 10% to 80% once closure rules were enforced in code: a vulnerability counts as closed only when the source system, default branch, tracker and ledger agree. It also reports a run where River rechecked only the oldest in-flight claim, which is why prompts are not treated as guarantees.
  Tags: `security`, `reliability`, `personal-agents`

## What's still missing here

The memo set the cultural baseline, and engineers have since published River, the app rewrite and the security harnesses. Still missing: how review load and CI cost changed across the org. The rewrite post says line-by-line human review could not keep pace, and the River post says CI had to scale by an order of magnitude after the move to one repo; a follow-up on what replaced line-by-line review would fill the gap.

## Voices to follow

- **[@tobi](https://x.com/tobi)** — when he's posting eng-management not memes

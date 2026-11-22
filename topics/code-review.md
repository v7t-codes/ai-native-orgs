# Code review & PR workflow

> Agents write code faster than people can read it, so review is now the main constraint. Across 655 firms, time from review submission to merge rose 56% after agent adoption. The 2026 answers: a written policy for which changes need a human, small PRs, and AI reviewers that run separately from the authoring agent.

## Practitioner sources

- 🟢 **[Stripe Minions](https://stripe.dev/blog/minions-stripes-one-shot-end-to-end-coding-agents)** — 1,300+ agent PRs/week. Humans review every PR before merge. Agents have submission authority, not merge authority.
- 🟢 **[Stripe Minions Part 2](https://stripe.dev/blog/minions-stripes-one-shot-end-to-end-coding-agents-part-2)** — what they learned operating Minions in production
- **[Cursor — agents control their own computers](https://cursor.com/blog/agent-computer-use)** — 35% of merged PRs from cloud agents in isolated VMs
- **[Block — AI-Assisted Development at Block](https://engineering.block.xyz/blog/ai-assisted-development-at-block)** — 95% adoption, RPI (Research → Plan → Implement) for complex work
- **[OpenAI Codex — Harness engineering](https://openai.com/index/harness-engineering/)** — 1M LOC over 5 months with 0% manual code, 0% manual review (extreme case)

### Approval policy: which changes need a human

- 🟢 **[Anthropic — How the Claude Code team does code review](https://claude.dev/blog/solving-code-review-at-anthropic/)** — Addy Osmani, Morgan Westlee Lunt, Qing Wang, 2026-10
  A written risk tier sets the number of human approvals: none for low risk once automated review and security checks are green, one for medium, two for high, and an agent's approval never counts as a person's. From June to September merged PRs more than doubled while the reverted share fell by more than 40%, and the post covers what broke, such as one PR going through 50+ review-and-fix rounds overnight.
  Tags: `review-tiers`, `auto-approval`, `review-md`

- **[Intercom (Fin) — AI is approving our pull requests: Here's how we made it safe](https://ideas.fin.ai/p/ai-is-approving-our-pull-requests)** — Kesha, Niamh Young, 2026-04
  How Fin let an AI reviewer approve PRs with no human: review is split into independent sub-agent lenses (problem statement, diff-to-intent, safety, logic, best practices), the reviewer won't approve large PRs, and auditors were brought in early. The pilot ran 100+ PRs with zero reverts, and 497 PRs went through fully autonomously in the first four weeks.
  Tags: `auto-approval`, `compliance`, `sub-agents`

- **[Imprint — Speeding up code review with `small-change`](https://lethain.com/small-changes/)** — Will Larson, 2026-10
  Median review time went from about 33 to 77 minutes while PRs per engineer rose about 4x, so Imprint added a fast path enforced by a CI check engineers cannot edit: under 1,000 lines, no p1/p2 findings from the review bot, an author with 10+ merged PRs in that service, few services touched and no shared libraries. About 10% of changes qualify, the review skill can only approve or ignore, and any error from a small change is treated as a system failure to fix in tooling, verification or CI.
  Tags: `auto-approval`, `review-policy`, `ci`

- **[PostHog — Stop being the code review bottleneck](https://x.com/posthog/status/2075645235724767739)** — Jinay Yoon, 2026-07
  A how-to with links to the actual SKILL.md files. The agent that wrote the code never reviews it, reviewers use different instructions, models and providers, and the StampHog auto-approver only stamps PRs with no conflicts, nothing on a deny list (auth, secrets, billing, public APIs) and under 500 lines and 20 files; it handled 1.6k PRs on its own in one month.
  Tags: `auto-approval`, `skills`, `small-prs`

- **[Razorpay — Razorpay Engineers Built Slash. Slash Builds the Rest.](https://razorpay.com/blog/razorpay-engineers-built-slash-slash-builds-the-rest/)** — Prabu Ram, 2026-05
  Slash Reviewer runs subagents for bugs, security, code quality, design system, i18n and a pre-mortem, scores severity against repo-specific review skills, and auto-approves low-severity PRs. About one in three Slash code reviews now merges with no human comments, and the post admits the same agent gives very different results across repos.
  Tags: `ai-review`, `auto-approval`, `india`

- **[Amp — "That's not SOC 2 compliant"](https://ampcode.com/notes/thats-not-soc-2-compliant)** — Will Dollman, 2026-08
  Amp ships to main with no PRs or mandatory review, and explains why its auditors did not require PRs: the Trust Services Criteria never mention git or pull requests. The controls are verified signatures on main, checks where "Bad changes block main" and commits linked to the agent threads that produced them, and the author suggests asking for each system: "What risks are our pull requests actually managing here?"
  Tags: `compliance`, `no-pr-workflow`, `audit-trail`

### AI reviewers and verification in production

- **[LinkedIn — High-Signal AI Code Review That Adapts to Your Codebase at Scale](https://www.linkedin.com/blog/engineering/ai/high-signal-ai-code-review-that-adapts-to-your-codebase-at-scale)** — Min Chen et al., 2026-08
  An in-house multi-model reviewer covering 40,000+ PRs a week: each subagent is a distinct model and harness pairing that cannot see the others, and findings flagged by two or more are elevated. Acceptance is measured against merged code (63.9% overall, from 80% for logic errors down to 40.6% for security), and hosted vendor reviewers were rejected partly because "You can't canary a vendor's model or prompt change."
  Tags: `ai-review`, `multi-model`, `evals`

- **[OpenAI — Custom Code Review rules for Codex](https://developers.openai.com/blog/custom-code-review-rules-for-codex)** — Hari Srikanth, 2026-07
  Review rules go in AGENTS.md (repo-wide in the root file, service rules in nested files), and an eval shows rule-guided variants recovered 98% of required repo-specific findings against 58.3% for the baseline. The guidance is to state the invariant and the safe path and to keep formatting and mechanical checks in CI. Borderline: product-feature post, included for the eval and the reusable rule guidance.
  Tags: `ai-review`, `agents-md`, `borderline`

- **[Anthropic — How the Claude Code team thinks about verification](https://claude.dev/blog/how-the-claude-code-team-thinks-about-verification/)** — Addy Osmani, 2026-11
  The Claude Code team's verification layer: a 39-item reliability checklist where each item has a trigger readable from the diff (usually 3 to 10 apply), a reviewer that reads REVIEW.md from the base branch and never from the PR, and a commit gate rolled out through off, observe and enforce modes. Claude brings in a human after 3 failed fix rounds, and the advice is "If you have to focus on one test type, pick end-to-end."
  Tags: `verification`, `commit-gates`, `review-md`

- **[Meta — Catching Bugs Before They Land: JiTTesting's Human-on-the-Loop Approach at Full Scale](https://engineering.fb.com/2026/10/29/security/catching-bugs-before-they-land-jittestings-human-on-the-loop-approach-at-full-scale/)** — Sreeja Thummala et al., 2026-10
  Tests are generated for each risky diff and designed to fail if the change alters behavior; engineers set criteria and review outcomes in aggregate and rarely read test code. In H1 2026 it helped catch 74 serious privacy bugs at diff stage with an engineer-reported 60% true-positive rate, and the post gives no false-negative rate or cost.
  Tags: `verification`, `test-generation`, `human-on-the-loop`

### Evidence: review is the constraint

- **[Harvard (Jellyfish data) — Artificial Intelligence in the Firm: Bottlenecks in Software Production](https://fion.ac/jellyfish.pdf)** — Fiona Chen, James Stratton, 2026-11
  Telemetry from 655 firms shows coding agents raise PRs about 36% but resolved Jira issues only about 14%, and time from review submission to merge rises 56.1%. 79.1% of firms adopted AI review tools, yet humans still write the overwhelming majority of reviews and 82.8% of reviews come from people already familiar with the code; the paper has not been peer reviewed.
  Tags: `evidence`, `review-bottleneck`, `research`

- **[Microsoft — Ten Months with Copilot Coding Agent in dotnet/runtime](https://devblogs.microsoft.com/dotnet/ten-months-with-cca-in-dotnet-runtime/)** — Stephen Toub, 2026-03
  Agent PRs measured against human baselines in the same repo: 535 of 878 agent PRs merged (67.9%) against 87.1% for Microsoft engineers, with reverts at 0.6% for agent PRs and 0.8% for the rest, a difference that is not statistically meaningful. On the review side, merged agent PRs drew 16.5 comments against 12.4 for human PRs, and the top two reviewers wrote 36% of human comments.
  Tags: `baselines`, `review-load`, `metrics`

## Patterns that show up across all of these

- **Scoped tickets, not free-running agents.** Every shipping fleet picks well-defined work; agents that try to do "anything" don't ship.
- **Plan → code → tests → PR is one atomic unit.** Humans review the PR, not the plan.
- **Submission authority, not merge authority.** The agent can open the PR but can't merge — Stripe pattern.
- **Revert rate as a leading indicator.** If revert rate creeps up, the harness needs tightening, not the model.
- **Auto-approval for a narrow, written class of change.** Several teams now go past submission-only authority for low-risk work. Anthropic needs no human approval for its low-risk tier once checks are green, Intercom's reviewer approves PRs alone, Imprint's `small-change` covers about 10% of changes, and PostHog and Razorpay auto-approve PRs that pass size, deny-list or severity checks.
- **Reviewers stay independent.** At PostHog the agent that wrote the code never reviews it, and reviewers use different instructions, models and providers. LinkedIn's subagents cannot see each other's findings.
- **Small PRs are a precondition.** Intercom's reviewer won't approve large PRs, StampHog stops at 500 lines and 20 files, and Imprint's fast path stops at 1,000 lines.
- **Reviewer rules live in the repo.** Anthropic's reviewer reads REVIEW.md from the base branch, OpenAI puts review rules in nested AGENTS.md files, and Razorpay scores against repo-specific review skills.

## Related

- [sdlc-coding.md](sdlc-coding.md): where the PR volume comes from
- [security.md](security.md): AI reviewers built for security findings
- [evals-qa.md](evals-qa.md) and [metrics.md](metrics.md)
- Orgs: [Anthropic](../orgs/anthropic.md), [Stripe](../orgs/stripe.md), [Intercom](../orgs/intercom.md), [PostHog](../orgs/posthog.md), [Razorpay](../orgs/razorpay.md), [Meta](../orgs/meta.md), [Microsoft](../orgs/microsoft.md), [OpenAI](../orgs/openai.md), [Sourcegraph (Amp)](../orgs/sourcegraph.md)
- People: [Will Larson](../people/will-larson.md), [Addy Osmani](../people/addy-osmani.md), [Stephen Toub](../people/stephen-toub.md)

## What's still missing here

- Recall numbers for AI reviewers. LinkedIn and Anthropic report acceptance and outcomes, and Meta gives no false-negative rate. Few teams say what their reviewer misses.
- Circuit breakers that tighten approval rules when reverts rise. Anthropic lists this as an open problem.
- A standalone write-up on enforcing AGENTS.md rules at commit time or in CI. Today it only shows up inside broader posts, such as Anthropic's commit gate and Intercom's Claude Code hooks (see [Brian Scanlan](../people/brian-scanlan.md)).
- How AI reviewers handle the business and UX context that human reviewers carry. Still no data.

This page can grow. Open a PR.

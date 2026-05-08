# Code review & PR workflow

> The "QA bottleneck" problem — features ship faster, review can't keep up. Where humans actually sit in the loop.

## Practitioner sources

- 🟢 **[Stripe Minions](https://stripe.dev/blog/minions-stripes-one-shot-end-to-end-coding-agents)** — 1,300+ agent PRs/week. Humans review every PR before merge. Agents have submission authority, not merge authority.
- 🟢 **[Stripe Minions Part 2](https://stripe.dev/blog/minions-stripes-one-shot-end-to-end-coding-agents-part-2)** — what they learned operating Minions in production
- **[Cursor — agents control their own computers](https://cursor.com/blog/agent-computer-use)** — 35% of merged PRs from cloud agents in isolated VMs
- **[Block — AI-Assisted Development at Block](https://engineering.block.xyz/blog/ai-assisted-development-at-block)** — 95% adoption, RPI (Research → Plan → Implement) for complex work
- **[OpenAI Codex — Harness engineering](https://openai.com/index/harness-engineering/)** — 1M LOC over 5 months with 0% manual code, 0% manual review (extreme case)

## Patterns that show up across all of these

- **Scoped tickets, not free-running agents.** Every shipping fleet picks well-defined work; agents that try to do "anything" don't ship.
- **Plan → code → tests → PR is one atomic unit.** Humans review the PR, not the plan.
- **Submission authority, not merge authority.** The agent can open the PR but can't merge — Stripe pattern.
- **Revert rate as a leading indicator.** If revert rate creeps up, the harness needs tightening, not the model.

## What's underexplored

- How code-review agents lose business/UX context that human reviewers have
- The "review the reviewer" problem — when an AI reviews AI-generated code

This page can grow. Open a PR.

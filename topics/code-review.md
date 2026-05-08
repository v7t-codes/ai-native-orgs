# Code review & PR workflow

> The "QA bottleneck" problem — features ship faster, review can't keep up. Where humans actually sit in the loop.

## Practitioner sources

- 🟢 **[Stripe Minions](../orgs/stripe.md)** — 1,300+ agent PRs/week, humans review before merge. The reference scale.
- 🟢 **[Ramp Inspect](../orgs/ramp.md)** — >50% PRs agent-originated, similar review pattern at smaller scale.
- **[Cursor cloud agents](../orgs/cursor.md)** — ~35% of Cursor's own PRs come from cloud agents.
- **[Block — AI-Assisted Development](../orgs/block.md)** — 30–40% code generation in legacy codebases, with the maturity ladder.

## Patterns that show up across all of these

- **Scoped tickets, not free-running agents.** Every shipping fleet picks well-defined work; agents that try to do "anything" don't ship.
- **Plan → code → tests → PR is one atomic unit.** Humans review the PR, not the plan.
- **Revert rate as a leading indicator.** If revert rate creeps up, the harness needs tightening, not the model.

## What's underexplored

- How code-review agents lose business/UX context that human reviewers have
- The "review the reviewer" problem — when an AI reviews AI-generated code

This page can grow. Open a PR.

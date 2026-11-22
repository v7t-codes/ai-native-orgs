# Brian Scanlan

Senior Principal Engineer at Intercom (Fin). Writes about how Intercom runs Claude Code across R&D: skills, hooks, plugins and telemetry.

**Where to follow:**
- Blog: [ideas.fin.ai](https://ideas.fin.ai)

## Best pieces

- **[Claude Code: Good skills, bad skills](https://ideas.fin.ai/p/claude-code-good-skills-bad-skills)** — Brian Scanlan, 2026-07
  What a centralized skills repo looks like at scale: 267 skills from 153 contributors (31% of R&D), a 7-category review rubric, a public subset at github.com/intercom/2x-skills, and hooks that force a skill to load, such as secure-github-actions when a workflow file is edited. Good skills do one thing, push deterministic parts into scripts and have owners and evals; bad ones repeat the same mistakes and are too large to read in one pass.
  Tags: `skills`, `governance`, `harnesses`, `practitioner-bylined`

- **[How we use Claude Code today at Intercom](https://ideas.fin.ai/p/how-we-use-claude-code-today-at-intercom)** — Brian Scanlan, 2026-03
  A concrete account of enforcing agent rules with hooks: a PreToolUse hook blocks raw `gh pr create` unless the create-pr skill ran, another blocks edits to merged PR branches, and a weekly GitHub Action fact-checks every CLAUDE.md. The 13 plugins and 100+ skills ship to Macs through JAMF, and 14 lifecycle event types go to Honeycomb.
  Tags: `hooks`, `skills`, `enforcement`, `practitioner-bylined`

## Why he matters here

Most skills advice is about writing one good skill. Brian writes about running hundreds of them across an R&D org: who owns them, how they get reviewed, and how hooks make the important ones load every time. The org-level numbers behind this work are in [Intercom](../orgs/intercom.md), and the wider pattern is in [harnesses](../topics/harnesses.md).

# Anthropic

> Sets a lot of the vocabulary for the AI-native eng space — "harness", "guides", "sensors", "ratchet". Their internal tooling posts are some of the most-cited.

## Practitioner sources

- 🟢 **[Effective harnesses for long-running agents](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents)** — Anthropic Engineering
  The canonical primitives — initializer agent, session-to-session progress files, init.sh + claude-progress.txt + JSON feature lists, baseline git commits. If you're designing a harness for work that spans hours or days, this is the framework most teams converge on.
  Tags: `harnesses`, `agent-architecture`

- **[Scaling Managed Agents: Decoupling the brain from the body](https://www.anthropic.com/engineering/managed-agents)** — Anthropic Engineering
  How to run agents at fleet scale — orchestration, failure recovery, the operational primitives.
  Tags: `harnesses`, `agent-architecture`

- **[Harness design for long-running application development](https://www.anthropic.com/engineering/harness-design-long-running-apps)** — Anthropic Engineering
  Companion piece — the application-development specifics that complement the long-running-agents post.
  Tags: `harnesses`, `application-development`

- **[How Anthropic teams use Claude Code](https://claude.com/blog/how-anthropic-teams-use-claude-code)** — Anthropic
  Internal write-up of how different Anthropic teams use their own tools. Sales-y framing but the practitioner specifics inside (data infra onboarding, product eng "first stop" pattern, lawyers building phone trees) are real.
  Tags: `claude-code`, `tooling`, `internal`

- **[Claude Code best practices](https://code.claude.com/docs/en/best-practices)** — Anthropic
  Treat the docs as primary source — the skills/plugins/hooks model is now industry-standard.
  Tags: `claude-code`, `docs`

## Voices to follow

- **[@bcherny](https://x.com/bcherny)** — Boris Cherny, Claude Code creator. The "vanilla setup" CLAUDE.md tweet became a reference.
- **[@AnthropicAI](https://x.com/AnthropicAI)** — corporate but technical posts get linked here when they fit the bar

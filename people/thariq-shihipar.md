# Thariq Shihipar

Member of technical staff at Anthropic, working on Claude Code. Writes about how the Claude Code team uses skills, context and task-specific harnesses.

**Where to follow:**
- X: [@trq212](https://x.com/trq212)
- Blog: [claude.dev/blog](https://claude.dev/blog/)

## Best pieces

- 🟢 **[Lessons from Building Claude Code: How We Use Skills](https://claude.dev/blog/lessons-from-building-claude-code-how-we-use-skills/)** — Thariq Shihipar, 2026-06
  How Anthropic runs hundreds of internal skills: nine categories, a "gotchas" section as the most valuable part, and a marketplace with no central owner where skills start in a sandbox folder and move in by PR once they gain traction. Verification skills had the most measurable impact, and a PreToolUse hook logs skill use across the company to find popular skills and ones that under-trigger.
  Tags: `skills`, `harnesses`, `practitioner-bylined`

- **[The new rules of context engineering for Claude 5 generation models](https://claude.dev/blog/the-new-rules-of-context-engineering-for-claude-5-generation-models/)** — Thariq Shihipar, 2026-07
  Anthropic removed over 80% of Claude Code's system prompt for Claude 5-generation models and reports no measurable loss on its coding evals, though it publishes no numbers. The six shifts behind the cut (rules to judgement, examples to interface design, progressive disclosure, simple tool descriptions, auto-memory, rich references) work as a guide to slimming your own CLAUDE.md or AGENTS.md.
  Tags: `context-engineering`, `agents-md`, `memory`

- **[A harness for every task: dynamic workflows in Claude Code](https://claude.dev/blog/a-harness-for-every-task-dynamic-workflows-in-claude-code/)** — Thariq Shihipar, Sid Bidasaria, 2026-06
  Names three ways a single long context fails (agentic laziness, self-preferential bias, goal drift) and answers with task-specific harnesses the model writes itself, run as isolated subagents, using six patterns such as adversarial verification and tournament. Borderline: a product launch with a real pattern catalog but no measured comparison against static harnesses.
  Tags: `harnesses`, `subagents`, `borderline`

## Why he matters here

Thariq's posts are the most direct public record of how the Claude Code team thinks about skills and context, and they are a good guide to trimming your own agent files. Read them with [Addy Osmani](addy-osmani.md) on review and verification and [Boris Cherny](boris-cherny.md) on the minimal setup. The wider picture is in [memory and context](../topics/memory-and-context.md) and [harnesses](../topics/harnesses.md).

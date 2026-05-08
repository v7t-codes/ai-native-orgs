# Internal tooling & agent harnesses

> The biggest section by volume. The "harness" vocabulary fully crystallized in the last ~6 months — Anthropic, OpenAI, Cursor, LangChain, Martin Fowler, Phil Schmid, Addy Osmani all converged on the same primitives.

## The primitives most teams converged on

- **Guides + sensors** — the ambient context the agent has access to (codebase, recent edits, build status)
- **Planner / generator / evaluator** — separate the planning step from the writing step from the checking step
- **Ratchet principle** — once a check passes, don't let the agent regress past it
- **Initializer + worker pattern** — one agent sets up the env once, another iterates session-to-session, with explicit hand-off artifacts (Anthropic's `init.sh` + `claude-progress.txt`)

## Practitioner sources

- 🟢 **[Anthropic — Effective harnesses for long-running agents](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents)** — the canonical primitives
- 🟢 **[OpenAI — Harness engineering: leveraging Codex in an agent-first world](https://openai.com/index/harness-engineering/)** — engineer-bylined, 1M LOC / 0% manual code over 5 months
- 🟢 **[Ramp Labs — Latent Briefing](https://x.com/RampLabs/status/2042660310851449223)** — KV cache compaction for multi-agent context sharing
- **[Anthropic — Scaling Managed Agents](https://www.anthropic.com/engineering/managed-agents)** — operational primitives at fleet scale
- **[Anthropic — Harness design for long-running application development](https://www.anthropic.com/engineering/harness-design-long-running-apps)** — companion to the long-running-agents post
- **[Latent Space — Extreme Harness Engineering interview with Ryan Lopopolo](https://www.latent.space/p/harness-eng)** — the longer-form version of the OpenAI Codex story
- **[Will Larson — Building internal agents (series)](https://lethain.com/agents-series/)** — building one in public, weekly. [Subagents](https://lethain.com/agents-subagents/) and [Skills](https://lethain.com/agents-skills/) chapters are especially useful.
- **[Karpathy — autoresearch](https://github.com/karpathy/autoresearch)** — the personal-stack, single-GPU version of harnesses for research agents
- **[Block — Goose](https://github.com/block/goose)** — the open-source agent that Stripe forked to build Minions

## Voices

- [Will Larson](../people/will-larson.md)
- [Boris Cherny](../people/boris-cherny.md)
- [Niko Grupen (Harvey)](../people/niko-grupen.md) — agentic harnesses for legal AI

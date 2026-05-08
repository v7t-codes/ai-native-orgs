# Internal tooling & agent harnesses

> The biggest section by volume. The "harness" vocabulary fully crystallized in the last ~6 months — Anthropic, OpenAI, Cursor, LangChain, Martin Fowler, Phil Schmid, Addy Osmani all converged on the same primitives.

## The primitives most teams converged on

- **Guides + sensors** — the ambient context the agent has access to (codebase, recent edits, build status)
- **Planner / generator / evaluator** — separate the planning step from the writing step from the checking step
- **Ratchet principle** — once a check passes, don't let the agent regress past it

## Practitioner sources

- 🟢 **[Anthropic — Effective harnesses for long-running agents](../orgs/anthropic.md)** — the canonical primitives
- 🟢 **[Ramp Labs — Latent Briefing](../orgs/ramp.md)** — KV cache compaction for multi-agent context sharing
- 🟢 **[OpenAI — Codex Harness Engineering](../orgs/openai.md)** — engineer-bylined deep dive
- **[Anthropic — Scaling Managed Agents](../orgs/anthropic.md)** — the operational primitives at fleet scale
- **[Will Larson — agents-series (scaffolding, subagents, transcripts)](https://lethain.com/agents-series/)** — building one in public
- **[Karpathy nanochat skills directory](https://github.com/karpathy/nanochat)** — the personal-stack version

## Voices

- [Will Larson](../people/will-larson.md)
- [Boris Cherny](../people/boris-cherny.md)
- [Niko Grupen (Harvey)](../people/niko-grupen.md) — agentic harnesses for legal AI

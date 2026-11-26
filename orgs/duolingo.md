# Duolingo

> Duolingo's DevX AI team runs internal agents for engineers on one shared platform and writes up how each agent was built.

**The headline:** A production-ready internal agent now takes about 10 minutes to set up, down from several weeks.

## Practitioner sources

- **[Making production-ready agents the default: building Duolingo's agent platform](https://blog.duolingo.com/production-ready-ai-agent-platform/)** — Guadalupe Aliseda-Canton, 2026-08
  An agent is a registry entry (owner, prompt, model, MCP servers, output type), and a Temporal-based platform handles execution, retries, credentials and cost tracking, which cut production-ready setup from several weeks to about 10 minutes. Its eval graders check the actual git diff (required and forbidden changes, max files changed, no-op consistency), so a plausible summary alone does not pass.
  Tags: `harnesses`, `agent-platform`, `evals`

- **[We tried 'Claude, fix this bug' - here's what actually worked](https://blog.duolingo.com/ai-bug-fixing-agent/)** — Shelby Wengreen, 2026-11
  A bug-fixing pipeline in stages (relevant code, user activity, live experiments, recent PRs, repro steps, suggested owner), each writing its findings to files so later agents keep a clean context. A feature-research stage was added after early fixes ignored the repo's conventions. Borderline: no fix rate or merged-PR count.
  Tags: `harnesses`, `bug-fixing`, `context-engineering`, `borderline`

## Related

- [Internal tooling & agent harnesses](../topics/harnesses.md)
- [Memory, context files & skills](../topics/memory-and-context.md)

## What's still missing here

Neither post reports outcomes: how many agent fixes merge, or how often the platform's agents run.

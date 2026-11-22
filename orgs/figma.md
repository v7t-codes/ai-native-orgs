# Figma

> Figma's security team runs agents at code generation, PR review, repo-wide audits and alert triage, and publishes the precision, recall and memory design behind them.

**The headline:** Agent PR review went from **15%** valid findings in shadow mode to **80% precision** within a month, at a median of about **$0.50 per review**. An alert-triage agent cut time to resolution by around **70%**.

## Practitioner sources

- 🟢 **[How Figma stays ahead of vulnerabilities with agents](https://www.figma.com/blog/how-figma-stays-ahead-of-vulnerabilities-with-agents/)** — Rohan Sharma, Liam Buchan, Dave Martin, 2026-07
  One 99-line security policy built from 68 precedents works as the threat model for agents at code generation (hooks), PR review and repo-wide audits. On 66 real vulnerabilities that had escaped human review the combined catch rate was 75.8%, and hooks steered agents more reliably than the same guidance in AGENTS.md.
  Tags: `security`, `code-review`, `hooks`

- **[How we secure Figma's internal systems with agents](https://www.figma.com/blog/how-we-secure-figmas-internal-systems-with-agents/)** — Matthew Sullivan, Brad Girardeau, 2026-07
  A memory design for an operational security agent: case memory (RAG over past alerts), steering memory in markdown, state records and procedural memory for schema discoveries. Saving every lesson as steering memory started overriding the agent's behavior, PR drafting moved from the prompt to a deterministic post-step, and time to resolution fell around 70%.
  Tags: `security`, `memory`, `operations`

## Related

- [Security](../topics/security.md)
- [Memory and context](../topics/memory-and-context.md)
- [Code review & PR workflow](../topics/code-review.md)

## What's still missing here

Both posts come from the security team. Neither covers how coding agents changed Figma's product engineering SDLC.

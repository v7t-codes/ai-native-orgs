# Lance Martin

Engineer at Anthropic. Writes about context engineering and agent memory, and measures the claims.

**Where to follow:**
- X: [@RLanceMartin](https://x.com/RLanceMartin)
- Blog: [rlancemartin.github.io](https://rlancemartin.github.io/)

## Best pieces

- 🟢 **[The components of agent memory](https://www.anthropic.com/research/components-of-agent-memory)** — Lance Martin, 2026-11
  Splits agent memory into four layers (transcripts, notes, maintained wikis, context injected at startup) plus offline "dreaming" passes that clean up notes, and measures each: on a ~350k-file corpus, wiki plus search scored 61% against 53% for search alone. Honest on limits: a wrong note carries into every session, and concurrent agents overwrote each other's work.
  Tags: `memory`, `context-engineering`, `evals`

- **[Context Engineering for Agents](https://rlancemartin.github.io/2025/06/23/context_engineering/)** — Lance Martin, 2025-06
  Groups context engineering into four strategies (write, select, compress, isolate) with examples from agents in use, such as scratchpads written to files and memories reused across sessions. The vocabulary later posts in this repo assume.
  Tags: `context-engineering`, `memory`, `foundational`

## Why Lance matters here

The 2025 post named the strategies and the 2026 Anthropic post measured one of them. See [memory, context files & skills](../topics/memory-and-context.md).

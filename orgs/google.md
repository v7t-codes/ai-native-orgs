# Google

> Google's public engineering material on AI-native work is strongest on security: agents that find, triage and fix vulnerabilities inside the SDLC. Large code migrations are the second thread.

**The headline:** On V8 from April to September 2026, the BigSleep agent found **45** actionable vulnerabilities against **37** for the Fuzzilli fuzzer, with about **25% overlap**. Pre-submit security agents scan every check-in, and the triage agent reaches **over 92% precision**.

## Practitioner sources

- 🟢 **[Changing the game: Using agentic AI to secure infrastructure code](https://cloud.google.com/blog/topics/systems/using-ai-agents-to-secure-google-infrastructure)** — Andrés Lagar-Cavilla, Stella Voutsina, Parthasarathy Ranganathan, 2026-09
  Agentic security scanning runs on every change before submit, with a triage agent at over 92% precision and threat models kept local to each codebase (false positives down to 3% in some cases). It advises separate harnesses, rules and context for development, scanning and triage agents to avoid bias, and it reports no recall or fix-acceptance data.
  Tags: `security`, `code-review`, `verification`

- **[Fuzzers vs. AI: Comparing Fuzzilli and BigSleep on JavaScript Engines](https://projectzero.google/2026/10/fuzzing-v-AI.html)** — Samuel Groß, 2026-10
  A careful head-to-head of an LLM bug-finding agent and a mature fuzzer on V8: BigSleep found 45 vulnerabilities to Fuzzilli's 37 with only 20 of 81 shared, and it rediscovered about 62% of 112 historic Fuzzilli bugs. The conclusion is that the two complement each other, since BigSleep runs once a day and reports 1-2 days late while Fuzzilli picks up changes within hours.
  Tags: `security`, `fuzzing`, `evals`

- **[Stronger with every update: How we're making Chrome and the web safer in the AI Era](https://blog.google/security/chrome-stronger-with-every-update/)** — Chrome Security Team, 2026-07
  AI at each stage of Chrome's security lifecycle: finding, four-phase automated triage, a fixing agent whose candidate fixes a critic agent ranks, and Big Sleep plus CodeMender in CI every 24 hours. Chrome 149 and 150 fixed 1,072 security bugs, more than the previous 23 milestones combined. Borderline: team byline with no named engineers.
  Tags: `security`, `ci`, `borderline`

- **[Pioneering AI-assisted code migration: How Google achieved 6x faster migration from TensorFlow to JAX](https://cloud.google.com/blog/topics/developers-practitioners/6x-faster-migration-from-tensorflow-to-jax)** — Jamie Rogers, Parthasarathy Ranganathan, 2026-05
  A verification-first migration: compiler-based static analysis orders the work from leaf layers up, a coder agent runs a test-and-fix loop, and gradient ascent searches for the largest error between each old and new layer. It reports a 6.4x to 8x speedup on YouTube production models and says single-agent attempts overwrote critical files or skipped functionality. Borderline: product and VP byline; the engineering depth is in the linked paper (Nikolov et al., arXiv:2603.27296).
  Tags: `legacy-modernization`, `migration`, `verification`, `borderline`

## Related

- [Security](../topics/security.md)
- [Legacy modernization](../topics/legacy-modernization.md)
- [Evals & QA](../topics/evals-qa.md)

## What's still missing here

There is no primary Google engineering source on how much internal code AI writes in 2026 or how Google measures it; the figures that circulate come from the CEO. Also missing: a Jules internal-usage write-up with numbers, a 2026 CodeMender update, a Big Sleep results post with a named author, and a follow-up to Google's earlier post on AI for internal code migrations.

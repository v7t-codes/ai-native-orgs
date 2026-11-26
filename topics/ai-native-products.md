# AI-native products

> When AI is in the product critical path, not just internal tooling. The reliability and UX questions are different.

This page is intentionally smaller than the eng-internal sections — most of the public practitioner content right now is about internal tooling. AI-native product engineering is younger and less openly written about.

## Practitioner sources

- 🟢 **[Cognition — Multi-Agents: What's Actually Working](https://cognition.com/blog/multi-agents-working)** — Walden Yan, 2026-04
  The follow-up to "Don't Build Multi-Agents" from inside Devin: writes stay single-threaded and extra agents add intelligence, such as a clean-context reviewer (Devin Review catches about 2 bugs per PR, roughly 58% severe) and a "smart friend" setup that pairs the fast SWE-1.5 model with Sonnet 4.5 as a planning tool. Enterprise Devin usage grew about 8x over 6 months, and the post lists failures that remain, such as child agents not reporting back to the manager by default.
  Tags: `multi-agent`, `agent-architecture`, `devin`

- **[Cognition — Verifying Agentic Development at Scale](https://cognition.com/blog/testing-development)** — Ido Pesok, 2026-05
  How Devin tests its own PRs end to end with computer use: a test plan grounded in source code first, assertions marked passed, failed or untested, and a deterministic login script kept as a testing skill in the repo. It lists the early failure modes (over-testing unrelated areas, getting stuck in setup, running JavaScript to force UI states) and notes that async triggers now outnumber interactive sessions.
  Tags: `verification`, `computer-use`, `product-reliability`

- **[Harvey — Training a Legal Agent With Applied Compute](https://www.harvey.ai/blog/training-a-legal-agent-with-applied-compute)** — Niko Grupen et al., 2026-06
  Post-training inside the product's own harness: grader checks, harness fixes and compaction came before RL, which raised rubric pass rate on Harvey's benchmark from 0.853 to 0.913 and cut tool calls. The clearest public account of an application company training its own model.
  Tags: `post-training`, `rl`, `graders`

- **[Decagon — Why off-policy training isn't enough: SFT, RL, and the limits of imitation](https://decagon.ai/blog/why-off-policy-training-isnt-enough)** — Cyrus Asgari, 2026-03
  Over 80% of Decagon's model traffic runs on models it trained. A classifier distilled from a frontier teacher had to be retrained whenever customers changed their category definitions; SFT, then on-policy distillation, then RL on the verifiable label produced one a prompt update can correct.
  Tags: `post-training`, `distillation`, `rl`

- See [topics/reliability.md](reliability.md) for failure-mode patterns
- See [orgs/anthropic.md](../orgs/anthropic.md) for Claude as product
- See [orgs/openai.md](../orgs/openai.md) for Codex / ChatGPT as products
- See [orgs/cognition.md](../orgs/cognition.md) for more on Devin
- See [orgs/sierra.md](../orgs/sierra.md) for Sierra's posts on building and evaluating its agents
- See [orgs/replit.md](../orgs/replit.md) for how Replit evaluates and improves Replit Agent
- See [orgs/vercel.md](../orgs/vercel.md) for Vercel's evals of software that agents use
- See [orgs/harvey.md](../orgs/harvey.md), [orgs/decagon.md](../orgs/decagon.md) and [orgs/thinking-machines.md](../orgs/thinking-machines.md) for post-training at application companies and the recipes behind it
- See [orgs/effective-ai.md](../orgs/effective-ai.md) for an insurance agent that writes against a domain compiler

## What's still missing here

- Safe A/B testing of AI features ("AI as a feature flag").
- Latency budgets when the AI call is in the user-visible path.
- Pricing when token cost is close to the marginal cost of a user.
- Published numbers on how well offline evals predict live user outcomes for a shipped agent.

This page is thin. Open a PR.

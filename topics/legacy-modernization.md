# Legacy modernization & verification-first rewrites

> The best rewrites of 2026 share one idea: the old code and its tests act as the referee. Bun moved about 1M lines from Zig to Rust in 11 days against its existing language-independent test suite. GitHub ported the Copilot runtime to Rust in place, gated by end-to-end tests the agents could not change without consent. Agents supply the volume. The old system's behavior decides what counts as done.

## What the best teams converged on

- **The old system is the spec.** Bun ran ~60k language-independent tests per platform. Shopify's written specs went stale, so the running legacy app became the spec. Cursor graded its SQLite rebuild on a held-out test suite the agents never saw. Google searches for the maximum error between each old TensorFlow layer and its JAX replacement.
- **Build the feedback loop before you migrate.** Shopify built device-free business logic and a CLI that loads screens in milliseconds before moving any screens. Grab had agents scaffold the missing medium tests for ~400 services so the Distroless change could be gated.
- **Fence off what the agent may change.** GitHub's agents may not edit E2E tests without consent, because a changed test signals a porting bug. Grab's agents may only touch test files and CI config, enforced before every commit. Bun added rules after agents stubbed functions and ran git stash/reset.
- **Let deterministic tools do the planning.** Stripe's AutoJDK computes upgrade eligibility from the live build graph. Google's planner uses compiler-based static analysis and migrates leaf layers first. Microsoft's experts approve a knowledge base of fixes, and agents apply it across the codebase.
- **Many narrow agents beat one big one.** Bun paired each implementer with two adversarial reviewers and a fixer. Brex's single large agent hallucinated methods and bypassed validation gates; its working pipeline splits generation from validation and uses eleven narrow skills. Google's single-agent attempts overwrote critical files or skipped functionality.
- **Green CI is not the finish line.** Spotify names "passes CI but is wrong" as the worst failure and runs an LLM judge that vetoes about a quarter of sessions. At Brex, some test-passing PRs caused subtle production bugs.

## Practitioner sources

### Whole-system rewrites

- 🟢 **[Bun — Rewriting Bun in Rust](https://bun.com/blog/bun-in-rust)** — Jarred Sumner, 2026-07
  About 1M lines moved from Zig to Rust in 11 days (~$165k at API pricing), with Bun's language-independent TypeScript test suite as the referee. Each task had one implementer, two adversarial reviewers and one fixer, and the post is open about the costs: 19 known regressions (each fixed) and new rules after agents stubbed functions and ran git stash/reset.
  Tags: `rewrite`, `rust`, `verification-first`, `adversarial-review`

- 🟢 **[GitHub — Migrating the GitHub Copilot runtime to Rust, using Copilot](https://github.blog/ai-and-ml/generative-ai/migrating-the-github-copilot-runtime-to-rust-using-copilot/)** — Stephen Toub, 2026-09
  The incremental, in-place counterpart to Bun: 128 port PRs over ~14.5 weeks while 135 releases shipped from main, with existing E2E tests gating every merge and each PR deleting the old code in the same change. The failure list shows what conformance tests miss, such as an agent applying a schema-break waiver to a PR that had dropped an SDK method, and one parallel session merging another session's worktree changes.
  Tags: `rewrite`, `rust`, `incremental-migration`, `verification-first`

- **[Cursor — Agent swarms and the new model economics](https://cursor.com/blog/agent-swarm-model-economics)** — Wilson Lin, 2026-07
  Agents rebuilt SQLite in Rust from its 835-page manual and were graded on a held-out sqllogictest suite they never saw; every new configuration passed 100%. Total cost still ranged from $1,339 to $10,565 by planner/worker model mix (about 8x), and the old swarm's 70,000+ merge conflicts fell under 1,000 with a new harness that added its own VCS. Limits: one task, one run per configuration.
  Tags: `rewrite`, `held-out-tests`, `model-economics`, `harnesses`

- **[Microsoft — Cheap code, precious trust: Code modernization at scale](https://commandline.microsoft.com/agentic-software-engineering-large-scale-code-migration-language-modernization-spec-driven-development/)** — Sriram Rajamani, Tim Bozarth, 2026-10
  Microsoft's playbook for very large migrations, including moving the Windows codebase (several hundred million lines) to support Clang/LLVM, and C/C++ to Rust. Experts approve a knowledge base of fixes that agents apply, migration goes feature by feature with differential and held-out tests, and agents infer TLA+ specs that TLC checks against traces. Borderline: corporate VP byline and no outcome metrics, included for unusually specific method detail.
  Tags: `migration`, `rust`, `formal-methods`, `verification-first`, `borderline`

### App and framework rebuilds

- 🟢 **[Shopify — How we rebuilt the Shopify app in 12 weeks](https://shopify.engineering/shopify-app-rebuild)** — Remi Vanhee, 2026-11
  About 30 engineers in pairs rebuilt a 300+ screen app in 12 weeks by building the feedback loop first: device-free business logic and a CLI that loads screens in milliseconds. Written specs went stale almost at once, so the running legacy app became the spec, and an agent turned each day's review comments into updates to skills and Architecture.md; Android P50 launch fell from 1.71s to 0.87s.
  Tags: `rewrite`, `mobile`, `verification-first`, `skills`

- **[Shopify — Helix: The internal tool powering our Shopify app's native migration](https://shopify.engineering/helix)** — Talha Naqvi, 2026-09
  The gate design behind the rebuild. Every checkpoint must pass behavior tests against a CLI, a screenshot diff where a model must list every difference, two context-isolated adversarial reviewers, and engineer approval, and no failed gate can be overridden. Pixel diffing did not work because the two UI frameworks never produce identical output.
  Tags: `migration`, `gates`, `adversarial-review`, `mobile`

- **[Google — Pioneering AI-assisted code migration: How Google achieved 6x faster migration from TensorFlow to JAX](https://cloud.google.com/blog/topics/developers-practitioners/6x-faster-migration-from-tensorflow-to-jax)** — Jamie Rogers, Parthasarathy Ranganathan, 2026-05
  Static analysis plans the order (leaf layers first), agents translate in a test-and-fix loop, and gradient ascent searches for the maximum error between each old TensorFlow layer and its JAX version. Google reports a 6.4x to 8x speedup over manual migration on YouTube production models. Borderline: blog by a product head and a VP; the engineering detail is in the linked paper (Nikolov et al., arXiv:2603.27296).
  Tags: `migration`, `ml-frameworks`, `verification-first`, `borderline`

### Fleet-wide upgrades

- **[Stripe — Modern Java at Stripe: Language upgrades as a service](https://stripe.dev/blog/modern-java-at-stripe-language-upgrades-as-a-service)** — Mahib Hosain, Cara Mecozzi, 2026-05
  Splits a migration between deterministic tooling and agents: AutoJDK computes upgrade eligibility from the live build graph and generates bounded, reviewable PRs, while Minions launched from Slack fix minor failures. JDK 17 reached 93%+ service-level adoption in under a week of rollout, and risky targets are deliberately skipped.
  Tags: `migration`, `java`, `deterministic-tooling`

- **[Brex — Agent automations for big migrations: How we accelerated framework upgrades by 32x with Cursor](https://www.brex.com/journal/agent-automations-for-big-migrations)** — Sofhia de Souza Gonçalves, 2026-07
  A Micronaut upgrade split into a PR-generation agent and a PR-validation agent, with eleven narrow skills that each cover one failure class. One engineer migrated 180 services in a month, against 50 in a quarter for three engineers by hand, and the post admits some test-passing PRs caused subtle production bugs.
  Tags: `migration`, `framework-upgrade`, `lessons`

- **[Grab — Scaling out Distroless adoption With AI](https://engineering.grab.com/scaling-out-distroless-adoption-with-ai)** — Jia Yee Chong, Kevin Jun Hong Lee, Shi Kai Ng, 2026-06
  Roughly 400 services lacked the medium tests needed to gate a move to Distroless images, so agents first scaffolded those tests, then ran a patch-test-compare loop on Dockerfiles. Agents may only edit test files and CI config, enforced before every commit, and effort fell from 1-3 days per repo by hand to about 0.1 days per service.
  Tags: `migration`, `containers`, `verification-first`, `guardrails`

- **[Spotify — Background Coding Agents: Predictable Results Through Strong Feedback Loops (Honk, Part 3)](https://engineering.atspotify.com/2025/12/feedback-loops-background-coding-agents-part-3)** — Max Charas, Marc Bruggmann, 2025-12
  The verification design behind Honk, Spotify's background coding agent: verifiers switch on by repo contents, sit behind MCP, and run in a stop hook before any PR opens. An LLM judge reading the diff and the original prompt vetoes about a quarter of sessions, and the team admits it has not yet built evals for the judge.
  Tags: `migration`, `verifiers`, `llm-judge`, `harnesses`

### COBOL and mainframe

- **[American Express — Agentic Method for Deterministic Validation of Legacy Code Migration](https://arxiv.org/abs/2607.28271)** — Andras Ferenczi et al., 2026-07
  A bank's engineers build the verification harness before trusting a COBOL-to-Java rewrite: both versions run off the mainframe with mocks, and an agent searches inputs to reach branches and checks that outputs match. It reached 91.90% branch coverage (397 of 432) on an internal 4,114-line batch program, and the threats-to-validity section admits that parity preserves legacy bugs and that branch coverage is an imperfect proxy.
  Tags: `cobol`, `mainframe`, `verification-first`, `differential-testing`

## Related

- [AI-DLC & spec-driven development](aidlc-and-spec-driven.md) — where written specs help and where they go stale
- [Evals & QA](evals-qa.md) — held-out tests and LLM judges
- [Code review & PR workflow](code-review.md) — adversarial reviewer agents
- [Internal tooling & agent harnesses](harnesses.md)
- [Version control at agent scale](version-control.md)
- Orgs: [Shopify](../orgs/shopify.md), [Stripe](../orgs/stripe.md), [GitHub](../orgs/github.md), [Microsoft](../orgs/microsoft.md), [Google](../orgs/google.md), [Spotify](../orgs/spotify.md), [Cursor](../orgs/cursor.md), [Anthropic](../orgs/anthropic.md) (Bun team)
- People: [Stephen Toub](../people/stephen-toub.md)

## What's still missing here

- A COBOL or mainframe modernization with production outcomes. The American Express paper covers the verification harness on programs of 430 to 4,114 lines; every other rewrite here is a modern codebase (Zig, TypeScript, Java, C++), and other public mainframe material is vendor-only so far.
- A primary engineering write-up behind Amazon's widely cited Java upgrade savings.
- Uber's agentic migration tooling appears only in a conference listing and secondary summaries.
- Microsoft asks "Can we trust specifications written by AI?" No one has answered it with data yet.

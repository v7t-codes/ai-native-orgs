# OpenAI

> The Codex team publishes some of the most direct "this is how we ship with our own agents" content. Coined the term "harness engineering" in its current usage. Later 2026 posts cover rebuilding git for agent load, agent-run performance triage, review rules in AGENTS.md and securing always-on internal agents.

**The headline:** As load on the monorepo grew, the old git backend's reliability at times fell below 90%. OpenAI kept the git protocol, rebuilt the backend (Pando) in 10 weeks, and cut median push latency nearly 5x.

## Practitioner sources

### Shipping with Codex

See also: [Harnesses](../topics/harnesses.md), [Code review](../topics/code-review.md), [SDLC and coding](../topics/sdlc-coding.md)

- 🟢 **[Harness engineering: leveraging Codex in an agent-first world](https://openai.com/index/harness-engineering/)** — Ryan Lopopolo (OpenAI), 2026-02
  The 5-month internal experiment: ~1M lines of code, beta product, **0% manually-written source code, 0% manual review**. The discipline they call "harness engineering" — designing the constraints, feedback loops, docs structures, linting, observability, and lifecycle management that lets agents operate reliably at scale. Engineer-bylined and concrete.
  Tags: `harnesses`, `codex`, `practitioner-bylined`, `must-read`

- **[Extreme Harness Engineering for Token Billionaires (Latent Space)](https://www.latent.space/p/harness-eng)** — Ryan Lopopolo (OpenAI Frontier & Symphony), interviewed by Latent Space
  The longer-form interview version: 1M LOC, 1B tokens/day, 0% human code, 0% human review. The numbers and the failure modes that *did* surface despite the engineering.
  Tags: `harnesses`, `codex`, `interview`

- **[Inside OpenAI's agentic software factory (The Pragmatic Engineer)](https://newsletter.pragmaticengineer.com/p/openai-software-factory)** — Gergely Orosz, 2026-09 (paywalled)
  Interviews with seven named OpenAI engineering leads on the end-to-end pipeline: risk-classified agent review with domain-specialist agents, opt-in auto-approval for low-risk areas, and a deploy agent told to "handhold this change until it is safely and fully rolled out into production". Codex use on non-engineering teams went from roughly 0% to about 90% in four months, and some systems saw roughly 10x more load. Paywalled from section 4 onward.
  Tags: `sdlc`, `code-review`, `deploys`, `paywalled`

- **[Custom Code Review rules for Codex](https://developers.openai.com/blog/custom-code-review-rules-for-codex)** — Hari Srikanth, 2026-07
  Puts review rules in AGENTS.md (repo-wide rules at the root, service rules in nested files) and tests them: rule-guided review recovered 98% of the required repo-specific findings against 58.3% for the baseline. Keep formatting and mechanical checks in CI and use rules for judgment calls, since broad instructions add noise. Borderline: a product-feature post, included for its eval numbers and reusable AGENTS.md guidance.
  Tags: `code-review`, `agents-md`, `borderline`

- **[Maintaining software with the GPT-6 family](https://developers.openai.com/blog/maintaining-software-with-the-gpt-6-family)** — Rodrigo Roim, 2026-10
  Five engineers, mostly part-time over two weeks, merged over 1,400 agent-written cleanup PRs and deleted more than 800k lines of dead code and stale flags. It prices each model setup per finding (GPT-6.1 Sol Ultra found 92% of what Astra Ultra found at 14% of the cost) and spells out the evidence the agent must gather before deleting anything: live Statsig config, git history and overlapping PRs.
  Tags: `maintenance`, `cost`, `dead-code`

- **[How OpenAI's Performance Factory keeps ChatGPT fast](https://openai.com/index/how-openai-performance-factory-keeps-chatgpt-fast/)** — Okay Zed, Cyrus Forbes, 2026-11
  An agent pipeline for performance regressions: more than 1,700 investigations and over 600 root causes in about three months, with a separate Codex session trying to disprove each diagnosis. In a manual review of 100 root-cause suggestions 70% were accurate, and the authors say fixes have been harder than diagnoses; an engineer still reviews each proposed fix, decides whether to merge it and deploys it.
  Tags: `reliability`, `ai-sre`, `adversarial-review`

### Infrastructure at agent scale

See also: [Version control](../topics/version-control.md)

- **[Scaling Git at OpenAI (Pando)](https://openai.com/index/scaling-git-at-openai/)** — Aaron Friel, Taylor Blau, Ted Nyman, 2026-11
  OpenAI's answer to agent-scale version control: it kept the git protocol and client and rebuilt the backend, cutting median push latency nearly 5x while serving about 1 PB of git data a day. Built in 10 weeks in Rust with deterministic simulation testing and Lean/TLA+ specs; it also lists the designs it rejected (three-phase commit, a shared WAL), which were modeled without being measured. Read it next to Anthropic's Scion post, which replaced git outright.
  Tags: `version-control`, `infrastructure`

### Security

See also: [Security](../topics/security.md), [Org-wide personal agents](../topics/orgwide-personal-agents.md)

- **[Securing persistent agents like OpenClaw at OpenAI](https://developers.openai.com/blog/securing-persistent-agents-like-openclaw-at-openai)** — Kevin S Lin, 2026-11
  How OpenAI secures hundreds of always-on internal agents: a trusted deterministic gateway in a separate cluster from the agent harness, an admin requirements.toml that blocks full-access sandbox mode and stops users widening the domain allowlist, a credential broker so the agent never sees secrets, and one identity per agent. A second agent reviews every agent action, and every turn is logged. Borderline: no incident or outcome data, and it ends by promoting OpenClaw Enterprise.
  Tags: `security`, `personal-agents`, `borderline`

- **[Backdooring the next release of Codex through GitHub Action pipeline exploit chaining (Depi)](https://depi.security/blog/20261111-backdooring-codex/)** — Pierre Martin, Garance de la Brosse, 2026-11
  Outside researchers chained a prompt injection in a public GitHub issue (the issue-labeler workflow ran openai/codex-action with allow-users: "*"), a sandbox escape through runner debug pipes, token theft and Actions cache poisoning into a path to the token that publishes @openai/codex to npm. OpenAI fixed it right away; any agent workflow that reads untrusted text is a security boundary.
  Tags: `security`, `supply-chain`, `ci`

### Evals

See also: [Evals and QA](../topics/evals-qa.md)

- **[Separating signal from noise in coding evaluations](https://openai.com/index/separating-signal-from-noise-coding-evaluations/)** — OpenAI, 2026-07
  OpenAI audited SWE-bench Pro, the benchmark it had recommended after dropping SWE-bench Verified in February, found 27.4% (automated check) to 34.1% (human annotation) of tasks broken, and retracted the recommendation. Read public coding-benchmark scores with that error rate in mind. Borderline: corporate byline, included for the audit numbers.
  Tags: `evals`, `benchmarks`, `borderline`

## Voices to follow

- **[@lopopolo](https://x.com/lopopolo)** — Ryan Lopopolo, OpenAI MTS, generally substantive
- **[@gdb](https://x.com/gdb)** — Greg Brockman, when he's posting technical not corporate

## What's still missing here

- A dedicated engineering post on Symphony.
- An engineering write-up of Aardvark / Codex Security with numbers from mid-2026 on. Only the March 2026 launch post was found.

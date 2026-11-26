# Internal tooling & agent harnesses

> The biggest section by volume. The vocabulary settled in early 2026, and the newer posts ask what a harness costs and what to delete as models improve. Teams that publish numbers keep writes single-threaded, move predictable steps into plain code, and treat the session log as the durable part while the harness stays disposable.

## The primitives most teams converged on

- **Guides + sensors** — the ambient context the agent has access to (codebase, recent edits, build status)
- **Planner / generator / evaluator** — separate the planning step from the writing step from the checking step
- **Ratchet principle** — once a check passes, don't let the agent regress past it
- **Initializer + worker pattern** — one agent sets up the env once, another iterates session-to-session, with explicit hand-off artifacts (Anthropic's `init.sh` + `claude-progress.txt`)
- **Computational vs inferential controls**: Böckeler's split between deterministic checks (linters, type checks, ArchUnit, mutation tests) and LLM-based ones (AI review, judges), with fast controls before integration and expensive ones in the pipeline. Shopify's Dispatch keeps credentials, Git and storage in deterministic code, and Stripe moved step coordination out of an LLM orchestrator into code.
- **Durable session, disposable harness**: keep the session in a durable log or workflow engine and let the harness and sandbox stop and resume anywhere. Shopify's River stores each session as an append-only Postgres event log, Sierra's Pinecone runs on recoverable Kubernetes runners, and Duolingo turns MCP tool calls into Temporal activities with retries.

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

### Vocabulary and field guides

- **[Lilian Weng — Harness Engineering for Self-Improvement](https://lilianweng.github.io/posts/2026-07-04-harness/)** — Lilian Weng, 2026-07
  A research survey that defines the harness as everything around the base model (planning, tool calls, context, artifacts, evaluation) and treats it as the near-term route to self-improvement. Its design rules match the practitioner posts: durable state in files, and subagent output kept as inspectable files and logs.
  Tags: `harnesses`, `self-improvement`, `literature-review`

- **[Thoughtworks — Harness engineering for coding agent users](https://martinfowler.com/articles/harness-engineering.html)** — Birgitta Böckeler, 2026-04
  A working vocabulary for people who use coding agents: feedforward guides (AGENTS.md, skills, LSP, MCP), feedback sensors (ArchUnit, ESLint, Semgrep, mutation testing), and the split between computational and inferential controls. She says plainly that the behaviour harness is unsolved and that AI-generated tests are not yet good enough to replace manual verification.
  Tags: `harnesses`, `vocabulary`, `sensors`

- **[Thoughtworks — Maintainability sensors for coding agents](https://martinfowler.com/articles/sensors-for-coding-agents.html)** — Birgitta Böckeler, 2026-05
  She rebuilt a TypeScript/Next.js app with no guide files and steered the agent with sensors alone: dependency-cruiser, ESLint, Stryker mutation testing and an AI modularity review each caught different problems. One file showed 100% statement coverage with no unit tests and 13 surviving mutants, and agents skipped the sensor checks even when AGENTS.md told them to run them.
  Tags: `harnesses`, `sensors`, `mutation-testing`

- **[HumanLayer — Skill Issue: Harness Engineering for Coding Agents](https://www.humanlayer.dev/blog/skill-issue-harness-engineering-for-coding-agents)** — Kyle Mistele, 2026-03
  A field guide to CLAUDE.md, MCP, skills, subagents and hooks: keep CLAUDE.md under 60 lines and human-written, swap MCP servers for small CLIs, use subagents as context firewalls, and keep the Stop hook silent on success. It cites a study of 138 agent files where LLM-generated ones hurt and cost 20%+ more, and lists what failed, such as persona subagents and installing skills "just in case".
  Tags: `harnesses`, `agents-md`, `hooks`, `subagents`

- **[Specmatic — Are Harnesses Worth the Cost?](https://martinfowler.com/articles/are-harnesses-worth-the-cost.html)** — Naresh Jain, 2026-10
  Ten paired runs per model against 178 acceptance tests: a behavioural harness (API specs, mocks, contract checks) did not help the frontier GPT-6 Sol, which passed 10/10 either way at about 7x the cost, and it lifted the cheap GPT-6 Luna from 3/10 to 10/10. His revised hypothesis, still untested, is that model capability changes when sensors should run. Borderline: the author founded Specmatic, which makes the harness tooling under test.
  Tags: `harnesses`, `cost`, `sensors`, `borderline`

### Production harness architectures

- **[Harvey — Post-Training RLM Agents for End-to-End M&A Diligence](https://www.harvey.ai/blog/post-training-rlm-agents-for-m-and-a-diligence)** — Niko Grupen et al., 2026-09
  A recursive language model (RLM) harness loads a data room of up to 80M tokens into a Python REPL and hands bounded slices to subagents. Mean pass rate rose from 23.3% to 62.4% across seven models, while Claude Code and Codex stopped reading early and never spawned subagents.
  Tags: `harnesses`, `long-context`, `subagents`

- **[Effective AI — Towards Self-Verifying Domain Agents](https://effectiveailabs.com/blog/self-verifying-domain-agents)** — Parthav Shergill, 2026-04
  Domain rules live in a compiler: the agent writes a typed insurance-rating language whose checks catch silent lookup mismatches, hallucinated codes and dead code. It reached 0% error on a 43-step auto rater where the same model writing Python ended at 103.7%, on one small rater and six test policies.
  Tags: `verification`, `compilers`, `domain-agents`

- **[Pi — What I learned building an opinionated and minimal coding agent](https://mariozechner.at/posts/2025-11-30-pi-coding-agent/)** — Mario Zechner, 2025-11
  Four tools (read, write, edit, bash) and a system prompt plus tool definitions under 1,000 tokens, with no built-in to-dos, plan mode or permission prompts. Pi is now stewarded by Earendil, and Augment Code rebuilt its CLI on a fork of it.
  Tags: `harnesses`, `minimal-agent`, `context-engineering`

- **[Shopify — Building an agentic harness that outlasts the model](https://shopify.engineering/building-an-agentic-harness-that-outlasts-the-model)** — Zack Deveau, 2026-07
  Dispatch is an in-house security-scanning harness with nine stages, partitions sized to 20-30% of the context window, and verifiers on a different model that must prove each bug inside the app's own test suite. It scanned 80+ apps for 300+ findings in about six weeks at $50-$300 per full scan; generalist multi-agent runs gave theoretical, non-deterministic results, and deterministic code handles credentials, Git and storage.
  Tags: `harnesses`, `security`, `verification`

- **[Shopify — Under the River](https://shopify.engineering/under-the-river)** — Burke Libbey, Javier Moreno, 2026-05
  The Aquifer platform under River, Shopify's internal agent: each session is a durable, append-only Postgres event log, while the harness and sandbox are disposable and the next interaction may run on a different host. New agent products ship as Nix-built profiles (prompt, skills, sandbox policy, model defaults), and River coauthors one in eight merged PRs at Shopify.
  Tags: `harnesses`, `agent-platform`, `durable-execution`

- **[Sierra — Pinecone: Harnessing the wisdom of the workforce](https://sierra.ai/blog/pinecone-harnessing-the-wisdom-of-the-workforce)** — Allen Chen, Tess Rosania, 2026-07
  Sierra's internal agent sends each prompt through a classifier that picks the repo, environment, harness (Codex or Claude Code), model and reasoning budget, then runs it on recoverable Kubernetes runners where a proxy swaps in credentials so the agent never sees them. 70% of Sierra's PRs in the last month were opened through it, and the team moved to building primitives after finding that "workflows didn't last long" as models improved.
  Tags: `harnesses`, `routing`, `agent-platform`

- **[Stripe — Stripe's Payment Method Factory: Orchestrating agents for repeated, custom integrations](https://stripe.dev/blog/stripes-payment-method-factory-orchestrating-agents-for-repeated-custom-integrations)** — David Dunne, Xenofon Vourliotis, Sai Samant, 2026-09
  A Minions follow-up for integration work that repeats with variations: 100+ reusable prompts, an observer agent that reads the implementing agent's transcript to harden those prompts, and provider API responses snapshotted into contracts that replace hand-written mocks. An LLM orchestrator was slow, costly and sometimes did steps itself, so "predictable coordination is better implemented in code"; integration timelines fell from up to 6 months to 2-6 weeks.
  Tags: `harnesses`, `orchestration`, `prompts`

- **[Cursor — How we set up our cloud agent environment](https://cursor.com/blog/cloud-agent-environment)** — Mathew Hogan, Arvind Saripalli, 2026-07
  How Cursor made its monorepo runnable by agents: one CLI for starting services with --help on every subcommand, an environment-inspection MCP, and a "Cloud Doctor" automation that reads agent traces and opens PRs to fix setup. Skills "only helped on the margins" because the underlying commands were convoluted; cloud agents went from about 1 in 10 monorepo PRs in December to more than half.
  Tags: `harnesses`, `dev-environment`, `cloud-agents`

- **[Duolingo — Making production-ready agents the default: building Duolingo's agent platform](https://blog.duolingo.com/production-ready-ai-agent-platform/)** — Guadalupe Aliseda-Canton, 2026-08
  An agent is a registry entry (owner, prompt, model, MCP servers, output type), and a Temporal-based platform handles execution, retries, credentials and cost tracking, which cut production-ready setup from several weeks to about 10 minutes. Its eval graders check the actual git diff (required and forbidden changes, max files changed, no-op consistency), so a plausible summary alone does not pass.
  Tags: `harnesses`, `agent-platform`, `evals`

- **[Replit — Agent Habitat Architecture](https://frontier.replit.com/agent-habitat-architecture/)** — Luis Hector Chavez, Manish Mehta, 2026-10
  A proposed reference architecture and maturity scale for agent sandboxes: a broker as the only path to the network, a microVM as "the practical floor", side effects journaled with idempotency keys, and negative tests (DNS tunneling, ICMP, IPv6, cloud metadata) that must still fail with the proxy off. Each control is tied to a real escape, such as a sandbox DNS resolver that bypassed a web proxy.
  Tags: `harnesses`, `sandboxing`, `security`

### Context, cost and delegation

- **[Augment Code — How we rebuilt the Auggie CLI harness to make tasks 53% cheaper than Claude Code](https://www.augmentcode.com/blog/auggie-cli-harness-rebuild-53-percent-cheaper)** — Tulga Tsogtgerel, Chris Kelly, 2026-08
  Rebuilt on a fork of Pi with bash plus three file tools, because every tool schema is sent on every call: $1.27 per SWE-bench Pro task against $2.70 for Claude Code at about the same pass rate. Borderline: a vendor benchmark against a competitor.
  Tags: `harnesses`, `cost`, `borderline`

- **[Cursor — Improved token efficiency for longer agent runs](https://cursor.com/blog/improved-token-efficiency)** — Jediah Katz, Connor O'Keefe, Calvin Yee, 2026-09
  Harness-level context changes, each measured with A/B tests on real traffic: about 66% of the system prompt trimmed as models improved, MCP tools loaded on demand (46.9% fewer total tokens in sessions that call MCP), and cache breakpoints placed to cut cold cache misses by 20%. Overall token cost fell 7% with no quality loss.
  Tags: `harnesses`, `context-engineering`, `cost`

- **[Cognition — Multi-Agents: What's Actually Working](https://cognition.com/blog/multi-agents-working)** — Walden Yan, 2026-04
  The author's own follow-up to "Don't Build Multi-Agents": multi-agent setups now work when writes stay single-threaded and the extra agents add intelligence, as a clean-context reviewer, a "smart friend" escalation model or a manager spawning child agents. Devin Review catches about 2 bugs per PR (~58% severe), while parallel writer swarms still see little real adoption and parent agents wrongly assume their children share their state.
  Tags: `harnesses`, `multi-agent`, `code-review`

- **[Replit — Free the models: Harness design at the frontier](https://frontier.replit.com/free-the-models/)** — Daniel Furman et al., 2026-09
  Replit argues against model routers and forced subagent spawning: its core loop picks subagent tier, effort and hand-offs mid-turn. Delegation habits differ by model (GPT-6 Astra hands work to general workers in 20% of turns, Fable 5 in 0.9%), and on DeepSWE v1.1 the design scored 72% at $2.11 a task against 61% at $1.34 for a cheaper single-sidekick setup.
  Tags: `harnesses`, `subagents`, `delegation`

- **[Anthropic — A harness for every task: dynamic workflows in Claude Code](https://claude.dev/blog/a-harness-for-every-task-dynamic-workflows-in-claude-code/)** — Thariq Shihipar, Sid Bidasaria, 2026-06
  Names three failure modes of one long context (agentic laziness, self-preferential bias, goal drift) and answers them with task-specific harnesses the model writes itself, built from isolated subagents. Its six patterns include adversarial verification, tournament and loop-until-done, and the approach was used for the Bun Zig-to-Rust rewrite. Borderline: a product launch with a real pattern catalog and no measured comparison against static harnesses.
  Tags: `harnesses`, `subagents`, `borderline`

## Voices

- [Will Larson](../people/will-larson.md)
- [Boris Cherny](../people/boris-cherny.md)
- [Niko Grupen (Harvey)](../people/niko-grupen.md) — agentic harnesses for legal AI
- [Birgitta Böckeler](../people/birgitta-bockeler.md)
- [Lilian Weng](../people/lilian-weng.md)
- [Mario Zechner](../people/mario-zechner.md)
- [Ryan Lopopolo](../people/ryan-lopopolo.md)
- [Walden Yan](../people/walden-yan.md)

## Related

- [Evals & QA](evals-qa.md): how teams grade what the harness produces
- [Memory, context files & skills](memory-and-context.md): AGENTS.md, skills and memory layers
- [Security](security.md): sandboxes, egress control and permission layers
- [Metrics](metrics.md): cost per task and per session
- Orgs: [Shopify](../orgs/shopify.md), [Sierra](../orgs/sierra.md), [Replit](../orgs/replit.md), [Cursor](../orgs/cursor.md), [Cognition](../orgs/cognition.md), [Stripe](../orgs/stripe.md), [Anthropic](../orgs/anthropic.md), [Harvey](../orgs/harvey.md), [Effective AI](../orgs/effective-ai.md), [Augment Code](../orgs/augment-code.md), [Duolingo](../orgs/duolingo.md)

## What's still missing here

- A measured comparison of model-written (dynamic) harnesses against static ones. Anthropic's dynamic-workflows post has none.
- A controlled test that separates guides from sensors. The Specmatic experiment bundles them, on one greenfield Java service.
- Harness results on legacy code. Böckeler calls legacy codebases the hardest to harness, and no source here measures one.
- An engineer-bylined Sierra harness post beyond Pinecone, and a primary 2026 LangChain post on harness vs framework. Searches found neither.

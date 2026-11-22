# Security when agents write and find code

> Two problems share this page. Frontier models now find real vulnerabilities in volume, and the limit has moved to triage, disclosure and patching, which lands hardest on open-source maintainers. Coding agents are also an attack surface of their own: they read untrusted text, hold credentials and run code. In both halves, the teams with numbers put deterministic checks around the model: validators that try to disprove findings, sandboxes, egress proxies, credential brokers and policy engines.

## What the best teams converged on

- **Try to disprove every finding before anyone sees it.** Cloudflare's validator agent cannot emit new findings, Datadog's judge needs a declared invariant, an entry point and a violating path, and Shopify's Dispatch makes a verifier on a different model prove exploitability. Mythos Preview's harness ends with an agent that confirms each report.
- **Write the threat model down and hand it to the agent.** Figma's 99-line policy is the threat model, Datadog uses versioned threat packs of about 300 lines, Google keeps threat models local to each codebase, and Dropbox pulls design reviews into AI code review through MCP.
- **Plan for triage and patching to be the constraint.** Fewer than 1% of Mythos Preview findings were patched at publication, Anthropic's dashboard names human triage as the rate-limiting step, curl's report rate is 4-5x 2024, and Mozilla involved over 100 people in patching, triage and release.
- **Put closure and safety rules in code.** Shopify's River enforces vulnerability closure rules in code, Figma found hooks steer agents more reliably than AGENTS.md, and Harvey enforces tool policy in the orchestration layer.
- **Trust deterministic boundaries for containment.** Anthropic: "The deterministic boundary is what gets hit when everything probabilistic misses." OpenAI runs its agent gateway as trusted deterministic code, and Replit calls a microVM "the practical floor".
- **Keep credentials out of the agent's reach.** Sierra's LLM proxy injects keys outside the sandbox, Replit's harness and sandbox "never see external credentials", and OpenAI routes secrets through a broker. Cursor's incident and the Comment and Control exploits show what happens otherwise.
- **Treat any workflow that reads untrusted text as a security boundary.** Issue text, PR titles, comments and stored memory are all injection paths in the Depi, Comment and Control and Zep write-ups.

## Practitioner sources

### Frontier models finding vulnerabilities

- 🟢 **[Anthropic — Assessing Claude Mythos Preview's cybersecurity capabilities](https://www.anthropic.com/research/mythos-preview)** — Nicholas Carlini et al., 2026-04
  The technical record behind Project Glasswing: a deliberately simple harness (one agent per file, a final agent that confirms each report) took working Firefox JS engine exploits from 2 of several hundred attempts with Opus 4.6 to 181 with Mythos Preview. Fewer than 1% of findings were patched at publication, which makes triage and patching the limit.
  Tags: `vulnerability-discovery`, `glasswing`, `harnesses`

- **[Anthropic — Project Glasswing: An initial update](https://www.anthropic.com/news/glasswing-initial-update)** — Anthropic, 2026-05
  The primary numbers for Glasswing: about 50 partners, 10,000+ high or critical bugs found by partners, and 90.6% of the 1,752 high or critical findings that people assessed were valid. Only 75 of about 530 disclosed bugs were patched at the time, and some maintainers asked Anthropic to slow down. Borderline: anonymous program update, included as the primary record of Project Glasswing.
  Tags: `glasswing`, `vulnerability-discovery`, `borderline`

- **[Anthropic — Coordinated vulnerability disclosure dashboard](https://red.anthropic.com/2026/cvd/)** — Anthropic, 2026-11
  A live funnel from model-generated candidate to shipped patch. As of 2 Nov 2026: 37,966 candidates, 6,009 of the 6,376 reviewed by outside firms confirmed valid (94.2%), and 629 patched, with human triage named as the rate-limiting step. Borderline: vendor dashboard with no byline, included because its method and caveats are on the page.
  Tags: `glasswing`, `disclosure`, `borderline`

- **[Cloudflare — Project Glasswing: what Mythos showed us](https://blog.cloudflare.com/cyber-frontier-models/)** — Grant Bourzikas et al., 2026-05
  Why a generic coding agent pointed at a repo does not work, and the eight-stage harness that does: about 50 narrow hunters each given one attack class, a validator that can only disprove findings, and a reachability trace stage they call the one that matters most. Also warns that skipping regression tests to hit short patch deadlines produces bugs worse than the ones being fixed.
  Tags: `vulnerability-discovery`, `harnesses`, `glasswing`

- **[Mozilla — Behind the Scenes Hardening Firefox with Claude Mythos Preview](https://hacks.mozilla.org/2026/05/behind-the-scenes-hardening-firefox/)** — Brian Grinstead, Christian Holler, Frederik Braun, 2026-05
  How Mozilla turned model bug-finding into a production pipeline, one target file per ephemeral VM: 271 bugs in Firefox 150, 180 of them sec-high (rated from crash symptoms). The authors call the discovery subsystem "necessary but not sufficient"; over 100 people worked on patching, review, triage, testing and release.
  Tags: `vulnerability-discovery`, `glasswing`, `triage`

- **[Google Project Zero — Fuzzers vs. AI: Comparing Fuzzilli and BigSleep on JavaScript Engines](https://projectzero.google/2026/10/fuzzing-v-AI.html)** — Samuel Groß, 2026-10
  A careful head-to-head on V8 from April to September 2026: BigSleep found 45 actionable vulnerabilities and Fuzzilli 37, with only 20 of 81 overlapping, and BigSleep reports a day or two later than the fuzzer. The author's conclusion: "fuzzing and LLMs are still complementary approaches".
  Tags: `vulnerability-discovery`, `fuzzing`, `evals`

- **[Google — Stronger with every update: How we're making Chrome and the web safer in the AI Era](https://blog.google/security/chrome-stronger-with-every-update/)** — Chrome Security Team, 2026-07
  Big Sleep and CodeMender run in CI every 24 hours across all CLs and blocked more than 20 vulnerabilities in May. Chrome 149 and 150 fixed 1,072 security bugs, more than the previous 23 milestones combined, with a critic agent choosing among candidate fixes before developer review. Borderline: team byline with no named engineers.
  Tags: `vulnerability-discovery`, `ci`, `borderline`

### The maintainer and skeptic view

- **[curl — The pressure](https://daniel.haxx.se/blog/2026/05/26/the-pressure/)** — Daniel Stenberg, 2026-05
  The maintainer side of AI-found bugs: curl's security report rate is 4-5x 2024, more than one a day, and around March 2026 the reports shifted from "AI slop" to "high quality chaos". Mythos' first scan of curl found a single low-severity problem; Stenberg works about 50-hour weeks on triage and asks dependent companies to fund support contracts.
  Tags: `open-source`, `triage`, `maintainers`

- **[VulnCheck — After 7-months, Glasswing Overwelms Maintainers with Underwhelming Findings](https://www.vulncheck.com/blog/anthropic-glasswing-november-update)** — Patrick Garrity, 2026-11
  An outside audit of Glasswing's public ledger: 37,966 findings, 7,349 public and 217 marked fixed. The author's September analysis found Claude rated 91.5% of findings critical or high against 51.3% by maintainers, and curl marked 19 of 34 published reports as not a vulnerability. Borderline: a threat-intel vendor with products to sell, so read the framing with care.
  Tags: `glasswing`, `critique`, `borderline`

- **[Dan Luu — Agentic test processes, LLM benchmarks, and other notes on agentic coding from Galapagos Island](https://danluu.com/ai-coding/)** — Dan Luu, 2026-09
  Argues a testing-heavy workflow with little or no review gives higher quality than any review-reliant one. On bug-finding, independent re-check agents, artifact proofs and contrarian personas cut false positives (Codex once produced a fake repro video), and he says Glasswing reports reached maintainers without a reasonable false-positive rejection process.
  Tags: `false-positives`, `testing`, `critique`

### In-house security agents inside the SDLC

- 🟢 **[Figma — How Figma stays ahead of vulnerabilities with agents](https://www.figma.com/blog/how-figma-stays-ahead-of-vulnerabilities-with-agents/)** — Rohan Sharma, Liam Buchan, Dave Martin, 2026-07
  One 99-line security policy, treated as the threat model, drives agents at code generation (hooks), PR review and repo-wide audits. Valid findings went from 4 of 27 in the first shadow week to 80% precision within a month at a median of about $0.50 per review, and hooks steered agents more reliably than the same guidance in AGENTS.md.
  Tags: `in-house-security`, `code-review`, `hooks`, `evals`

- **[Datadog — How we built Datadog's agentic vulnerability hunting system](https://www.datadoghq.com/blog/datadogs-agentic-vulnerability-hunting-system/)** — Bianca Lankford, Matt Meen, Adrien Peronnet, 2026-11
  Versioned, human-reviewed threat packs of about 300 lines state each system's security invariants, and a judge agent accepts a finding only if it names an invariant, a reachable entry point and a violating path. A finding counts as stable only if seen in at least 7 of 10 runs; an August benchmark found 43 validated vulnerabilities across nine threat packs, with no false-positive rate reported.
  Tags: `in-house-security`, `threat-modeling`, `evals`

- **[Shopify — Building an agentic harness that outlasts the model](https://shopify.engineering/building-an-agentic-harness-that-outlasts-the-model)** — Zack Deveau, 2026-07
  Dispatch, a nine-stage scanning harness, runs parallel hunters over partitions sized to 20-30% of the context window, then a verifier on a different model must prove each bug (two-tenant fixtures for IDOR) or reject or downgrade it. It found 300+ issues across 80+ apps in about six weeks at $50-300 per full scan, and in one audit every one of 30+ candidates was downgraded, dismissed or reclassified.
  Tags: `in-house-security`, `harnesses`, `verification`

- **[Shopify — How River takes security work from a fix to merge](https://shopify.engineering/river-vulnerability-remediation)** — Erin Son, Kaiyi Li, 2026-09
  The patching half of the problem: security merges through the freshness-gated queue went from about 10% to 80% once closure rules were enforced in code, so a vulnerability closes only when the source system, default branch, tracker and ledger agree. The post also shows a run where River skipped steps its prompt asked for.
  Tags: `remediation`, `in-house-security`, `verification`

- **[Google — Changing the game: Using agentic AI to secure infrastructure code](https://cloud.google.com/blog/topics/systems/using-ai-agents-to-secure-google-infrastructure)** — Andrés Lagar-Cavilla, Stella Voutsina, Parthasarathy Ranganathan, 2026-09
  Pre-submit agent scanning on every change in Google's own SDLC, with a triage agent at over 92% precision in under a minute and threat models local to each codebase that cut false positives to 3% in some cases. It advises keeping the harnesses, rules and context for development, scanning and triage agents separate to avoid bias, and gives no recall or fix-acceptance data.
  Tags: `in-house-security`, `threat-modeling`, `code-review`

- **[Dropbox — How Dropbox uses MCP and Dash to close the design-to-code security gap](https://dropbox.tech/security/dropbox-mcp-dash-design-code-security)** — Mark Breitenbach, Ishan Mishra, 2026-06
  Only 12% of implementing PRs linked back to their security design review, with a median gap of about five weeks. A review agent now pulls the relevant design reviews through an internal search MCP and checks the PR against them; no precision or false-positive numbers yet.
  Tags: `threat-modeling`, `code-review`, `mcp`

### Containing the agent: sandboxes, permissions, credentials

- 🟢 **[Anthropic — How we contain Claude across products](https://www.anthropic.com/engineering/how-we-contain-claude)** — Max McGuinness et al., 2026-05
  The containment setup per product (gVisor for claude.ai, Seatbelt/bubblewrap for Claude Code, a VM for Cowork code execution) and the lesson behind it: deterministic egress and filesystem boundaries caught what model-level defenses missed. In a controlled red-team exercise a phished employee's prompt got Claude to send ~/.aws/credentials out 24 of 25 times; users approved about 93% of permission prompts, and the OS sandbox cut prompts by 84%.
  Tags: `sandboxing`, `containment`, `permissions`

- **[Anthropic — How we built Claude Code auto mode: a safer way to skip permissions](https://www.anthropic.com/engineering/claude-code-auto-mode)** — John Hughes, 2026-03
  Measured error rates for the classifier that replaces permission prompts: 0.4% false positives, but 17% of real overeager actions get through, which the post calls "the honest number". Most misses come from misjudging whether earlier user consent covers the blast radius, and the author says auto mode is no drop-in replacement for careful human review on high-stakes infrastructure.
  Tags: `permissions`, `classifiers`, `containment`

- **[Sierra — Agency: Secure, scalable sandboxes for agents](https://sierra.ai/blog/agency-secure-scalable-sandboxes-for-agents)** — Rohith Ravi, 2026-07
  The sandbox layer under Sierra's internal agent: an LLM proxy outside the sandbox injects real API keys, and runners are non-root with all capabilities dropped, a read-only root filesystem and a filtering egress proxy. Explains why vendor sandboxes did not fit (resource, lifetime and concurrency limits, plus data-handling approvals).
  Tags: `sandboxing`, `credentials`, `infrastructure`

- **[Replit — Agent Habitat Architecture](https://frontier.replit.com/agent-habitat-architecture/)** — Luis Hector Chavez, Manish Mehta, 2026-10
  A reference security architecture for agent sandboxes: a broker as the only path to the network, a microVM as "the practical floor", and negative tests (DNS tunneling, ICMP, IPv6, cloud metadata, direct IP) that must fail with the proxy turned off. Each control is tied to a real escape, such as a sandbox DNS resolver bypassing a web proxy. Borderline: a proposed architecture from a company that sells managed cloud agents.
  Tags: `sandboxing`, `reference-architecture`, `borderline`

- **[OpenAI — Securing persistent agents like OpenClaw at OpenAI](https://developers.openai.com/blog/securing-persistent-agents-like-openclaw-at-openai)** — Kevin S Lin, 2026-11
  How OpenAI secures the hundreds of OpenClaw agents it runs internally: a trusted, deterministic gateway in a separate cluster from the agent harness, an admin requirements.toml that bans full-access sandbox mode, a credential broker, a separate identity per agent, and a second agent that reviews every action. Borderline: no incident or outcome data, and it ends by promoting OpenClaw Enterprise.
  Tags: `persistent-agents`, `identity`, `credentials`, `borderline`

### Tool gateways and policy engines

- **[Sierra — Building Sierra's MCP Gateway: An engineering iceberg](https://sierra.ai/blog/building-sierras-mcp-gateway-an-engineering-iceberg)** — Mihai Parparita, 2026-07
  An org-wide tool gateway that 89% of Sierra employees use to connect agents to 45 services. The GitHub MCP server's hundreds of tools wasted agent time, so the compromise was the gh CLI with a read-only token scoped to specific repos; while building it, coding agents read a token from a local DB to dodge an auth fix and fell back to curl before declaring success.
  Tags: `mcp`, `gateways`, `access-control`

- **[Harvey — Building Harvey's MCP Policy Engine](https://www.harvey.ai/blog/building-harveys-mcp-policy-engine)** — Suha Sabi Hussain, Divya Sudhakar, Nick Gonella, 2026-10
  Tool use is enforced in the orchestration layer: a Tool Pinner diffs connector catalogs against an approved baseline, and Rego policies permit, deny or pause each proposed MCP call, taking earlier calls into account, denying the call if checks can't complete. Open about trade-offs: the pinner "generates a substantial volume of alerts", and checks for cumulative changes across many small calls are still being developed; there are no latency or false-positive numbers.
  Tags: `mcp`, `policy-engine`, `prompt-injection`

### Attacks and incidents

- **[Aonan Guan — Comment and Control: Prompt Injection to Credential Theft in Claude Code, Gemini CLI, and GitHub Copilot Agent](https://oddguan.com/blog/comment-and-control-prompt-injection-credential-theft-claude-code-gemini-cli-github-copilot/)** — Aonan Guan, Zhengyu Liu, Gavin Zhong, 2026-04
  One injection pattern stole secrets from the CI coding agents of three vendors, including a base64 env dump that got past Copilot's secret scanning. Anthropic moved its rating from CVSS 9.4 to None because the action "is not designed to be hardened against prompt injection", so the hardening falls to you: allowlist tools, and keep write tokens and production secrets out of workflows that read untrusted input.
  Tags: `prompt-injection`, `ci`, `credentials`

- **[Depi — Backdooring the next release of Codex through GitHub Action pipeline exploit chaining](https://depi.security/blog/20261111-backdooring-codex/)** — Pierre Martin, Garance de la Brosse, 2026-11
  A full chain from a public GitHub issue to a path for publishing @openai/codex to npm: prompt injection into an issue-labeler agent open to any user, a sandbox escape through runner debug pipes in /tmp, token theft from process memory, and cache poisoning of a privileged workflow. OpenAI fixed it right away; the authors advise a short cooldown before installing tools that auto-update.
  Tags: `prompt-injection`, `ci`, `supply-chain`

- **[Cursor — An update on our recent security incident](https://cursor.com/blog/security-incident-update)** — Cursor Team, 2026-11
  An access key issued to Fireworks exposed stored agent traces, unredacted credentials inside those traces led to SaaS tools, and tampered Claude Code extension builds sat in Cursor's marketplace cache for about 11 hours (at most 5,000 users). The lesson for anyone storing agent traces: credentials end up inside them, so Cursor added secret scanning across code repos and other internal data sources. Borderline: team byline, included as a specific postmortem against the company's own interest.
  Tags: `incident`, `supply-chain`, `secrets`, `borderline`

- **[Zep — Defending Agent Memory Against Poisoning](https://www.getzep.com/blog/defending-agent-memory-poisoning/)** — Daniel Chalef, 2026-09
  A threat model for memory layers ("prompt injection with persistence"): the model proposes memories and application code decides what is stored, retrieved memory enters at the lowest privilege and never in a system or developer message, and each fact carries four timestamps so contradicted facts are marked invalid. Lists defenses that fail on their own, such as delimiters and filtering after ranking. Borderline: vendor founder post with no evals of its own.
  Tags: `memory`, `prompt-injection`, `borderline`

### Compliance when agents approve and push

- **[Intercom (Fin) — AI is approving our pull requests: Here's how we made it safe](https://ideas.fin.ai/p/ai-is-approving-our-pull-requests)** — Kesha, Niamh Young, 2026-04
  Review is split into independent sub-agents (problem statement, diff-to-intent, safety, logic, best practices), the reviewer refuses large PRs, and auditors were brought in early for SOC 2, HIPAA and ISO. 497 PRs went through fully autonomously in the first four weeks, and AI-authored backend code reverted at 0.53% against 5.39% for human-authored code.
  Tags: `code-review`, `compliance`, `auto-approval`

- **[Amp — "That's not SOC 2 compliant"](https://ampcode.com/notes/thats-not-soc-2-compliant)** — Will Dollman, 2026-08
  Amp ships to main with no PRs or mandatory review and still satisfies SOC 2 auditors: verified signatures on main, CI where "bad changes block main", and commits linked to the agent threads that produced them. The author says a 2,000-person company should not let everyone push to main, and that the per-system question still applies: "What risks are our pull requests actually managing here?"
  Tags: `compliance`, `version-control`, `soc2`

## Related

- Topics: [Code review](code-review.md), [Harnesses](harnesses.md), [Memory and context](memory-and-context.md), [Adoption and rollout](adoption-rollout.md) (Trail of Bits' sandbox-by-default rollout), [Reliability](reliability.md), [Version control](version-control.md)
- Orgs: [Anthropic](../orgs/anthropic.md), [Google](../orgs/google.md), [Figma](../orgs/figma.md), [Shopify](../orgs/shopify.md), [Sierra](../orgs/sierra.md), [Replit](../orgs/replit.md), [OpenAI](../orgs/openai.md), [Cursor](../orgs/cursor.md), [Intercom](../orgs/intercom.md), [Sourcegraph](../orgs/sourcegraph.md) (Amp spun out of it)

## What's still missing here

- Google's Big Sleep and CodeMender have no 2026 engineering write-up with named authors and updated patch counts. OpenAI's Aardvark / Codex Security has none with numbers from this period.
- Anthropic promised a full technical analysis of wolfSSL CVE-2026-5194 in its May update; it was not found as of November 2026.
- The Linux kernel's flood of AI bug reports is covered only in the news. No maintainer or LKML write-up was found.
- Most in-house harnesses report precision and leave out recall and fix-acceptance rates (Google, Datadog and Dropbox all say so).
- Containment failures in production: the containment posts describe red-team and disclosure cases, and Cursor's postmortem is the only detailed production incident here.

PRs welcome.

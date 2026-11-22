# Microsoft

> Microsoft has the best measured evidence on coding agents inside a large company: a causal study of its CLI agent rollout and ten months of agent-versus-human PR data in dotnet/runtime.

**The headline:** Engineers who adopted CLI coding agents merged **24% more PRs** (95% CI +14.5% to +33.7%) after the early 2026 rollout. In dotnet/runtime, agent PRs succeeded **67.9%** of the time against **87.1%** for Microsoft engineers, with reverts at **0.6%** against **0.8%**.

## Practitioner sources

- 🟢 **[Ten Months with Copilot Coding Agent in dotnet/runtime](https://devblogs.microsoft.com/dotnet/ten-months-with-cca-in-dotnet-runtime/)** — Stephen Toub, 2026-03
  Agent PRs measured against human baselines in the same repo: 535 of 878 merged (67.9%) against 87.1% for Microsoft engineers, with reverts at 0.6% against 0.8% (a gap the author calls not statistically meaningful). Adding an instruction file and unblocking NuGet feeds in the firewall moved success from 38.1% to 69%, and merged agent PRs drew more review comments (16.5 against 12.4).
  Tags: `metrics`, `pr-workflow`, `baselines`

- 🟢 **[Adoption and Impact of Command-Line AI Coding Agents: A Study of Microsoft's Early 2026 Rollout of Claude Code and GitHub Copilot CLI](https://arxiv.org/abs/2607.01418)** — Emerson Murphy-Hill, Jenna Butler, Alexandra Savelieva, 2026-07
  A rare in-company causal measurement: adopters merged 24% more PRs (95% CI +14.5% to +33.7%) under a synthetic-control model, and a placebo test came out at -1.1%. Adoption spread socially: the odds of first use rose 216% when more than a quarter of skip-level peers used the tool, and 82% when the direct manager did.
  Tags: `adoption`, `metrics`, `research`

- **[AI Made Us Faster. That Was the Problem](https://x.com/davidfowl/status/2054084334848790652)** — David Fowler, 2026-05
  How the Aspire team made its open-source repo ready for agents, with a public AGENTS.md, a .github/skills folder and GitHub Agentic Workflows whose PRs a human still approves. After "six months of code in about a week", the team hit a gap in review and understanding: production got cheaper and maintenance stayed as hard as before, so planning moved to a scenario scorecard.
  Tags: `agents-md`, `skills`, `oss`

- **[Cheap code, precious trust: Code modernization at scale](https://commandline.microsoft.com/agentic-software-engineering-large-scale-code-migration-language-modernization-spec-driven-development/)** — Sriram Rajamani, Tim Bozarth, 2026-10
  Microsoft's playbook for very large migrations (Windows to Clang/LLVM, C/C++ to Rust): experts approve a knowledge base that agents then apply across the codebase, migration goes feature by feature with differential and held-out tests, and agents infer TLA+ specs so TLC can check implementation traces against them. The Rust timeline is candid, from code that did not compile in January 2025 to about 30,000 working lines with manual guidance in September 2025. Borderline: CVP byline and no outcome metrics, but the method detail is specific.
  Tags: `legacy-modernization`, `verification`, `formal-methods`, `borderline`

## Voices to follow

- **[@davidfowl](https://x.com/davidfowl)** — David Fowler, Distinguished Engineer at Microsoft (Aspire)

## Related

- [Adoption and rollout](../topics/adoption-rollout.md)
- [Metrics that hold up](../topics/metrics.md)
- [Legacy modernization](../topics/legacy-modernization.md)
- [GitHub](github.md): Stephen Toub's agent-led port of the Copilot runtime to Rust, and GitHub's Octoverse data on agent PRs
- [Stephen Toub](../people/stephen-toub.md)

## What's still missing here

Outside dotnet/runtime and the arXiv study, there is no Microsoft post with measured results for its coding agents across the company. The modernization post reports no PR counts, time savings or defect rates, and the first-party COBOL and mainframe material dates from 2025.

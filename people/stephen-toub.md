# Stephen Toub

Distinguished Engineer at Microsoft (.NET). Has published two of the most data-heavy accounts of coding agents working inside large production codebases.

**Where to follow:**
- Blog: [.NET Blog](https://devblogs.microsoft.com/dotnet/)

## Best pieces

- 🟢 **[Ten Months with Copilot Coding Agent in dotnet/runtime](https://devblogs.microsoft.com/dotnet/ten-months-with-cca-in-dotnet-runtime/)** — Stephen Toub, 2026-03
  Measures 878 agent PRs against human baselines in the same repo: 67.9% merged vs 87.1% for Microsoft engineers, reverts at 0.6% vs 0.8% (a gap he notes is not statistically meaningful), plus success by task type and review load per PR. Fixing the environment (adding copilot-instructions.md, unblocking NuGet feeds at the firewall) moved success from 38% to 69%.
  Tags: `metrics`, `baselines`, `code-review`, `practitioner-bylined`

- 🟢 **[Migrating the GitHub Copilot runtime to Rust, using Copilot](https://github.blog/ai-and-ml/generative-ai/migrating-the-github-copilot-runtime-to-rust-using-copilot/)** — Stephen Toub, 2026-09
  An in-place, incremental agent-led port of a production runtime: 128 port PRs over ~14.5 weeks, existing E2E tests gating every merge, and agents barred from changing those tests without consent because a changed test signals a porting bug. Its failure list, such as an agent applying a waiver label to a PR that had dropped an SDK method, shows what conformance tests miss.
  Tags: `legacy-modernization`, `migration`, `verification`, `practitioner-bylined`

## Why he matters here

Toub publishes the numbers most adoption posts leave out: human baselines from the same repo, failure lists and session data. The dotnet/runtime post is a template for measuring an agent against your own team. The Rust port is the incremental counterpart to Bun's all-at-once rewrite in [legacy modernization](../topics/legacy-modernization.md). Org context is in [Microsoft](../orgs/microsoft.md) and [GitHub](../orgs/github.md).

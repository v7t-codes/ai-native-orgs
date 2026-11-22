# GitHub

> GitHub sees agent-scale development from the platform side: what agent traffic does to Git storage, how agent PRs compare across the site, and what an agent-led port of its own runtime looked like.

**The headline:** By September 2026, more than **40% of PRs** on GitHub started with an agent's first draft, up from **17%** in March. Commits reached **7.38B** that month, more than 5x a year earlier.

## Practitioner sources

- 🟢 **[Migrating the GitHub Copilot runtime to Rust, using Copilot](https://github.blog/ai-and-ml/generative-ai/migrating-the-github-copilot-runtime-to-rust-using-copilot/)** — Stephen Toub (Microsoft), 2026-09
  An in-place, step-by-step agent port of a production runtime over about 14.5 weeks and 128 PRs, with existing E2E tests gating every merge and a rule that agents may not change those tests without consent. The failure list is the useful part: an agent applied a waiver label to a PR that had dropped an SDK method, and one parallel session merged another session's worktree changes into its own.
  Tags: `legacy-modernization`, `multi-agent`, `testing`

- 🟢 **[Building Git infrastructure for agent-scale development](https://github.blog/engineering/architecture-optimization/building-git-infrastructure-for-agent-scale-development/)** — Brian Celenza, 2026-10
  Agent write volume broke the assumptions in GitHub's replicated Spokes design, where a push is as slow as the slowest of five replicas. The new design keeps durable data in Azure Blob and runs compute on cache-backed workers, and it gave up to 35x write throughput in benchmarks, with no production timeline yet.
  Tags: `version-control`, `infrastructure`, `scale`

- **[Octoverse: Commits, pushes reach new highs in 2026 as developers build with agents](https://github.blog/news-insights/octoverse/octoverse-commits-pushes-reach-new-highs-in-2026-as-developers-build-with-agents/)** — GitHub Staff, 2026-10
  The broadest public data on agent-authored PRs: by September, agent-involved PRs merged within two weeks 90% of the time, against about 86% for the comparison group. GitHub calls its agent detection a floor and reports no defect, revert or security data. Borderline: GitHub Staff byline, and it measures acceptance with no quality data.
  Tags: `metrics`, `data`, `borderline`

## Related

- [Version control](../topics/version-control.md)
- [Legacy modernization](../topics/legacy-modernization.md)
- [Metrics that hold up](../topics/metrics.md)
- [Microsoft](microsoft.md): Stephen Toub's ten months of agent PR data in dotnet/runtime
- [Stephen Toub](../people/stephen-toub.md)

## What's still missing here

GitHub has not published internal 2026 data on its own Copilot coding agent PRs or merge rates. The Spec Kit maintainers have not written up lessons from teams using it.

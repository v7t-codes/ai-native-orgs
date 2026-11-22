# Version control at agent scale

> Agent merge volume outgrew git hosting in 2026. Anthropic went from about 2,500 merges a day in May to over 30,000 in September, and GitHub counted 7.38B commits in September 2026, more than five times a year earlier. Two opposite answers came out within three weeks of each other. Anthropic replaced git for its monorepo with Scion, its own server-side changeset system. OpenAI kept the git protocol and client and rebuilt the backend behind them (Pando), and GitHub and Cursor are also rebuilding the storage under git.

## What the best teams converged on

- **Durable state moves to a log or object store.** Anthropic keeps changesets in a write-ahead log and refs as compare-and-swap on a Spanner row. Cursor writes every push to a write-ahead log in S3 and treats local git repos as a warm cache. GitHub is moving authoritative repo data to Azure Blob Storage.
- **Coordinate only the ref update.** GitHub's Spokes keeps five full replicas with three-phase commit, so a push is as slow as the slowest replica. Cursor swaps three-phase commit for compare-and-swap on S3. OpenAI coordinates per branch with causal consistency and rejected three-phase commit after modeling it.
- **Merge queues change shape.** Anthropic could not replicate the usual global lock on the merge queue at this scale and invested in post-merge and pre-deploy testing.
- **Agents helped build the new systems.** OpenAI built Pando in 10 weeks in Rust with deterministic simulation testing, and agents wrote its Lean and TLA+ specs. A Claude rewrite of Anthropic's ingestion pipeline used 20x less memory and ran 4x faster.
- **On the developer's machine, one worktree per agent.** Coinbase's Mux gives each parallel agent its own git worktree, branch and terminal.

## Practitioner sources

- 🟢 **[Anthropic — Redesigning source control at Anthropic](https://www.anthropic.com/engineering/redesigning-source-control)** — Nick G. and the Anthropic source control team, 2026-10
  Merges grew from ~2,500 a day in May 2026 to 30,000+ in September, with 25M CI checkouts a day, and git mirrors could not keep up. A seven-person team built Scion, an always-online server-side changeset VCS, and moved the monorepo off git in five months; CI checkouts went from minutes to seconds.
  Tags: `version-control`, `monorepo`, `ci`, `scale`

- 🟢 **[OpenAI — Scaling Git at OpenAI](https://openai.com/index/scaling-git-at-openai/)** — Aaron Friel, Taylor Blau, Ted Nyman, 2026-11
  OpenAI's answer to the same problem: keep git on the wire and rebuild the backend as Pando. Commits landed on master grew 1,378% from Q1 2024 to Q3 2026 and the old system's reliability at times fell below 90%; Pando cut median push latency nearly 5x and once served 57 TB of packs in an hour, over 99% from local disk cache. The rejected designs (three-phase commit, a shared WAL) are shown as synthetic models.
  Tags: `version-control`, `git`, `scale`, `formal-methods`

- **[GitHub — Building Git infrastructure for agent-scale development](https://github.blog/engineering/architecture-optimization/building-git-infrastructure-for-agent-scale-development/)** — Brian Celenza, 2026-10
  The storage-side view: 7.38B commits in September 2026, more than 5x a year earlier, and monthly pushes up from 0.69B to 3.35B. Spokes makes a push as slow as its slowest replica, so GitHub is moving to blob storage as the source of truth with cache-backed compute, which gave up to 35x write throughput in an internal benchmark; there is no production timeline yet.
  Tags: `version-control`, `git`, `storage`, `scale`

- **[Cursor — Git at any scale](https://cursor.com/blog/git-at-any-scale)** — Vicent Martí, 2026-08
  Git hosting built for agent-shaped load: many small, mostly idle repos plus one hot monorepo. Every push is a write-ahead log object in S3 and is not acknowledged until persisted, and the monorepo handles up to 120 pushes/s on S3 Standard and over 300 on S3 Express One Zone. It also lists what failed: JGit DHT (clones too slow), NFS ("slow, and it was buggy") and DRBD/GFS.
  Tags: `version-control`, `git`, `storage`

- **[Coinbase — Coding Had a Concurrency Problem: How Mux Helped Solve It](https://www.coinbase.com/blog/coding-had-a-concurrency-problem-how-mux-helped-solve-it)** — Alessandro Rodi, Adam Wolf, 2026-05
  A grassroots internal tool that gives each parallel agent its own git worktree, branch and terminal, with Coinbase's deploy and review flows built in. Mux users merged 39.6 PRs each against an 11.4 baseline (~3.5x), and the authors warn that users likely skew toward people who were already high-output.
  Tags: `version-control`, `worktrees`, `parallel-agents`, `internal-tools`

## Related

- [Code review & PR workflow](code-review.md) — where the merge volume lands
- [Metrics that hold up](metrics.md) — merge and commit counts as load signals
- [Internal tooling & agent harnesses](harnesses.md)
- [Legacy modernization & verification-first rewrites](legacy-modernization.md) — Cursor's new swarm harness for its SQLite rebuild, which includes a custom VCS, had under 1,000 merge conflicts against 70,000+ for the old one
- Orgs: [Anthropic](../orgs/anthropic.md), [OpenAI](../orgs/openai.md), [GitHub](../orgs/github.md), [Cursor](../orgs/cursor.md), [Coinbase](../orgs/coinbase.md)

## What's still missing here

- A strong practitioner write-up on jj (Jujutsu) or other non-git clients for parallel agents.
- Provenance in version control (which agent and prompt produced a change). Only startup product material exists so far.
- A detailed design for merge queues and pre-merge CI at this volume. Anthropic says what it gave up; nobody has written up a replacement in depth.
- Every infrastructure post here comes from a lab or a git host. A product company's account of hitting VCS limits under agent load is missing.

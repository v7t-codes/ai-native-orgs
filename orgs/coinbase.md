# Coinbase

> One of the highest-profile examples of "an agent for every employee" as an org strategy across the whole company. Also restructured 14% of headcount around AI in 2026. Its 2026 engineering posts add Mux, a grassroots tool for running agents in parallel, and a rebuilt hiring loop for a codebase where nearly all new code is AI-generated.

## Practitioner sources

- 🟢 **[Building enterprise AI agents at Coinbase: engineering for trust, scale, and repeatability](https://www.coinbase.com/blog/building-enterprise-AI-agents-at-Coinbase)** — Coinbase Engineering
  How they built the internal agent platform — trust, scale, repeatability primitives. The eng-bylined post most teams should read first.
  Tags: `org-rollout`, `personal-agents`, `architecture`

- **[How We are Improving Product Quality at Coinbase with AI agents](https://www.coinbase.com/blog/How-We-are-Improving-Product-Quality-at-Coinbase-with-AI-agents)** — Coinbase Engineering
  Their `qa-ai-agent` — natural-language test prompts ("log into coinbase test account in Brazil, and buy 10 BRL worth of BTC") that take minutes vs. weeks for human QA.
  Tags: `qa`, `internal-tooling`

- **[Coding Had a Concurrency Problem: How Mux Helped Solve It](https://www.coinbase.com/blog/coding-had-a-concurrency-problem-how-mux-helped-solve-it)** — Alessandro Rodi, Adam Wolf, 2026-05
  A side project that became an internal tool for running several agents in parallel, each in its own git worktree, branch and terminal, wired into Coinbase's deploy and review flows. Mux users merged 39.6 PRs each against an 11.4 baseline, and the authors warn that users likely skew toward people who were already high-output.
  Tags: `parallel-agents`, `worktrees`, `metrics`

- **[Interviewing Engineers in the AI Era: Lessons from a Year of Rebuilding](https://www.coinbase.com/blog/interviewing-engineers-in-the-ai-era-lessons-from-a-year-of-rebuilding)** — Coinbase Engineering, 2026-07
  The AI-generated share of merged code went from 5.7% in Q1 2025 to nearly all new code, so interviews became repo-based debugging and review with AI tools allowed, scored on an "AI Fluency" rubric (usage, application, understanding limits). One round was cut after internal analysis found an 84% correlation with another. Borderline: Coinbase byline with no named engineer, included for its data and its open "still figuring out" section.
  Tags: `hiring`, `interviews`, `borderline`

## Voices to follow

- **[@rwitoff](https://x.com/rwitoff)** — Rob Witoff, Coinbase CTO. Shared the interviewing post.

## What's still missing here

If you work at Coinbase and have written about the day-to-day data layer, personalization model, or security architecture for the personal-agent rollout, please open a PR. The published material covers the platform, the QA agent, Mux and hiring; it says little about how the per-employee agents actually work.

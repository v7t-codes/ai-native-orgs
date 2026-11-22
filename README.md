# AI-Native Orgs

A community-curated reference for **what AI-native engineering orgs are actually doing inside their companies** — written by the people doing it, not by their marketing teams.

This started as a private reading list for an Accel Founder Connect roundtable on AI-native engineering practices. It got useful enough to share. Fork it, add what you've learned from, send a PR.

## How this is organized

There are three ways to navigate. Use whichever fits how your brain works on a given day.

- **By organization** → [`orgs/`](orgs/) — one file per company or lab. Best when you already know who you want to learn from (Stripe, Ramp, Anthropic, Coinbase).
- **By person** → [`people/`](people/) — individual practitioners and the trail of work they've published. Best when you want to follow a specific voice across companies.
- **By topic** → [`topics/`](topics/) — cross-cut views (SDLC, evals, reliability, harnesses, org structure). Best when you have a problem and want to read what worked for others.

Most resources show up in more than one place — an Anthropic blog post about harnesses lives in `orgs/anthropic.md`, `people/<author>.md`, and `topics/harnesses.md`.

## Start here: the AI-native SDLC path

Last refreshed November 2026. If you read one thing per step, read these, in this order.

1. **The shift.** [OpenAI — Harness engineering](https://openai.com/index/harness-engineering/) (1M lines, 0% hand-written over 5 months) and [Anthropic — Effective harnesses for long-running agents](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents). More in [harnesses](topics/harnesses.md).
2. **What an org-wide rollout looks like.** [Intercom (Fin) — 2x, nine months later](https://ideas.fin.ai/p/2x-nine-months-later): one target for all of R&D (merged PRs per head), 93.6% of PRs agent-driven, and the side effects they measured. More in [rollout & adoption](topics/adoption-rollout.md).
3. **Context before code.** [Anthropic — The components of agent memory](https://www.anthropic.com/research/components-of-agent-memory) (a maintained wiki plus search scored 61% against 53% for search alone) and [Meta — Mapping tribal knowledge](https://engineering.fb.com/2026/04/06/developer-tools/how-meta-used-ai-to-map-tribal-knowledge-in-large-scale-data-pipelines/). More in [memory, context files & skills](topics/memory-and-context.md).
4. **Skills, rules and hooks.** [Anthropic — How we use skills](https://claude.dev/blog/lessons-from-building-claude-code-how-we-use-skills/) and [Vercel — AGENTS.md outperforms skills](https://vercel.com/blog/agents-md-outperforms-skills-in-our-agent-evals) (the skill was never invoked in 56% of runs). Same file as step 3.
5. **Plans and specs.** [Asana — Spec-driven development after three months](https://asana.com/inside-asana/spec-driven-development) and [AWS AI-DLC workflows](https://github.com/awslabs/aidlc-workflows). More in [AI-DLC & spec-driven development](topics/aidlc-and-spec-driven.md).
6. **Verification and review.** [Anthropic — How the Claude Code team does code review](https://claude.dev/blog/solving-code-review-at-anthropic/) (merged PRs more than doubled while the reverted share fell by more than 40%) and [How the Claude Code team thinks about verification](https://claude.dev/blog/how-the-claude-code-team-thinks-about-verification/). More in [code review](topics/code-review.md).
7. **Rewriting legacy code.** [Bun — Rewriting Bun in Rust](https://bun.com/blog/bun-in-rust) and [GitHub — Migrating the Copilot runtime to Rust](https://github.blog/ai-and-ml/generative-ai/migrating-the-github-copilot-runtime-to-rust-using-copilot/): in both, the old code's tests decide what counts as done. More in [legacy modernization](topics/legacy-modernization.md).
8. **Running it as a factory, and what it costs.** [Uber — Running a software factory efficiently](https://www.uber.com/us/en/blog/efficient-software-factory/) (70%+ of PRs from agents, total AI spend roughly flat since April) and [Airbnb — Cost per task](https://aws.amazon.com/blogs/machine-learning/how-airbnb-uses-cost-per-task-to-operate-coding-agents-on-amazon-bedrock/). More in [SDLC & coding loops](topics/sdlc-coding.md).
9. **Measuring what ships.** [Chen & Stratton — Bottlenecks in software production](https://fion.ac/jellyfish.pdf) (655 firms: PRs up 36% after agent adoption, submission-to-merge time up 56%) and [Demirer et al. — Writing code vs. shipping code](https://www.mertdemirer.com/Papers/Demirer_Writing_vs_shipping_code.pdf). More in [metrics](topics/metrics.md).
10. **Security.** [Anthropic — Project Glasswing: an initial update](https://www.anthropic.com/news/glasswing-initial-update), [Cloudflare — What Mythos showed us](https://blog.cloudflare.com/cyber-frontier-models/) and the critical [VulnCheck November review](https://www.vulncheck.com/blog/anthropic-glasswing-november-update). More in [security](topics/security.md).
11. **Infrastructure at agent scale.** [Anthropic — Redesigning source control](https://www.anthropic.com/engineering/redesigning-source-control) (2,500 to 30,000+ merges a day between May and September) and [OpenAI — Scaling Git](https://openai.com/index/scaling-git-at-openai/). More in [version control](topics/version-control.md).

## Topic index

| Area | What it's about |
|---|---|
| [SDLC & coding loops](topics/sdlc-coding.md) | How AI changes the inner loop — Cursor, Claude Code, autocomplete-vs-agent, CLAUDE.md culture |
| [Code review & PR workflow](topics/code-review.md) | Reviewing AI-generated PRs at scale — Ramp Inspect, Stripe Minions, the review bottleneck |
| [Evals & QA](topics/evals-qa.md) | The discipline that separates real shipping from demos — Hamel Husain, Eugene Yan, eval-driven development |
| [Reliability & failure modes](topics/reliability.md) | Hallucinations, fallbacks, observability, AI in the critical product loop |
| [Internal tooling & agent harnesses](topics/harnesses.md) | The harness primitives — guides, sensors, planner/generator/evaluator |
| [Org-wide data layer](topics/orgwide-data-layer.md) | Making the company's data agent-ready — Rippling AI, Glean, Notion AI |
| [Org-wide personal agents](topics/orgwide-personal-agents.md) | An agent for every employee — Coinbase, Anthropic-internal |
| [AI-native products](topics/ai-native-products.md) | When AI is in the product critical path |
| [Org, hiring & culture](topics/org-and-hiring.md) | What roles change, what skills matter, how to hire |
| [Metrics that hold up](topics/metrics.md) | What to measure when AI is generating most of the code |
| [Memory, context files & skills](topics/memory-and-context.md) | Memory layers, AGENTS.md / CLAUDE.md, skills and org knowledge bases agents read |
| [AI-DLC & spec-driven development](topics/aidlc-and-spec-driven.md) | AWS AI-DLC, BMAD, spec-driven development and what the first reports show |
| [Legacy modernization](topics/legacy-modernization.md) | Verification-first rewrites and fleet-wide upgrades where the old code's tests are the referee |
| [Rollout & adoption](topics/adoption-rollout.md) | First-person accounts of taking agents org-wide, with numbers |
| [Security](topics/security.md) | Project Glasswing and models finding vulnerabilities, plus securing the agents themselves |
| [Version control at agent scale](topics/version-control.md) | What agent merge volume did to git, and the rebuilds at Anthropic, OpenAI, GitHub and Cursor |
| [Foundational reading](topics/foundational.md) | The pieces that frame the whole space |

## Flagship orgs

A starting set. The full list lives in [`orgs/`](orgs/).

| Org | Known for |
|---|---|
| [Stripe](orgs/stripe.md) | Minions — "over a thousand pull requests merged each week are completely minion-produced" (stripe.dev, 2026-02) |
| [Ramp](orgs/ramp.md) | Inspect (>50% PRs agent-originated), Latent Briefing research, AI software factories |
| [Anthropic](orgs/anthropic.md) | Claude Code, harness primitives, agent memory layers, Project Glasswing, moving its monorepo off git |
| [OpenAI](orgs/openai.md) | Codex harness engineering, autonomous PR shipping |
| [Cursor](orgs/cursor.md) | Cloud agents went from about 1 in 10 monorepo PRs (Dec 2025) to more than half (July 2026) |
| [Shopify](orgs/shopify.md) | Tobi's "AI-as-baseline" memo, fully reframed eng review |
| [Block](orgs/block.md) | Stage-5/6 maturity ladder, 95% adoption in legacy codebases |
| [Coinbase](orgs/coinbase.md) | Org-wide personal agents per employee |
| [Rippling](orgs/rippling.md) | Org-wide data layer for AI |
| [Sourcegraph](orgs/sourcegraph.md) | Cody, agent-oriented codebase navigation |
| [Intercom (Fin)](orgs/intercom.md) | One 2x target for all of R&D, hit in nine months; 93.6% of PRs agent-driven |
| [Uber](orgs/uber.md) | 70%+ of PRs from agents with total AI spend roughly flat since April 2026 |
| [Meta](orgs/meta.md) | Forum built to Facebook Groups parity in eight weeks; knowledge layers agents read |
| [Sierra](orgs/sierra.md) | Pinecone, one internal agent that opened 70% of the company's PRs in a month |
| [Microsoft](orgs/microsoft.md) | Causal study of its CLI-agent rollout; ten months of agent PR data in dotnet/runtime |
| [GitHub](orgs/github.md) | Platform-side view of agent traffic; ported the Copilot runtime to Rust with Copilot |

Also in [`orgs/`](orgs/): [AWS](orgs/aws.md) (AI-DLC), [Cognition](orgs/cognition.md), [Figma](orgs/figma.md), [Google](orgs/google.md), [Pinterest](orgs/pinterest.md), [PostHog](orgs/posthog.md), [Razorpay](orgs/razorpay.md), [Replit](orgs/replit.md), [Spotify](orgs/spotify.md), [Vercel](orgs/vercel.md).

## Contributing

This works because people add what they've actually learned from. The bar is **practitioner-grade**: written by someone doing the work, with specifics — numbers, code, postmortems, named tools, lessons from failure.

Read [CONTRIBUTING.md](CONTRIBUTING.md) before opening a PR.

What we keep:
- Engineering blog posts by working engineers / ICs
- Talks and podcasts where the speaker is hands-on, not slide-reading
- GitHub READMEs of in-use internal tools
- Twitter/X threads where the substance is in the thread, not a tease for a paywall
- Postmortems and "here's what didn't work" honesty

What we reject:
- Vendor PR dressed as a case study
- Exec keynote summaries with no technical specifics
- "10 ways AI will…" listicles
- Press releases of partnerships
- Pitch-deck-as-blog-post

## License

[CC-BY 4.0](LICENSE) — fork it, remix it, build on it, just credit.

## Maintainers

Started by [Vishwajit Sasi](https://x.com/s_v7t) (AI Resident, Accel India). Open to co-maintainers — open an issue if you want to help curate a section.

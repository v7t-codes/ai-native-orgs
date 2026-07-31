# AI-Native Orgs

A community-curated reference for **what AI-native engineering orgs are actually doing inside their companies** — written by the people doing it, not by their marketing teams.

This started as a private reading list for an Accel Founder Connect roundtable on AI-native engineering practices. It got useful enough to share. Fork it, add what you've learned from, send a PR.

## How this is organized

There are three ways to navigate. Use whichever fits how your brain works on a given day.

- **By organization** → [`orgs/`](orgs/) — one file per company or lab. Best when you already know who you want to learn from (Stripe, Ramp, Anthropic, Coinbase).
- **By person** → [`people/`](people/) — individual practitioners and the trail of work they've published. Best when you want to follow a specific voice across companies.
- **By topic** → [`topics/`](topics/) — cross-cut views (SDLC, evals, reliability, harnesses, org structure). Best when you have a problem and want to read what worked for others.

Most resources show up in more than one place — an Anthropic blog post about harnesses lives in `orgs/anthropic.md`, `people/<author>.md`, and `topics/harnesses.md`.

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
| [Enterprise automation modeling](topics/enterprise-automation-modeling.md) | How to model an entire enterprise for progressive autonomy — the eight engines, work classification, autonomy spectrum, interface layer |
| [Foundational reading](topics/foundational.md) | The pieces that frame the whole space |

## Flagship orgs

A starting set. The full list lives in [`orgs/`](orgs/).

| Org | Known for |
|---|---|
| [Stripe](orgs/stripe.md) | Minions — 1,300+ agent PRs/week, Scala→Java migration in 4 days vs 10 weeks |
| [Ramp](orgs/ramp.md) | Inspect (>50% PRs agent-originated), Latent Briefing research, AI software factories |
| [Anthropic](orgs/anthropic.md) | Claude Code, harness primitives, agent-oriented engineering |
| [OpenAI](orgs/openai.md) | Codex harness engineering, autonomous PR shipping |
| [Cursor](orgs/cursor.md) | Cloud agents shipping ~35% of internal PRs |
| [Shopify](orgs/shopify.md) | Tobi's "AI-as-baseline" memo, fully reframed eng review |
| [Block](orgs/block.md) | Stage-5/6 maturity ladder, 95% adoption in legacy codebases |
| [Coinbase](orgs/coinbase.md) | Org-wide personal agents per employee |
| [Rippling](orgs/rippling.md) | Org-wide data layer for AI |
| [Sourcegraph](orgs/sourcegraph.md) | Cody, agent-oriented codebase navigation |

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

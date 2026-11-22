# Will Larson

Engineering leader (CTO at Imprint, ex-Calm, Stripe, Uber, Digg). Author of *An Elegant Puzzle*, *Staff Engineer*, *The Engineering Executive's Primer*. Currently building an internal agent framework in public, weekly. Since mid-2026 he also publishes Imprint's numbers on deploys, review time and PR throughput.

**Where to follow:**
- Blog: [lethain.com](https://lethain.com)
- X: [@Lethain](https://x.com/Lethain)

## Best pieces

- 🟢 **[Building internal agents (series index)](https://lethain.com/agents-series/)** — Will Larson
  The reference. A multi-part log of building Imprint's internal agent framework, weekly. Includes:
  - [Logging and debugability](https://lethain.com/agents-logging/)
  - [Adding support for Agent Skills](https://lethain.com/agents-skills/)
  - [Subagent support](https://lethain.com/agents-subagents/)
  - [Evals to validate workflows](https://lethain.com/agents-evals/)
  This is the closest thing to a real-time engineering manager's diary on building an agent.
  Tags: `harnesses`, `agents-in-prod`, `engineering-management`, `must-read`

- **[Shipping 100+ PRs to production in a week](https://lethain.com/passing-100-prs-in-a-week/)** — Will Larson, 2026-11
  Traces how the bottleneck moved as he went from 5-10 to 115 merged PRs a week: deploys first, then stale docs, issue structure, orchestration, approvals and verification. He ends up seeing PR quality and verifiability as the real limit, and treats merged PRs per week as a number that raises questions without answering them.
  Tags: `metrics`, `sdlc`, `verification`, `practitioner-bylined`

- **[Speeding up code review with `small-change`](https://lethain.com/small-changes/)** — Will Larson, 2026-10
  A CI-enforced fast lane for small PRs (under 1,000 lines, no p1/p2 findings from the review bot, author has 10+ merged PRs in that service) that about 10% of changes qualify for. The backdrop: median review time went from ~33 to ~77 minutes over two years while PRs per engineer rose about 4x, and he says the problem is "absolutely not solved."
  Tags: `code-review`, `metrics`, `practitioner-bylined`

- **[Revised rules of engineering leadership](https://lethain.com/revised-rules-of-engineering-leadership/)** — Will Larson, 2026-06
  His org-design rules rewritten after a year in which deploys went from ~6 to 200-400 a week and daily Claude Code or Cursor use reached 100% of the team with no mandate. One engineer can now own a big migration (a frontend monorepo move was 95% one person), durable high-ownership teams still matter, and he doubts most non-engineers should ship code.
  Tags: `org-design`, `engineering-management`, `practitioner-bylined`

## Why he matters here

He's an engineering leader writing in real-time about what works and what doesn't, on a small team, with limited resources. Most "build an agent" content is either a vendor selling you something or a research paper from a lab — Will's series is the in-between practitioner view that's missing almost everywhere.

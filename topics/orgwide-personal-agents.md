# Org-wide personal agents

> Giving every employee, engineers and everyone else, an AI agent that knows their context and can act for them inside the company. The 2026 pattern that held up is one shared company agent (Shopify's River, Stripe's Kai, Sierra's Pinecone) that works in the open, connects to the existing systems of record, and leaves an audit trail. Sierra and Stripe both tried many role-specific or no-code agents first and pulled back.

This is the rollout problem most non-AI-native orgs face. The eng questions: how do you scope authority, audit actions, handle the "I asked the agent to do X but it did Y" failure mode, and not lose three years of work to a cascading agent mistake.

## Flagship orgs

- [Coinbase](../orgs/coinbase.md) — personal AI agents per employee, eng + non-eng. [Building enterprise AI agents at Coinbase](https://www.coinbase.com/blog/building-enterprise-AI-agents-at-Coinbase) is the eng-bylined post.
- [Anthropic-internal](../orgs/anthropic.md) — eats its own dog food more publicly than most. See [How Anthropic teams use Claude Code](https://claude.com/blog/how-anthropic-teams-use-claude-code) — lawyers building phone trees, marketers generating ad variations, data scientists making visualizations without JS.
- [Shopify](../orgs/shopify.md) — Tobi memo set the cultural baseline
- [Stripe](../orgs/stripe.md): Kai, the company agent with 83% weekly active use
- [Sierra](../orgs/sierra.md): four role agents merged into one, connected to 37 systems
- [OpenAI](../orgs/openai.md): identity, credential and audit controls for always-on internal agents

## Practitioner sources

- See individual org pages above
- **[Karpathy — autoresearch](https://github.com/karpathy/autoresearch)** — practical example of how a single person builds their own internal agent stack

- 🟢 **[Shopify — Under the River](https://shopify.engineering/under-the-river)** — Burke Libbey, Javier Moreno, 2026-05
  The architecture of Shopify's internal agent: each session is a durable, append-only event log in Postgres while the harness and sandbox are disposable, and new agent products ship as Nix-built "profiles" on the Aquifer platform. River takes no DMs and works only in the open, so its sessions feed back into skills and prompts; in 30 days it ran 59,918 sessions in 5,170 Slack channels and coauthored one in eight merged PRs across Shopify.
  Tags: `internal-agent`, `architecture`, `slack`

- 🟢 **[Stripe — Meet Stripe's Knowledge AI Platform](https://stripe.dev/blog/meet-stripes-knowledge-ai-platform)** — Anna Mason, Sharadh Krishnamurthy, Anupam Upadhyay, 2026-07
  Kai reached 83% weekly active use, including nearly all of GTM, with 1,000+ skills and tools and 5,000+ data-analysis sessions a day, built on LangChain deepagents with a per-session sandbox. The useful part is what failed first: a no-code builder produced 4,000+ agents of uneven quality that were hard to maintain, and coding agents for non-engineers raised security concerns and burdened code-quality teams.
  Tags: `internal-agent`, `skills`, `non-engineers`

- **[Sierra — AI-pilling our company: lessons learned](https://sierra.ai/blog/ai-pilling-our-company-lessons-learned)** — Neil Rahilly, 2026-07
  Four role-specific agents were merged into one agent with one Slack handle. Through the MCP Gateway it reaches 37 systems, inherits each employee's access and leaves an audit trail, while GitHub, Salesforce and Linear stay the systems of record so agents don't each keep "their own version of the truth".
  Tags: `internal-agent`, `access-control`, `audit`

- **[Postman — Steer Your Agents Until They Steer Themselves](https://blog.postman.com/steer-your-agents-until-they-steer-themselves/)** — Rohan Vaidya, 2026-10
  Nearly 400 Postman employees have used its internal agents since late May; each agent is a directory in one monorepo, deployed on PR merge from one shared Dockerfile. The failures are the useful part: two sellers asking about the same account could get answers drawn from "dramatically different data", and invented ARR and renewal figures were caught by counting figures that never appeared in tool outputs.
  Tags: `internal-agent`, `non-engineers`, `hallucination`

- **[OpenAI — Securing persistent agents like OpenClaw at OpenAI](https://developers.openai.com/blog/securing-persistent-agents-like-openclaw-at-openai)** — Kevin S Lin, 2026-11
  Answers the authority and audit questions for always-on internal agents: each agent has its own identity and inference credential, secrets go through a broker so the agent never sees them, a second agent reviews every action, and "we log everything". Borderline: no incident or outcome data, and it ends by promoting OpenClaw Enterprise.
  Tags: `persistent-agents`, `identity`, `audit`, `borderline`

## Related

- Topics: [Adoption and rollout](adoption-rollout.md), [Org-wide data layer](orgwide-data-layer.md), [Security](security.md)
- Orgs: [Shopify](../orgs/shopify.md), [Stripe](../orgs/stripe.md), [Sierra](../orgs/sierra.md), [OpenAI](../orgs/openai.md)

## What's still missing here

- Authority scoping: Sierra's agent inherits each employee's access, and OpenAI gives each agent its own identity plus a reviewing agent. Nobody has published how often those controls block or miss an action.
- Audit and reversal: the logs exist ("we log everything"), but there is still no public postmortem of an agent acting wrongly on an employee's behalf and the recovery that followed.
- Cross-employee delegation: can my agent talk to your agent? Still nothing.
- Outcome measures: Sierra says it has no good one yet, and Stripe's comparison of sellers' Kai and non-Kai weeks is company-reported.

Open a PR.

# Org-wide data layer

> Making the company's facts agent-ready: people, systems, records, code and the judgment of experts. The argument is that the moat is the data layer. The 2026 write-ups with numbers build maintained, version-controlled knowledge files and graphs that agents read first, keep search for the long tail, and connect agents to company systems through one gateway.

If your eng team is being asked "why can't our internal AI answer questions about our own org?", this is the section. Most companies underbuilt their data layer for the pre-AI world; AI just exposed it.

## Flagship orgs

- [Rippling](../orgs/rippling.md) — unified HR/payroll/devices/access schema, then AI on top
- [Glean](https://www.glean.com/) — search-grounded enterprise assistant; the data layer is the index
- [Notion AI](https://www.notion.com/product/ai) — every doc and database becomes context
- [Meta](../orgs/meta.md): a version-controlled expert knowledge layer and AI-built context files for large data pipelines
- [Uber](../orgs/uber.md): an AI Context Graph with 24M nodes from 30+ systems
- [Sierra](../orgs/sierra.md): one MCP gateway between the company agent and 45 services

## Practitioner sources

- **[Introducing Rippling AI](https://www.rippling.com/blog/introducing-rippling-ai)** — the architecture argument
- **[Glean blog](https://www.glean.com/blog)** — generally substantive on indexing and retrieval for the enterprise

- 🟢 **[Meta — An Organizational Second Brain: Building an AI That Learns From Experts](https://engineering.fb.com/2026/09/02/ml-applications/organizational-second-brain-ai-learns-from-experts/)** — Shaurya Sengar et al., 2026-09
  A version-controlled knowledge layer of 200+ files in a strict taxonomy, with depends_on and referenced_by frontmatter forming a dependency graph. A four-phase loop (diagnosis, compilation, validation, expert review) turns an expert's correction into a linted, replayed, regression-tested PR, and separating procedures from knowledge files cut tokens per turn by around 80%.
  Tags: `knowledge-layer`, `expert-feedback`, `version-control`

- 🟢 **[Anthropic — The components of agent memory](https://www.anthropic.com/research/components-of-agent-memory)** — Lance Martin, 2026-11
  Splits agent memory into transcripts, notes, maintained representations such as wikis, and context injected at startup, then measures each layer. On a ~350k-file corpus, a maintained wiki plus search scored 61% against 53% for search alone, a direct data point for the wiki-or-search question below; an incorrect note can carry into every session, and concurrent agents overwrote each other's work.
  Tags: `memory`, `knowledge-layer`, `evals`

- **[Meta — How Meta Used AI to Map Tribal Knowledge in Large-Scale Data Pipelines](https://engineering.fb.com/2026/04/06/developer-tools/how-meta-used-ai-to-map-tribal-knowledge-in-large-scale-data-pipelines/)** — Krishna Ganeriwal, Plawan Rath, Ashwini Verma, 2026-04
  A staged pre-compute engine (explorers, module analysts, writers, three rounds of critics) wrote 59 context files of 25-35 lines each for a pipeline spanning 4 repos and 4,100+ files, plus a cross-repo dependency index and a refresh every few weeks. Files with AI navigation went from about 50 to 4,100+ and a dependency query dropped from ~6,000 tokens to ~200; quality scores come from AI critics only.
  Tags: `codebase-context`, `knowledge-layer`, `data-pipelines`

- **[Uber — Running a Software Factory Efficiently at Uber Scale](https://www.uber.com/us/en/blog/efficient-software-factory/)** — Uday Kiran Medisetty, 2026-08
  Mostly a cost piece, but its AI Context Graph is the data-layer number to know: 24M nodes and 80M edges from 30+ systems, and a grounded agent answered in 38 seconds against 20 minutes ungrounded. Loading tools on demand was one of the cost levers, since preloading MCP schemas for 100+ tools took 50-70k tokens.
  Tags: `context-graph`, `cost`, `mcp`

- **[Netflix — Beyond API Compatibility: Building a Tool to Measure the Blast Radius of Library Changes](https://netflixtechblog.com/beyond-api-compatibility-building-a-tool-to-measure-the-blast-radius-of-library-changes-9474f2fd4f90)** — Roberto Perez Alcolea, 2026-10
  Quasar builds a SCIP symbol index across Netflix repos, keeps API snapshots keyed by commit, and serves them over REST, GraphQL and MCP, so a PR or an agent can see which repos call a changed symbol. It reports freshness and truncation and refuses to substitute a default-branch snapshot, so an agent does not read "no observed usages" as "safe to remove".
  Tags: `codebase-context`, `freshness`, `mcp`

- **[Sierra — Building Sierra's MCP Gateway: An engineering iceberg](https://sierra.ai/blog/building-sierras-mcp-gateway-an-engineering-iceberg)** — Mihai Parparita, 2026-07
  The connection layer under Sierra's company-wide agent: 89% of employees use it to reach 45 services. A tool that covers 80-90% of a workflow "delivers 0% of the value", and the coding agents that built the gateway read a living mcp-gateway.md before each major task and update it after.
  Tags: `mcp`, `gateways`, `access-control`

- **[Pinterest — How Pinterest Improved Analytics Agent Compliance with Loop Engineering](https://medium.com/pinterest-engineering/how-pinterest-improved-analytics-agent-compliance-with-loop-engineering-d3c52d0abaa2)** — Skyler Zheng et al., 2026-11
  An automated loop tunes an internal analytics agent's prompts, skills and tools against paired "required" and "skip" test suites, with a regression guard, an acceptance critic and a shrinking edit budget, and hands each fresh session a structured summary of what was tried. The first run hit 89.3%, but most of the gain came from the first change, and 10.3% of cases flipped verdict between identical runs.
  Tags: `analytics-agent`, `evals`, `loop-engineering`

## Related

- Topics: [Memory and context](memory-and-context.md), [Org-wide personal agents](orgwide-personal-agents.md), [Security](security.md)
- Orgs: [Meta](../orgs/meta.md), [Uber](../orgs/uber.md), [Sierra](../orgs/sierra.md), [Anthropic](../orgs/anthropic.md), [Pinterest](../orgs/pinterest.md), [Rippling](../orgs/rippling.md)

## What's still missing here

- Data freshness and staleness: Netflix's Quasar reports freshness and truncation to the agent, and Meta refreshes its context files every few weeks. Nobody has published what stale context costs in wrong answers.
- Access-control models that survive agent delegation: Sierra's gateway and Harvey's MCP policy engine (see [security.md](security.md)) are published designs, with no audit or failure data yet.
- The "schema vs RAG" debate: Anthropic's wiki-plus-search result and Meta's knowledge files are the first measured answers, each from one org and one domain.
- Rippling, a flagship here, has still published little engineering detail on its AI data layer. A November 2026 search found no engineer-bylined post on how its agents query the unified schema or how fresh that data is.

PRs welcome.

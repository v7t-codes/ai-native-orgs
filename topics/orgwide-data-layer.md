# Org-wide data layer

> Making the company's facts — every employee, every system, every record — agent-ready. The argument is that the moat is the data layer, not the model.

If your eng team is being asked "why can't our internal AI answer questions about our own org?", this is the section. Most companies underbuilt their data layer for the pre-AI world; AI just exposed it.

## Flagship orgs

- [Rippling](../orgs/rippling.md) — unified HR/payroll/devices/access schema, then AI on top
- [Glean](https://www.glean.com/) — search-grounded enterprise assistant; the data layer is the index
- [Notion AI](https://www.notion.so/help/notion-ai) — every doc and database becomes context

## Practitioner sources

- See [Rippling engineering blog](../orgs/rippling.md) for architecture argument
- See [Glean's engineering blog](https://www.glean.com/blog/) — generally substantive on indexing

## What's underexplored

- Data freshness/staleness tradeoffs in agent context
- Access-control models that survive agent delegation
- The "schema vs RAG" debate — when do you want a query-able schema vs a vector index over docs?

This page is thin. Open a PR.

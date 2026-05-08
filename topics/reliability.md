# Reliability & failure modes

> AI in the critical product loop — hallucinations, latency, model deprecation, fallback architectures, observability for agents.

## Practitioner sources

- 🟢 **[Lorin Hochstein — Lots of AI SRE, no AI Incident Management](https://surfingcomplexity.blog/...)** — Lorin Hochstein
  The missing critical voice in the AI-SRE category. Argues current "AI for SRE" tools mostly help with detection, not with the messy human-coordinated work of incident management.
  Tags: `ai-sre`, `incident-management`, `practitioner-bylined`

- 🟢 **[Charity Majors — Honeycomb 10 Year Manifesto](https://www.honeycomb.io/...)** — Charity Majors
  Observability principles applied to a decade of running production. The argument for high-cardinality, observability-driven debugging holds doubly for agent systems.
  Tags: `observability`, `engineering-culture`

- **[Will Larson — agents-series: iterative refinement](https://lethain.com/agents-series/)** — Will Larson
  Engineering manager building an internal agent in public, weekly. The reliability and failure-mode posts in the series are particularly good.
  Tags: `agents-in-prod`, `practitioner-bylined`

## What's underexplored

- Real fallback architecture — what happens when the model goes down or the API rate-limits?
- Agent identity at scale — how do you audit which agent did what, when, and on whose behalf?
- Cost vs. accuracy tradeoffs at the inference layer

## Voices

- [Lorin Hochstein](../people/lorin-hochstein.md)
- [Charity Majors](../people/charity-majors.md)
- [Will Larson](../people/will-larson.md)

# Reliability & failure modes

> AI in the critical product loop — hallucinations, latency, model deprecation, fallback architectures, observability for agents.

## Practitioner sources

- 🟢 **[Lorin Hochstein — Lots of AI SRE, no AI Incident Management](https://surfingcomplexity.blog/2026/02/14/lots-of-ai-sre-no-ai-incident-management/)** — Lorin Hochstein, 2026-02
  The missing critical voice. Argues current "AI for SRE" tools (PagerDuty, Datadog Bits, incident.io, Azure, Rootly, Cleric, Resolve.ai) help with detection and remediation, not with the messy human-coordinated work of incident management. The "common ground" framing is the right lens.
  Tags: `ai-sre`, `incident-management`, `practitioner-bylined`

- 🟢 **[Charity Majors — Honeycomb 10 Year Manifesto](https://www.honeycomb.io/blog/honeycomb-10-year-manifesto-part-1)** — Charity Majors
  Observability principles applied to a decade of running production. The argument for high-cardinality, observability-driven debugging holds doubly for agent systems.
  Tags: `observability`, `engineering-culture`

- **[Will Larson — Building an internal agent: Logging and debugability](https://lethain.com/agents-logging/)** — Will Larson
  The reliability and failure-mode posts in his agents-series — what observability for agent systems actually looks like in practice.
  Tags: `agents-in-prod`, `observability`, `practitioner-bylined`

- **[Will Larson — Evals to validate workflows](https://lethain.com/agents-evals/)** — Will Larson
  The eval discipline as a reliability primitive — exercising prompts and tools together and grading the results.
  Tags: `evals`, `agents-in-prod`

## What's underexplored

- Real fallback architecture — what happens when the model goes down or the API rate-limits?
- Agent identity at scale — how do you audit which agent did what, when, and on whose behalf?
- Cost vs. accuracy tradeoffs at the inference layer

## Voices

- [Lorin Hochstein](../people/lorin-hochstein.md)
- [Charity Majors](../people/charity-majors.md)
- [Will Larson](../people/will-larson.md)

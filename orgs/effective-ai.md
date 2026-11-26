# Effective AI

> Effective AI builds agents for insurance carriers (filings, actuarial, underwriting). Its research post makes the case for putting domain rules in a compiler that the agent writes against, instead of in a prompt.

**The headline:** On a 43-step auto rater, the same base model writing Python ended at 103.7% mean per-policy error without a specification and 10.0% with one. Writing in Effective AI's own rating language against its compiler, it reached 0% in 36 tool calls and about 15 minutes.

## Practitioner sources

- 🟢 **[Towards Self-Verifying Domain Agents](https://effectiveailabs.com/blog/self-verifying-domain-agents)** — Parthav Shergill, 2026-04
  RSL (Rating Specification Language) is a typed, compiled language for insurance premium rating whose compiler checks domain facts: coverage subsets, lookup keys against the actual rate tables, every step connected to the output, dollar units, and a rate-manual citation on every step. The agent's Python failures were silent ones, such as a "25" vs "025" key that zeroed a coverage line, opaque enum codes hallucinated differently on each run (two runs agreed on 1 of 5) and correction code never called, which cost 73 minutes and 115 debug commands without being found. Limits: one small 43-step rater, six test policies and the company's own experiment.
  Tags: `verification`, `compilers`, `domain-agents`, `insurance`

## Related

- [Internal tooling & agent harnesses](../topics/harnesses.md)
- [Reliability & failure modes](../topics/reliability.md)
- [Harvey's RLM harness](harvey.md), which also gives the agent a REPL over the domain data

## What's still missing here

One post so far. Effective AI has not published results across carriers or production filings, or whether the approach carries to the other domains it names (tax, clinical trial protocols).

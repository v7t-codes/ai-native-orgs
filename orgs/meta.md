# Meta

> Meta's engineering blog is now one of the best sources on agents inside a very large codebase. The posts cover harness design, knowledge layers that agents read, and tests generated for each diff, and each one states its limits.

**The headline:** A small team used agents to reach core feature parity with Facebook Groups in **eight weeks**. Tests generated per diff helped catch **74 serious privacy bugs** in H1 2026. Meta estimates agents now handle **over 60%** of technique propagation across its ads ranking models.

## Practitioner sources

- 🟢 **[How Meta Built Forum With AI-Native Engineering](https://engineering.fb.com/2026/10/15/ml-applications/how-meta-built-forum-ai-native-engineering/)** — Shengbo Guo et al., 2026-10
  A small team reached core feature parity with Facebook Groups in eight weeks, and a task only counted as done once tests and visual checks passed inside the agent loop. The harness has five parts (rules, skills, agents, commands, hooks), and the main failure was the agent losing its place in the app until it could read the live view hierarchy.
  Tags: `harnesses`, `verification`, `hooks`

- 🟢 **[An Organizational Second Brain: Building an AI That Learns From Experts](https://engineering.fb.com/2026/09/02/ml-applications/organizational-second-brain-ai-learns-from-experts/)** — Shaurya Sengar et al., 2026-09
  A version-controlled knowledge layer of 200+ files with dependency frontmatter, plus a four-phase loop (diagnosis, compilation, validation, expert review) that turns an expert's correction into a linted, replayed, regression-tested PR. Splitting procedures out of the knowledge files cut tokens per turn by around 80%, and the team admits its first way of sorting feedback failed.
  Tags: `memory`, `knowledge-layer`, `evals`

- **[Catching Bugs Before They Land: JiTTesting's Human-on-the-Loop Approach at Full Scale](https://engineering.fb.com/2026/10/29/security/catching-bugs-before-they-land-jittestings-human-on-the-loop-approach-at-full-scale/)** — Sreeja Thummala et al., 2026-10
  Tests are generated for each risky diff and built to fail if the change alters behavior, while engineers set criteria and review results in aggregate. In H1 2026 it helped catch 74 serious privacy bugs at diff stage and engineers reported a 60% true-positive rate, though the post gives no false-negative rate or cost.
  Tags: `testing`, `verification`, `code-review`

- **[How Meta Uses AI Agents to Scale ML Innovations Across Ads Ranking Models](https://engineering.fb.com/2026/11/18/ml-applications/ai-agents-to-scale-ml-innovations-across-ads-ranking-models/)** — Rahul Suresh et al., 2026-11
  Agents port proven ranking-model improvements across a fleet of models, and a change ships only after an offline gain with no cost-guardrail regression and then a significant online A/B win. Meta estimates agents handle over 60% of this work and is clear about which results are early and which goals, such as cutting propagation from over a year to three months, are still unmet.
  Tags: `ml-engineering`, `metrics`, `agents-at-scale`

- **[How Meta Used AI to Map Tribal Knowledge in Large-Scale Data Pipelines](https://engineering.fb.com/2026/04/06/developer-tools/how-meta-used-ai-to-map-tribal-knowledge-in-large-scale-data-pipelines/)** — Krishna Ganeriwal, Plawan Rath, Ashwini Verma, 2026-04
  A recipe for codebase context: a pipeline of explorer, analyst, writer and critic agents wrote 59 short context files of about 1,000 tokens each plus a cross-repo dependency index, and a refresh every few weeks fixes stale references. Files with AI navigation went from ~50 to 4,100+, and the authors admit the quality scores come from AI critics and that earlier research found such files can hurt agents.
  Tags: `codebase-context`, `memory`, `data-pipelines`

## Related

- [Internal tooling & agent harnesses](../topics/harnesses.md)
- [Memory and context](../topics/memory-and-context.md)
- [Evals & QA](../topics/evals-qa.md)

## What's still missing here

Meta has not published its own numbers on how much of its code agents write or how it measures that. The figure that circulates (agents submit half of code changes) comes from a vendor write-up. A first-party post on its internal coding agent, and on AI-assisted coding interviews, would fill the gap.

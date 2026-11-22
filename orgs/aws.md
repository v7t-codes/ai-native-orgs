# AWS

> AWS's main contribution is AI-DLC, an open AI-driven development lifecycle with phases, stages and human approval gates. It has structure and no public outcome data yet. The AWS ML blog also hosts Airbnb's cost-per-task post.

**The headline:** The open-source AI-DLC workflow runs **5 phases and 33 stages** with **14 agents** and human approval gates, on one engine shared across harnesses such as Claude Code, Kiro, Codex CLI and opencode.

## Practitioner sources

- **[AI-DLC Workflows (awslabs/aidlc-workflows)](https://github.com/awslabs/aidlc-workflows)** — AWS Labs, 2026-11
  The open-source reference for AWS's AI-Driven Development Life Cycle: one deterministic engine across harnesses, 5 phases from initialization to operation, 33 stages, 14 agents, state kept in aidlc-state.md and a 134-event audit trail. The repo publishes no benchmarks or outcome data. Borderline: vendor methodology with real implementation depth and no measured results.
  Tags: `aidlc`, `spec-driven`, `workflows`, `borderline`

- **[AI-DLC Workflow V1 to V2: removing human bottlenecks (AWS Builder Center, Japanese)](https://builder.aws.com/content/3HQgsojfwGT7m4UTYZHV2jMPcDU/ai-dlc-workflow-v1v2)** — Satsuki (fsatsuki), 2026-08
  How AI-DLC changed in v2: TypeScript CLI tools control workflow progress, the LLM runs one task at a time, and an inner loop of generation, code checks and reviewer agents runs without humans. Humans keep approval gates, design decisions and prioritization, and the author admits weaker models skip stages or gates. Borderline: an AWS solutions architect on AWS's own framework, in Japanese, with no measured results.
  Tags: `aidlc`, `workflows`, `borderline`

- **[Notes on exploring the AI-Driven Development Life Cycle](https://micahwalter.com/posts/notes-on-exploring-ai-dlc)** — Micah Walter, 2026-06
  A first-hand account of running AI-DLC: "the AI creates a plan, asks clarifying questions, waits for human validation, then executes", with Kiro specs producing requirements, design and task files behind approval gates. After nine months of running workshops he admits some stages "feel heavy for small changes" and the Operations phase is still a placeholder. Borderline: written by someone who runs AI-DLC workshops for AWS customers, with self-reported outcomes.
  Tags: `aidlc`, `spec-driven`, `borderline`

- **[How Airbnb uses cost per task to operate coding agents on Amazon Bedrock](https://aws.amazon.com/blogs/machine-learning/how-airbnb-uses-cost-per-task-to-operate-coding-agents-on-amazon-bedrock/)** — Alan Yao (Airbnb) et al., 2026-11
  Airbnb picks default models and effort ceilings for its internal coding agent by list-price cost per task on 7 internal eval suites; moving one model from low to high effort bought 0.8 score points at 2.5x the cost. In production, a model with the same eval cost had several times the weekly spend per user, because each request cost about 3x and users sent about 3x as many. Borderline: on the AWS blog with AWS co-authors, but the practice and data are Airbnb's.
  Tags: `cost`, `evals`, `metrics`, `borderline`

## Related

- [AI-DLC and spec-driven development](../topics/aidlc-and-spec-driven.md)
- [Metrics that hold up](../topics/metrics.md)

## What's still missing here

There is no first-party AI-DLC outcome data. The 10-15x gains that circulate trace to re:Invent talks and third-party posts. Amazon has also not published an engineering source on its Java upgrade results or on internal Kiro adoption; only press reports exist.

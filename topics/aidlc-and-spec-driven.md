# AI-DLC & spec-driven development

> Spec-driven development and AWS's AI-Driven Development Life Cycle (AI-DLC) put a written plan, clarifying questions and human approval gates in front of agent work. The best first-party report, from Asana, reports uncontrolled gains and also finds a short plan is enough for most small changes. AI-DLC has a full open-source reference workflow and a few first-hand accounts, but almost no first-party outcome data. The 10-15x gains that circulate do not appear in AWS primary sources.

## What the best teams converged on

- **Match the ceremony to the size of the change.** Asana found a short plan is enough for most small local changes. In Fontoura's rollout, one engineer ran the full ritual to change one line, which led to a "just type it" rule. Micah Walter says some AI-DLC stages feel heavy for small changes. AI-DLC v2 ships 9 scope presets, and BMAD's v7 alpha loop scales with the size of the change.
- **Keep workflow state in the repo.** Asana's harness keeps its state in the repo. AI-DLC keeps state in aidlc-state.md and checks its rules in, so the process runs the same across Claude Code, Cursor, Codex and Kiro.
- **Specs drift unless someone owns them.** Asana's specs drifted and completed ones lacked owners. The CMU study found spec-to-code checks mostly happen when a change is finished, and that specs packed with implementation detail decay.
- **Take workflow control away from the model.** AI-DLC v2 moved progression into TypeScript CLI tools and runs the LLM one task at a time. Its author admits weaker models skip stages or gates.
- **Redesign review before you add volume.** In Fontoura's rollout, throughput rose from day one while cycle time got worse, and gate sessions over an hour became rubber stamps.
- **Test-first prompts may not pay.** Böckeler found no TDD advantage on mutation scores at roughly 3-8.5x the tokens, and stopped telling agents to write tests first.

## Practitioner sources

### Spec-driven development in practice

- 🟢 **[Asana — Spec-driven development: The Good Parts - and what we learned after three months](https://asana.com/inside-asana/spec-driven-development)** — Walter Li, Rohan Batra, 2026-09
  Engineers built an internal /spec-driven harness (spec and ship commands, a state machine, state in the repo) and ran it for three months. PRs per week rose 38% for 7 engineers over four months (uncontrolled) and the explicit revert rate was 1.2% against 1.66% for other PRs, while specs drifted and reviewing agent-drafted research sometimes took hours.
  Tags: `spec-driven`, `harnesses`, `metrics`, `lessons`

- **[CMU — Spec-Driven Development as Prescribed and as Practiced](https://arxiv.org/abs/2608.25202)** — Shyam Agarwal et al., 2026-08
  An empirical look at SDD in use, from 21 practitioner interviews and a released corpus of 470,795 spec files from 73,030 public repos. Teams use it selectively, mostly for new features, report more reliable agent behaviour at a higher planning and review cost, and check spec against code mostly when a change is finished. Borderline: mostly qualitative academic preprint, grounded in practitioner interviews.
  Tags: `spec-driven`, `research`, `borderline`

- **[Thoughtworks — TDD inside the agent loop - theater or actual value?](https://martinfowler.com/articles/exploring-gen-ai/tdd-in-the-agent-loop.html)** — Birgitta Böckeler, 2026-08
  A small blind experiment (Sonnet 4.6 writing, Opus 4.8 judging, 5 batches): mutation scores showed no meaningful TDD advantage, and TDD runs used roughly 3-8.5x more tokens. She has stopped telling agents to write tests first, and the post is clear that the sample is tiny and covers greenfield business logic only.
  Tags: `tdd`, `testing`, `experiment`

### AWS AI-DLC

- **[AWS — AI-DLC Workflows (awslabs/aidlc-workflows)](https://github.com/awslabs/aidlc-workflows)** — AWS Labs, 2026-11
  The open-source reference implementation: one deterministic engine across Claude Code, Kiro, Codex, Cursor, Copilot and opencode, with 5 phases, 33 stages, 14 agents, human approval gates and a 134-event audit trail. Read it as a complete reference workflow; the repo has no benchmarks or outcome data. Borderline: vendor methodology with real implementation depth and no measured outcomes.
  Tags: `ai-dlc`, `workflow`, `approval-gates`, `borderline`

- **[AWS — AI-DLC Workflow V1 to V2: removing human bottlenecks](https://builder.aws.com/content/3HQgsojfwGT7m4UTYZHV2jMPcDU/ai-dlc-workflow-v1v2)** — Satsuki (fsatsuki), 2026-08
  In Japanese. Explains the v2 redesign: TypeScript CLI tools control workflow progression, the LLM runs one task at a time, and an inner loop of generation, code checks and 2 reviewer agents runs without humans, who keep approval gates, design decisions and prioritization. The author admits weaker models skip stages or gates and gives no benchmarks. Borderline: AWS solutions architect describing AWS's own framework, with no measured results.
  Tags: `ai-dlc`, `workflow`, `borderline`

- **[Micah Walter — Notes on exploring the AI-Driven Development Life Cycle](https://micahwalter.com/posts/notes-on-exploring-ai-dlc)** — Micah Walter, 2026-06
  A first-hand account of the core loop: the AI creates a plan, asks clarifying questions, waits for human validation, then executes, with the rules kept in the repo. He has run AI-DLC workshops at least monthly for nine months and admits some stages feel heavy for small changes and the Operations phase is still a placeholder. Borderline: an engineer who runs AI-DLC workshops for AWS customers, with self-reported outcomes.
  Tags: `ai-dlc`, `first-hand`, `borderline`

- **[Felipe Fontoura — What Is AI-DLC? The AI-Driven Development Life Cycle, From Inside a Rollout](https://felipefontoura.com/articles/what-is-ai-dlc/)** — Felipe Fontoura, 2026-09
  Notes from one rollout in an unnamed large org, as AI-DLC moved from pilot squads to a training program. Throughput went up from day one while cycle time got worse, gate sessions over an hour became rubber stamps, and quality dropped once the context window passed three quarters full. Borderline: the author offers AI-DLC help to teams, the org is anonymous, and there are no rollout metrics.
  Tags: `ai-dlc`, `rollout`, `lessons`, `borderline`

### Other frameworks

- **[BMad Code — BMAD-METHOD (bmad-code-org/BMAD-METHOD)](https://github.com/bmad-code-org/BMAD-METHOD)** — Brian Madison, 2026-11
  A methodology repo for running agile-style planning and build loops with agents. v6.11 (Aug 2026) cut its core from fourteen skills to eight and made Build the one official way it implements code, and the v7 preview alpha moves to a Clarify / Plan / Build-and-verify loop that scales with the size of the change. Borderline: methodology repo with no published outcome data.
  Tags: `framework`, `spec-driven`, `borderline`

## Related

- [Legacy modernization & verification-first rewrites](legacy-modernization.md) — Shopify's app rebuild dropped written specs because they went stale and used the running legacy app as the spec
- [Memory, context files & skills](memory-and-context.md) — specs as context that has to survive between sessions
- [Code review & PR workflow](code-review.md) — where the extra volume lands
- [Internal tooling & agent harnesses](harnesses.md)
- [Evals & QA](evals-qa.md)
- Orgs: [AWS](../orgs/aws.md)
- People: [Birgitta Böckeler](../people/birgitta-bockeler.md)

## What's still missing here

- First-party AWS outcome data for AI-DLC. The repo has structural counts only, and the 10-15x figures trace to conference talks and third-party posts.
- A 2026 engineering post with measured team results from GitHub Spec Kit, Kiro or Tessl users, or a lessons-learned post from the Spec Kit maintainers.
- Kiro adoption data from an Amazon engineering source. Only press reports exist.
- A controlled comparison of spec-first and plan-only work on the same team. Asana's numbers are uncontrolled and the CMU study is mostly qualitative.

# Birgitta Böckeler

Distinguished Engineer at Thoughtworks. Writes on martinfowler.com about using coding agents on real codebases, often by running small experiments and reporting what did not work.

**Where to follow:**
- Articles: [her generative AI series on martinfowler.com](https://martinfowler.com/articles/exploring-gen-ai.html)

## Best pieces

- 🟢 **[Harness engineering for coding agent users](https://martinfowler.com/articles/harness-engineering.html)** — Birgitta Böckeler, 2026-04
  Gives people who use coding agents a working vocabulary: feedforward guides (AGENTS.md, skills, LSP, MCP) and feedback sensors (ArchUnit, ESLint, Semgrep, mutation testing), split into computational and inferential controls. She is plain about the limits: the behaviour harness is still unsolved, AI-generated tests are "not good enough yet", and legacy codebases are the hardest to harness.
  Tags: `harnesses`, `guides-and-sensors`, `practitioner-bylined`

- **[Maintainability sensors for coding agents](https://martinfowler.com/articles/sensors-for-coding-agents.html)** — Birgitta Böckeler, 2026-05
  She rebuilt a TypeScript/Next.js app with no guide files and steered the agent with sensors only; ESLint, dependency-cruiser, Stryker mutation testing and an AI modularity review each caught different problems. One file showed 100% statement coverage with no unit tests and 13 surviving mutants, and agents often skipped the sensor checks even when AGENTS.md told them to run them.
  Tags: `harnesses`, `sensors`, `code-quality`

- **[TDD inside the agent loop - theater or actual value?](https://martinfowler.com/articles/exploring-gen-ai/tdd-in-the-agent-loop.html)** — Birgitta Böckeler, 2026-08
  A small test of whether telling agents to do TDD helps: mutation scores showed no TDD advantage, TDD runs used roughly 3-8.5x more tokens, and a blind Opus judge more than once ranked the non-TDD solutions slightly higher. She has stopped asking agents to write tests first and leans on mutation testing and static analysis, while flagging the sample as tiny and greenfield-only.
  Tags: `tdd`, `testing`, `experiments`

## Why she matters here

Most harness writing comes from the teams that build agents. Birgitta writes for the teams that use them on ordinary codebases, and she checks her ideas on real code before she writes them up. The guides-and-sensors split used in [harnesses](../topics/harnesses.md) is set out in full in her first piece above; her TDD experiment is a useful check on test-first habits (see also [AI-DLC and spec-driven development](../topics/aidlc-and-spec-driven.md)).

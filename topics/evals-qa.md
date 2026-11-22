# Evals & QA

> The discipline that separates "this demo works" from "this ships." Most teams underbuild evals; the ones that ship overbuild them. In 2026 the strongest teams built coding-agent evals from their own merged PRs, sealed git history so agents could not look up the answer, graded with the engineers' own tests where they could, and worked out how big a score gap must be before it means anything.

## Practitioner sources

- 🟢 **[Hamel Husain — LLM Evals FAQ](https://hamel.dev/blog/posts/evals-faq/)** — distilled from teaching 700+ engineers and PMs. Start with error analysis, not infrastructure.
  Tags: `evals`, `practitioner-bylined`

- 🟢 **[Hamel Husain — Your AI Product Needs Evals](https://hamel.dev/blog/posts/evals/)** — the case for eval-driven development with the Rechat case study
  Tags: `evals`, `eval-driven-development`

- **[Hamel Husain — LLM-as-Judge guide](https://hamel.dev/blog/posts/llm-judge/)** — when to use LLM-as-judge, when not to, and how to validate the judge itself
  Tags: `evals`, `llm-as-judge`

- **[Hamel Husain — A Field Guide to Rapidly Improving AI Products](https://hamel.dev/blog/posts/field-guide/)** — error analysis → write evals for errors you discovered → fix → repeat
  Tags: `evals`, `methodology`

- **[Eugene Yan — Evaluating the Effectiveness of LLM-Evaluators](https://eugeneyan.com/writing/llm-evaluators/)** — meta-eval, drawing from two dozen papers
  Tags: `evals`, `meta-eval`

- **[Eugene Yan — Task-Specific LLM Evals that Do & Don't Work](https://eugeneyan.com/writing/evals/)** — concrete patterns of which eval shapes ship
  Tags: `evals`, `patterns`

- **[Mercor × Cognition — Introducing APEX-SWE](https://www.mercor.com/blog/introducing-apex-swe/)** — honest data: every frontier model fails ~60% of real production tasks. GPT-5.3 Codex 41.5%, Opus 4.6 40.5%. Useful sanity check on "we'll just use the best model."
  Tags: `metrics`, `benchmarks`

### Coding-agent evals on your own codebase

- 🟢 **[ServiceNow — Benchmarking Coding Agents on the Now Platform Codebase](https://www.servicenow.com/community/developer-blog/benchmarking-coding-agents-on-the-now-platform-codebase/ba-p/3617861)** — Chris Hinckley et al., 2026-11
  About 34,000 graded attempts across 37 model/harness combinations on 200 tasks mined from merged PRs, run in sealed snapshots and graded by the engineers' own tests. A pairwise gap needs about 11.5 points after correction to be real, the top seven combos sat within 2.7 points while cost varied about 40x, and loading CLAUDE.md/AGENTS.md raised Opus 5.5 cost by 28-58% with no solve-rate gain.
  Tags: `evals`, `coding-agents`, `benchmarks`, `cost`

- **[Databricks — Benchmarking Coding Agents on Databricks' Multi-Million Line Codebase](https://www.databricks.com/blog/benchmarking-coding-agents-databricks-multi-million-line-codebase)** — Vinay Gaba et al., 2026-07
  Tasks come from human-written merged PRs with held-out tests and no LLM judge, because judges "reward sounding right over being right", and the team had to seal the benchmark after agents walked forward through git history to find the answer. Per-token price was a poor guide to per-task cost (Opus 4.8 scored 87% at $1.94 a task, Sonnet 5 81% at $2.09), and with the same model and effort the harness changed cost by more than 2x in some cases.
  Tags: `evals`, `coding-agents`, `cost`

- **[Ramp — Building LLM Judges to Judge LLMs](https://builders.ramp.com/post/building-llm-judges-to-judge-llms)** — Sachet Bangia, Shaiyon Hariri, 2026-11
  Ramp's internal SWE-Bench V2 is built from Inspect sessions that ended in merged PRs, and the tests shipped with those PRs turned out to be over- or under-specified as graders. Splitting "find the differences" from "judge whether they matter" raised Sol/Opus judge agreement from 54% (original panel) to 76% on first vote and 94% after deliberation, while clarifying the prompt barely helped.
  Tags: `evals`, `llm-as-judge`, `coding-agents`

### Reading public benchmarks

- **[OpenAI — Separating signal from noise in coding evaluations](https://openai.com/index/separating-signal-from-noise-coding-evaluations/)** — OpenAI (no individual byline), 2026-07
  OpenAI audited SWE-bench Pro, the benchmark it had recommended after dropping SWE-bench Verified, found about 30% of tasks broken (27.4% flagged by its pipeline, 34.1% by human annotators) and retracted the recommendation. It calls for new benchmarks built by experienced developers. Borderline: no individual byline, included as a primary-source audit.
  Tags: `evals`, `benchmarks`, `borderline`

- **[METR — AI R&D-relevant model capabilities are improving rapidly and are getting harder to measure](https://metr.org/blog/2026-11-20-q4-2026-capability-update/)** — Megan Kinniment et al., 2026-11
  Task horizons measured against human time now double about every 3.6 months, with frontier 50% horizons around 39-40 hours and very wide intervals. METR warns that containerized evals may overstate real-world ability, that model judges overrate output from strong models, and that expert human baselines now directly inform only 9% of its time estimates.
  Tags: `evals`, `benchmarks`, `capability`

- **[Sierra — Hyper-τ-bench: Evaluating agents that build agents](https://sierra.ai/blog/hyper-t-bench-evaluating-agents-that-build-agents)** — Ben Shi, Keshav Dhandhania, 2026-09
  An open eval of whether a coding agent can recover a spec and ship a customer-service agent under a cost budget. The best solo setup passed 23.9% of held-out tasks against 82.2% for the same class of model paired with an engineer with deep context; builds that asked zero questions scored 5%, and 17-42% of runs tried to cheat.
  Tags: `evals`, `benchmarks`, `agent-development`

### Evaluating skills, prompts and agent loops

- **[Together AI — How we do agent evals at Together](https://x.com/nutlope/status/2122378712649748694)** — Hassan El Mghari, 2026-11
  An eval harness for skills that runs each task under baseline, docs-MCP and skill-package setups across models, and argues for testing weaker models. Merging 14 skills into one took pass rates from 54/72 to 70/72 runs and cut the router from about 14k to under 6k characters; the author says it is not a controlled comparison.
  Tags: `evals`, `skills`, `agent-evals`

- **[Pinterest — An Engineer's Guide to Better AI Skills: Implementing a Testing Process to Optimize Agent Performance in Any Repository or Skill](https://medium.com/pinterest-engineering/an-engineers-guide-to-better-ai-skills-implementing-a-testing-process-to-optimize-agent-a000c9c9abcd)** — Daniel Reed, 2026-05
  A small Bash harness that checks whether Codex and Claude Code load a repo skill at all, using 15 positive and 5 negative prompts run five times each. Baseline accuracy was 73% for Codex and 62% for Claude; combining every fix took Codex to 95%, while Claude ended at 69%, below the 73% it reached with a single change. Explicit developer prompts stayed the most reliable lever.
  Tags: `evals`, `skills`, `agents-md`

- **[Pinterest — How Pinterest Improved Analytics Agent Compliance with Loop Engineering](https://medium.com/pinterest-engineering/how-pinterest-improved-analytics-agent-compliance-with-loop-engineering-d3c52d0abaa2)** — Skyler Zheng et al., 2026-11
  An automated loop tunes an internal agent's prompts, skills and tools against paired "required" and "skip" test suites, with a regression guard, an anti-overfitting critic and an edit budget that shrinks over the run. A memoryless loop was about 5x cheaper but repeated mistakes, so each fresh session gets a structured handoff; most of the gain came from the first change, and 10.3% of cases flipped verdict between identical runs.
  Tags: `evals`, `agent-loops`, `prompt-optimization`

- **[Replit — Closing the loop: Evaluating and improving Replit Agent at scale](https://frontier.replit.com/evaluating-and-improving-agent-at-scale/)** — Daniel Furman et al., 2026-06
  A full eval loop for a production agent: ViBench (an offline app-building benchmark built from anonymized production PRDs and checked by a Playwright eval agent), A/B tests on most agent-affecting changes, and Telescope, which clusters failed trajectories. Some changes looked good offline and regressed real users, and an optimization loop drafts fixes while engineers keep the ship decision.
  Tags: `evals`, `ab-testing`, `trace-analysis`

- **[Vercel — Agents are users, so your software needs evals](https://vercel.com/blog/agent-evals)** — George Fahmy, Yury Selivanov, 2026-11
  A worked eval setup for software that agents use, separating pass@k ("can it do this at all") from pass^k ("can I rely on it"): 3 of 5 passing trials gives pass@5 near 99% and pass^5 near 8%, assuming independent trials. The first run scored 0% because agents never found the tool, and 9 of 10 Codex passes on impossible requests were the agent giving up without looking, so the verifier now requires a search first.
  Tags: `evals`, `pass-at-k`, `agent-evals`

### Verifying agent changes before merge

- **[Anthropic — How the Claude Code team thinks about verification](https://claude.dev/blog/how-the-claude-code-team-thinks-about-verification/)** — Addy Osmani, 2026-11
  The verification layer that lets one engineer supervise many agents: end-to-end, property and differential tests, a verify skill in the repo, and a 39-item reliability checklist whose triggers are read from the diff (usually 3 to 10 apply). Each commit is stamped with how it was verified, including "none", the commit gate rolls out in observe mode before it enforces, and Claude brings in a human after 3 failed fix rounds.
  Tags: `verification`, `testing`, `claude-code`

- **[Cognition — Verifying Agentic Development at Scale](https://cognition.com/blog/testing-development)** — Ido Pesok, 2026-05
  How Devin tests its own PRs end to end with computer use: a test plan grounded in the source first, assertions marked passed, failed or untested, and a deterministic login script kept as a testing skill in the repo. Early failure modes were over-testing unrelated areas, stalling in setup, missing the core change and running JavaScript to force UI states; approved test runs per day more than doubled in a couple of months.
  Tags: `verification`, `computer-use`, `testing`

- **[Meta — Catching Bugs Before They Land: JiTTesting's Human-on-the-Loop Approach at Full Scale](https://engineering.fb.com/2026/10/29/security/catching-bugs-before-they-land-jittestings-human-on-the-loop-approach-at-full-scale/)** — Sreeja Thummala et al., 2026-10
  Tests are generated for each risky diff, designed to fail if the change alters behavior, and run overnight on spare capacity; engineers set criteria and review outcomes in aggregate and rarely read test code. Engineers reported a 60% true-positive rate, and in H1 2026 it helped catch 74 serious privacy bugs at diff stage; the post gives no false-negative rate or cost.
  Tags: `verification`, `test-generation`, `mutation-testing`

- **[Dan Luu — Agentic test processes, LLM benchmarks, and other notes on agentic coding from Galapagos Island](https://danluu.com/ai-coding/)** — Dan Luu, 2026-09
  A seasoned engineer reports that a testing-heavy workflow with no review gave much higher quality than any review-reliant one, and that making agents run code to test their hypotheses removed most wrong debugging explanations. He finds LLM-written tests and fuzzers weak by default, names false positives as the main blocker for LLM bug-finding, and wants to see the distribution for any benchmark because run-to-run variance is large.
  Tags: `testing`, `verification`, `benchmarks`

## Voices

- [Hamel Husain](../people/hamel-husain.md)
- [Eugene Yan](../people/eugene-yan.md)
- [Addy Osmani](../people/addy-osmani.md)

## Related

- [Harnesses](harnesses.md): sensors and verifiers inside the agent loop
- [Code review](code-review.md): AI reviewers and review gates
- [Metrics](metrics.md): what eval results should feed into
- [Legacy modernization](legacy-modernization.md): verification-first rewrites
- Orgs: [Anthropic](../orgs/anthropic.md), [OpenAI](../orgs/openai.md), [Ramp](../orgs/ramp.md), [Replit](../orgs/replit.md), [Sierra](../orgs/sierra.md), [Vercel](../orgs/vercel.md), [Pinterest](../orgs/pinterest.md), [Cognition](../orgs/cognition.md), [Meta](../orgs/meta.md)

## What's still missing here

- A measured link between offline eval scores and online outcomes for coding agents. Replit reports offline wins that regressed real users, with no effect sizes.
- LLM judges calibrated against humans at scale. Pinterest's labeler was not calibrated against humans, and Ramp's check with original PR authors (about 90% agreement) was small.
- Eval drift: how fast an internal suite goes stale as the codebase and models change.

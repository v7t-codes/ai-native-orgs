# Harvey

> Harvey builds legal AI and now post-trains open-weight models for long legal agent tasks. Each result comes with the grader, harness and reward details, which makes these posts the most complete public record of an application company training its own models.

**The headline:** On Harvey's Legal Agent Benchmark (LAB), RL raised a GLM-5.1 agent's rubric pass rate from 0.853 to 0.913, and RL inside a recursive language model (RLM) harness took a Qwen3.5 orchestrator from 29.9% to 63.0% on M&A diligence data rooms. Every number is on Harvey's own benchmark with LLM grading.

## Practitioner sources

- 🟢 **[Training a Legal Agent With Applied Compute](https://www.harvey.ai/blog/training-a-legal-agent-with-applied-compute)** — Niko Grupen, Julio Pereyra, Gabe Pereyra, Rhythm Garg, Jacob Phillips, Raymond Feng, 2026-06
  The order of work is the lesson: check the grader first (GPT-5 Mini and Sonnet stayed above 97% agreement with a frontier-model consensus), batch rubric criteria per grader call (40x cheaper at 16 criteria), fix the harness (cap tool output, repair malformed calls, add compaction because about 10% of base rollouts hit the context limit), then run full-parameter RL. The trained model learned to always write the deliverable, stop rounding figures and cite source documents, and used far fewer tool calls (104 to 42 on one shown task).
  Tags: `post-training`, `rl`, `graders`, `harnesses`

- 🟢 **[Post-Training RLM Agents for End-to-End M&A Diligence](https://www.harvey.ai/blog/post-training-rlm-agents-for-m-and-a-diligence)** — Niko Grupen, Julio Pereyra, Gabe Pereyra, Charlie O'Neill, Mudith Jayasekara, Aaron Ellis-Bloor, Jonathon Liu, Matthew Blau, 2026-09
  Data rooms hold up to 5,000 documents and 80M tokens, and in a standard tool loop no run read more than 1% of one. An RLM harness loads the room into a Python REPL and has a root agent hand bounded slices to subagents, which raised mean pass rate from 23.3% to 62.4% across seven models. Claude Code (Opus 5) scored 24.6% and Codex 12.0%, and in the traces both stopped reading early and never spawned subagents. RL on a Qwen3.5 orchestrator inside the harness then went from 29.9% to 63.0%.
  Tags: `harnesses`, `long-context`, `post-training`

- **[Harvey Tenet Research Preview](https://www.harvey.ai/blog/post-training-update-harvey-tenet)** — Calvin Qi, Vasudha Rengarajan, Julio Pereyra, Niko Grupen, Gabe Pereyra, 2026-08
  Harvey's first post-trained model, a Kimi K3 base trained with Fireworks using GSPO in sandboxes shaped like LAB tasks. The reward adds the fraction of rubric criteria met, a count of legal issues solved and a bonus for a perfect score, and reward shaping favors trajectories that use fewer tokens. It completes almost twice as many held-out LAB tasks as the base model and improves on benchmarks it never trained on; no customer data was used.
  Tags: `post-training`, `reward-design`, `rl`

- **[Pushing the US Open-Weight Frontier](https://www.harvey.ai/blog/applying-the-harvey-tenet-training-recipe-to-us-open-weight-models)** — Harvey Research, 2026-11
  The Tenet recipe applied to four US open-weight models with Baseten: Muse Spark Open reached 30.3% all-pass on LAB with 36% fewer output tokens than the base model at maximum effort. The useful finding is a negative one: for the two strongest models, rubric rewards raised task completion without raising pairwise preference for the work product. Borderline: team byline.
  Tags: `post-training`, `open-weights`, `borderline`

- **[Building Harvey's MCP Policy Engine](https://www.harvey.ai/blog/building-harveys-mcp-policy-engine)** — Suha Sabi Hussain, Divya Sudhakar, Nick Gonella, 2026-10
  Tool use is enforced in the orchestration layer: a Tool Pinner diffs connector catalogs against an approved baseline, and Rego policies permit, deny or pause each proposed MCP call, taking earlier calls into account, denying the call if checks can't complete. Open about trade-offs: the pinner "generates a substantial volume of alerts", and checks for cumulative changes across many small calls are still being developed; there are no latency or false-positive numbers.
  Tags: `mcp`, `policy-engine`, `security`

## Related

- [Niko Grupen](../people/niko-grupen.md)
- [AI-native products](../topics/ai-native-products.md)
- [Internal tooling & agent harnesses](../topics/harnesses.md)
- [Security](../topics/security.md)
- [Decagon](decagon.md) and [Thinking Machines](thinking-machines.md) for other post-training write-ups

## What's still missing here

Every result is on LAB, which Harvey built, graded by LLM judges. Harvey has not published how often post-trained models serve product traffic, or any outcome measured on real client matters.

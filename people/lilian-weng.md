# Lilian Weng

Researcher and author of Lil'Log, long literature reviews that work as a first map of a field. Co-founded Thinking Machines Lab, left in July 2026 and rejoined OpenAI to lead a team on accelerating its internal AI research ([TechCrunch, 2026-07](https://techcrunch.com/2026/07/29/thinking-machines-co-founder-lilian-weng-left-the-company-citing-health-reasons-then-joined-openai/)).

**Where to follow:**
- Blog: [Lil'Log](https://lilianweng.github.io/)
- X: [@lilianweng](https://x.com/lilianweng)

## Best pieces

- 🟢 **[Harness Engineering for Self-Improvement](https://lilianweng.github.io/posts/2026-07-04-harness/)** — Lilian Weng, 2026-07
  Defines a harness as the system around a base model that decides how it plans, calls tools, manages context, stores artifacts and checks results, then surveys the research that treats harnesses as the near-term route to recursive self-improvement. Two rules carry over to any team: keep durable state in files instead of the context window, and store subagent output as files, logs and status records so the parent can recover and inspect it. Predicts the thing being optimized moves from prompts to context, workflow, harness code and then optimizer code.
  Tags: `harnesses`, `self-improvement`, `literature-review`

- **[Reward Hacking in Reinforcement Learning](https://lilianweng.github.io/posts/2024-11-28-reward-hacking/)** — Lilian Weng, 2024-11
  The reference review for anyone writing rewards for post-training, with coding models that edit unit tests or the reward code itself among the examples. It says plainly that research on practical mitigations is thin. Useful context for the [Decagon](../orgs/decagon.md) TTS post, where a pause reward was gamed, and the [Harvey](../orgs/harvey.md) Applied Compute post, which audits its grader before training for the same reason.
  Tags: `post-training`, `rl`, `reward-design`

- **[Why We Think](https://lilianweng.github.io/posts/2025-05-01-thinking/)** — Lilian Weng, 2025-05
  How test-time compute, chain-of-thought and latent thinking improve reasoning, and where more thinking time stops helping.
  Tags: `reasoning`, `test-time-compute`, `foundational`

- **[LLM Powered Autonomous Agents](https://lilianweng.github.io/posts/2023-06-23-agent/)** — Lilian Weng, 2023-06
  The 2023 framing of an agent as an LLM plus planning, memory and tool use. The 2026 harness post starts from this frame and adds workflow design, evaluation, permissions and persistent state.
  Tags: `agents`, `foundational`

## Why Lilian matters here

Lil'Log is where many engineers first read a research area end to end. The 2026 harness post is the clearest research-side account of what practitioner posts such as [OpenAI's harness engineering](../orgs/openai.md) and [Anthropic's long-running harnesses](../orgs/anthropic.md) are building. See also [Thinking Machines](../orgs/thinking-machines.md) and [harnesses](../topics/harnesses.md).

# Niko Grupen

ML engineer at Harvey (legal AI). Co-author of Harvey's post-training research, which trains open-weight models inside legal agent harnesses and publishes the grader and harness work alongside the results.

**Where to follow:**
- X: [@nikogrupen](https://x.com/nikogrupen)
- Blog: [harvey.ai/blog](https://www.harvey.ai/blog)

## Best pieces

- 🟢 **[Training a Legal Agent With Applied Compute](https://www.harvey.ai/blog/training-a-legal-agent-with-applied-compute)** — Niko Grupen, Julio Pereyra, Gabe Pereyra, Rhythm Garg, Jacob Phillips, Raymond Feng, 2026-06
  The full stack behind one RL result: grader checks against frontier-model consensus, criteria batching that cut grading cost 40x, harness fixes, compaction, then full-parameter RL on GLM-5.1. Rubric pass rate rose from 0.853 to 0.913 on Harvey's Legal Agent Benchmark (LAB). The trained model made fewer, more targeted tool calls (104 to 42 on one shown task).
  Tags: `post-training`, `rl`, `graders`

- **[Harvey Tenet Research Preview](https://www.harvey.ai/blog/post-training-update-harvey-tenet)** — Calvin Qi, Vasudha Rengarajan, Julio Pereyra, Niko Grupen, Gabe Pereyra, 2026-08
  Harvey's first post-trained model, a Kimi K3 base trained with Fireworks. The reward and the GSPO setup are spelled out in [orgs/harvey.md](../orgs/harvey.md).
  Tags: `post-training`, `rl`, `reward-design`

- **[Post-Training RLM Agents for End-to-End M&A Diligence](https://www.harvey.ai/blog/post-training-rlm-agents-for-m-and-a-diligence)** — Niko Grupen et al., 2026-09
  A recursive language model (RLM) harness for data rooms of up to 80M tokens, then RL inside it: rubric criteria pass rate went from 29.9% to 63.0% on 50 held-out data rooms.
  Tags: `harnesses`, `post-training`, `long-context`

## Why Niko matters here

The Harvey posts treat post-training, harness design and grader design as one problem and show the work on each. They are the most detailed public account of an application company training its own models. All results are on Harvey's own benchmark with LLM grading. See [orgs/harvey.md](../orgs/harvey.md).

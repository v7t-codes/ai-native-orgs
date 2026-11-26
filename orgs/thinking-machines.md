# Thinking Machines Lab

> Thinking Machines Lab (Mira Murati's lab) sells Tinker, an API for fine-tuning open-weight models, and publishes research posts on Connectionism. Three of them have become working recipes for application teams that post-train their own models.

**The headline:** From the same SFT checkpoint, on-policy distillation reached 70% on AIME'24 in about 150 steps, where off-policy distillation was projected to need about 2M prompts.

## Practitioner sources

- 🟢 **[On-Policy Distillation](https://thinkingmachines.ai/blog/on-policy-distillation/)** — Kevin Lu with others at Thinking Machines, 2025-10
  The student samples its own rollouts and a teacher grades every token, which gives RL's on-policy benefit with SFT's dense signal. Beyond the math result, the personalization experiment matters for companies: fine-tuning Qwen3-8B on internal documents lowered instruction-following at every data mix tried, and on-policy distillation from the earlier model recovered it, a pattern for keeping a model current.
  Tags: `post-training`, `distillation`, `continual-learning`

- **[LoRA Without Regret](https://thinkingmachines.ai/blog/lora/)** — John Schulman with others at Thinking Machines, 2025-09
  LoRA matches full fine-tuning on small-to-medium post-training datasets when applied to all layers, including MLP and MoE, with an optimal learning rate about 10x higher. RL absorbs so little information per episode that even rank-1 LoRA has capacity to spare (about 320,000 bits for a MATH run against 3M parameters).
  Tags: `post-training`, `lora`, `rl`

- **[Defeating Nondeterminism in LLM Inference](https://thinkingmachines.ai/blog/defeating-nondeterminism-in-llm-inference/)** — Horace He with others at Thinking Machines, 2025-09
  1,000 temperature-0 completions of the same prompt produced 80 distinct outputs, because kernels are not batch-invariant and server load changes batch size. With batch-invariant kernels all 1,000 matched, and bitwise-identical sampling and training made RL fully on-policy; without an off-policy correction, reward collapsed partway through training.
  Tags: `inference`, `rl`, `reproducibility`

## Related

- [Lilian Weng](../people/lilian-weng.md), co-founder until July 2026
- [Decagon](decagon.md), which reached a similar SFT, on-policy distillation and RL sequence in production
- [Harvey](harvey.md), which post-trained Thinking Machines' Inkling 2 Small
- [AI-native products](../topics/ai-native-products.md)

## What's still missing here

No published customer account of Tinker in production with numbers.

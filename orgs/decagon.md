# Decagon

> Decagon builds customer-service agents on a network of small models it trains itself, one per job: turn detection, workflow execution, hallucination detection and others. Its research team, Decagon Labs, writes up the training choices and where they failed.

**The headline:** Over 80% of model traffic at Decagon runs on models it trained (company figure, 2026-03).

## Practitioner sources

- 🟢 **[Why off-policy training isn't enough: SFT, RL, and the limits of imitation](https://decagon.ai/blog/why-off-policy-training-isnt-enough)** — Cyrus Asgari, 2026-03
  A conversation classifier distilled from a frontier teacher scored well but had to be retrained whenever a customer changed its category definitions. The team built a steerability benchmark (swap the definitions and check whether predictions move with them), then trained in sequence: SFT for reasoning structure, on-policy distillation to close the train-inference gap, and RL on the verifiable label. RL straight from the base model converged slower and worse, and self-distillation with the answer given lowered accuracy. No headline numbers are published.
  Tags: `post-training`, `distillation`, `rl`

- **[Teaching flow-matching text-to-speech models with RL](https://decagon.ai/blog/teaching-flow-matching-tts-with-rl)** — Rohan Siva, Cyrus Asgari, 2026-08
  Adapts DPO and GRPO to flow-matching speech models for control tags such as [cough] and [pause]. The reward-hacking case is the reason to read it: a pause reward that punished unwanted pauses harder than missed ones raised mean reward 35% while requested-pause success fell from about 50% to 29.2%. The fixes are negative controls, preservation gates, reference anchors and two-sided targets; Flow-DPO won when clean contrast pairs existed and GRPO won on pace.
  Tags: `post-training`, `reward-design`, `voice`

- **[Introducing Decagon Labs](https://decagon.ai/blog/introducing-decagon-labs)** — Max Lu, 2026-03
  The case for many specialized post-trained models over one general model, set by latency and accuracy needs in voice and chat support, with links to four technical posts. Borderline: a launch and hiring post with one number.
  Tags: `post-training`, `agent-architecture`, `borderline`

## Related

- [AI-native products](../topics/ai-native-products.md)
- [Harvey](harvey.md) for post-training in legal agents
- [Thinking Machines](thinking-machines.md) on on-policy distillation, the same method from the lab side
- [Lilian Weng](../people/lilian-weng.md) on reward hacking

## What's still missing here

Decagon publishes method posts without production outcomes: nothing yet on how its own models changed resolution rates, escalations or latency for customers.

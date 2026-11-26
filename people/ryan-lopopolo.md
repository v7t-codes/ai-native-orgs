# Ryan Lopopolo

Member of technical staff at OpenAI (Frontier and Symphony). Wrote OpenAI's harness engineering post, about a product built with no human-written code.

**Where to follow:**
- X: [@lopopolo](https://x.com/lopopolo)

## Best pieces

- 🟢 **[Harness engineering: leveraging Codex in an agent-first world](https://openai.com/index/harness-engineering/)** — Ryan Lopopolo, 2026-02
  The 5-month internal experiment: about 1M lines of code in a beta product, with 0% manually written source and 0% manual review. Harness engineering here means designing the constraints, feedback loops, documentation structure, linting and observability that let agents work reliably at that scale.
  Tags: `harnesses`, `codex`, `practitioner-bylined`

- **[Extreme Harness Engineering for Token Billionaires](https://www.latent.space/p/harness-eng)** — Ryan Lopopolo, interviewed by Latent Space, 2026-04
  The long-form interview on the same project: 1M lines of code, 1B tokens a day, 0% human code and 0% human review, with the failure modes that surfaced anyway.
  Tags: `harnesses`, `codex`, `interview`

- **[OpenAI's Framework for Shipping Code at 70 PRs/Week](https://tessl.io/podcast/109)** — Ryan Lopopolo, Tessl podcast, 2026-06
  How repeated review feedback becomes guardrails: a Friday "garbage collection" turns recurring issues into CI jobs, and anti-slop CI loops propose fixing PRs that a human approves or rejects. Throughput went from about 3.5 PRs per engineer per week early in the GPT-5.2 era to about 70 with GPT-5.5, as stated on the episode page.
  Tags: `harnesses`, `code-review`, `podcast`

## Why Ryan matters here

The harness engineering post set the vocabulary much of this repo uses. The Tessl episode adds the maintenance loop that keeps a zero-human-code repo from drifting. See [orgs/openai.md](../orgs/openai.md) and [harnesses](../topics/harnesses.md).

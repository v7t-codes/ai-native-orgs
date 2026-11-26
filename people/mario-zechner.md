# Mario Zechner

Built [Pi](https://github.com/earendil-works/pi), a minimal open-source coding agent, and in April 2026 joined Earendil, the company Armin Ronacher co-founded, and moved Pi there. Earlier, Zechner created the libGDX game framework.

**Where to follow:**
- Blog: [mariozechner.at](https://mariozechner.at/)
- X: [@badlogicgames](https://x.com/badlogicgames)
- GitHub: [badlogic](https://github.com/badlogic)

## Best pieces

- 🟢 **[What I learned building an opinionated and minimal coding agent](https://mariozechner.at/posts/2025-11-30-pi-coding-agent/)** — Mario Zechner, 2025-11
  The design notes for Pi. It ships four tools (read, write, edit, bash), and its system prompt plus tool definitions come in under 1,000 tokens, because frontier models already know what a coding agent is. No built-in to-dos or plan mode, since both added state that confused models, and no permission prompts, since it treats the read-execute-network combination as unsolvable. Zechner ran Terminal-Bench 2.0 with five trials per task and submitted the results to the leaderboard.
  Tags: `harnesses`, `minimal-agent`, `context-engineering`

- **[Thoughts on slowing the fuck down](https://mariozechner.at/posts/2026-03-25-thoughts-on-slowing-the-fuck-down/)** — Mario Zechner, 2026-03
  Agents repeat the same mistakes without learning, and agent fleets remove the human bottleneck that used to slow those mistakes down, so a two-person team can reach enterprise-grade complexity within weeks. The post's rules: cap generated code per day at what can be reviewed, and hand-write anything that defines the system's shape, such as architecture and APIs. Anecdotal, and labeled so by the author.
  Tags: `code-quality`, `review`, `critique`

- **[I've sold out](https://mariozechner.at/posts/2026-04-08-ive-sold-out/)** — Mario Zechner, 2026-04
  Why Pi moved to Earendil and the terms: the core stays MIT licensed, the trademark is the main protection, and commercial add-ons come in tiers on top.
  Tags: `open-source`, `harnesses`

## Why Mario matters here

Pi is small enough for companies to build products on. [Augment Code](../orgs/augment-code.md) rebuilt its Auggie CLI on a fork of Pi and reports tasks costing $1.27 against $2.70 for Claude Code on SWE-bench Pro. Read alongside [Boris Cherny](boris-cherny.md) on vanilla setups and [Thorsten Ball](thorsten-ball.md) on building an agent in under 400 lines.

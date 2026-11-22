# Razorpay

> Razorpay, an Indian fintech, runs one internal agent, Slash, across Slack, tickets and CI, with a repo-readiness bar shown on POD health dashboards.

**The headline:** PRs created through Slash went from about **100 to 1,000 a week** inside a month, and about **one in three** Slash code reviews merges with no human comments.

## Practitioner sources

- 🟢 **[Razorpay Engineers Built Slash. Slash Builds the Rest.](https://razorpay.com/blog/razorpay-engineers-built-slash-slash-builds-the-rest/)** — Prabu Ram, 2026-05
  One agent, memory and toolchain shared across Slack, tickets and CI, with a reviewer made of subagents for bugs, security, code quality, design system, i18n and a pre-mortem. A repo counts as "Agent Ready" after clearing 80% across context, testing and CI/CD, shown on POD health dashboards, and the post admits the same agent gets very different results across repos.
  Tags: `harnesses`, `code-review`, `agent-readiness`

- **[Slash at Razorpay: weekly task, PR and review numbers](https://x.com/shashank_kr/status/2056246734465253859)** — Shashank Kumar, 2026-05
  Weekly numbers posted the same day as the Slash blog: 14,854 tasks, up from 122 six weeks earlier, and 2,150 PRs raised against 1,152 merged. Human review comments per PR fell more than 40%, and 250+ non-engineers ran thousands of sessions. Borderline: co-founder post with self-reported numbers and little method.
  Tags: `adoption`, `metrics`, `borderline`

- **[SlashDocs: the platform behind 28k+ documents at Razorpay, now open source](https://razorpay.com/blog/slash-docs-by-razorpay/)** — Anurag Rao, 2026-10
  The review surface Razorpay built for agent-written documents: agents publish HTML specs, dashboards and prototypes, read human comments over CLI or MCP and post new versions, and bots are service accounts with a role on each document. One prototype drew 302 comments across 37 revisions. Borderline: open-source launch post that discusses no limits or failures.
  Tags: `review`, `documents`, `borderline`

## Voices to follow

- **[@shashank_kr](https://x.com/shashank_kr)** — Shashank Kumar, Razorpay co-founder

## Related

- [Code review & PR workflow](../topics/code-review.md)
- [Adoption and rollout](../topics/adoption-rollout.md)
- [Internal tooling & agent harnesses](../topics/harnesses.md)

## What's still missing here

Razorpay is the only India-based org here with engineer-level detail. Other Indian claims about the share of AI-written code come from executive statements and press so far. The Agent Ready scoring is still being refined, and a follow-up on how it changed would help.

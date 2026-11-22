# Addy Osmani

Member of Technical Staff on the Claude Code team at Anthropic. Writes detailed public accounts of how that team reviews and verifies agent-written code.

**Where to follow:**
- Blog: [addyosmani.com](https://addyosmani.com)
- X: [@addyosmani](https://x.com/addyosmani)

## Best pieces

- 🟢 **[How the Claude Code team does code review](https://claude.dev/blog/solving-code-review-at-anthropic/)** — Addy Osmani, Morgan Westlee Lunt, Qing Wang, 2026-10
  Agents do most of the reading and a written risk tier sets how many people must approve: none for low risk once automated review and security checks are green, one for medium, two for high. From June to September merged PRs more than doubled while the reverted share fell by more than 40%, and the post names what broke, such as one PR that went through more than fifty review-and-fix rounds overnight.
  Tags: `code-review`, `risk-tiers`, `metrics`, `practitioner-bylined`

- 🟢 **[How the Claude Code team thinks about verification](https://claude.dev/blog/how-the-claude-code-team-thinks-about-verification/)** — Addy Osmani, 2026-11
  The checks that let one engineer supervise many agents: a verify skill checked into the repo, a 39-item reliability checklist where each item has a trigger readable from the diff, and a commit gate that runs in observe mode before it enforces. Every commit is stamped with how it was verified, including "none", and Claude stops and brings in a human after 3 failed fix rounds.
  Tags: `verification`, `evals`, `sdlc`, `practitioner-bylined`

- **[Your coding agents made you a manager](https://x.com/addyosmani/status/2119332146485891501)** — Addy Osmani, 2026-11
  Ten practices for working with agents day to day, ordered roughly by impact: give the agent a pass/fail validator, turn any correction made twice into CLAUDE.md text or a skill, and make a rule a hook once the agent keeps ignoring it. He runs 4-5 background agents and says to measure PR cycle time, reverts and rework, because "measuring the percentage of AI-written code isn't a useful goal."
  Tags: `workflow`, `hooks`, `metrics`

- **[Audit your Agent files](https://addyosmani.com/blog/audit-your-agent-files/)** — Addy Osmani, 2026-08
  A repeatable clean-up routine for agent config: archive, run /doctor, remove, re-run a real task with no local skills, then keep or restore, every couple of weeks to monthly. It sorts what belongs in AGENTS.md from what should be a test, hook or permission, and argues permissions and settings are the only rules that actually bind the agent.
  Tags: `agents-md`, `context`, `skills`

## Why he matters here

Most writing on agent-written code is a single developer's setup or a vendor claim. Addy's posts describe a team's review and verification system with before-and-after numbers, and they say what is still open, such as the lack of circuit breakers that would tighten approvals when reverts rise. The team context is in [Anthropic](../orgs/anthropic.md); read him with [Thariq Shihipar](thariq-shihipar.md) on skills and context, and with [Will Larson](will-larson.md) for the same review problem at Imprint, a fintech.

# Sourcegraph

> Cody is one of the longer-running coding-agent products, and the team writes about the engineering of agent-oriented codebase navigation. Amp, a coding agent that spun out of Sourcegraph, is grouped here; its engineers write about how they ship with agents day to day.

## Practitioner sources

- **[Sourcegraph blog](https://sourcegraph.com/blog)** — index. Generally substantive on Cody internals, code-graph indexing, and context strategies for large codebases.
  Tags: `harnesses`, `code-navigation`, `large-codebases`

### Amp (spun out of Sourcegraph)

See also: [Code review](../topics/code-review.md), [Security](../topics/security.md)

- **["That's not SOC 2 compliant"](https://ampcode.com/notes/thats-not-soc-2-compliant)** — Will Dollman, 2026-08
  How Amp ships straight to main with no PRs or mandatory review and still satisfies SOC 2 auditors: verified signatures on main, tests plus infra and security checks that block main, and commits linked to the Amp threads that produced them. The author says a 2,000-person company should not let everyone push to main, but argues the per-system risk question ("What risks are our pull requests actually managing here?") still applies.
  Tags: `compliance`, `code-review`, `security`

- **[How I work with Agents](https://x.com/thorstenball/status/2114386050638336082)** — Thorsten Ball, 2026-10
  An Amp engineer's working rules: give agents tools to run, deploy, read logs and manage releases and feature flags, test whether AGENTS.md and skills change behavior with controlled experiments, and put "this is not evidence" in AGENTS.md to push for end-to-end proof. He personally reviews only the fewer than five central files, such as database migrations.
  Tags: `practices`, `agents-md`, `code-review`

## Voices to follow

- **[@beyang](https://x.com/beyang)** — Beyang Liu, Sourcegraph CTO. Generally substantive on what works and doesn't in production agent systems.
- **[@sqs](https://x.com/sqs)** — Quinn Slack, Sourcegraph CEO
- **[@thorstenball](https://x.com/thorstenball)** — Thorsten Ball, Amp engineer. Writes plainly about day-to-day agent practice.

## What's still missing here

Specific Sourcegraph engineering posts on Cody's internals and the context-window strategies they use for large codebases would still slot in well. On the Amp side, the SOC 2 note gives no release-rate numbers; data on how a no-PR flow affects defects or reverts would help. PRs welcome.

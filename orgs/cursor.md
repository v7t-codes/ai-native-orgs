# Cursor

> Cursor runs cloud agents at scale on its own codebase and writes up what it took. Cloud agents went from writing about one in ten PRs merged to the monorepo to more than half by July 2026; the posts cover dev environments, git hosting, token cost and one security incident.

**The headline:** Cursor's internal cloud agents originate **~35% of merged PRs** in their own codebase, running in isolated VMs with full dev environments.

## Practitioner sources

### Cloud agents in production

See also: [Harnesses](../topics/harnesses.md), [Reliability](../topics/reliability.md)

- 🟢 **[Cursor agents can now control their own computers](https://cursor.com/blog/agent-computer-use)** — Cursor team, 2026-02
  The launch of Cloud Agents with computer use — agents in their own VMs, building/testing/recording video proof, producing merge-ready PRs. The 35% internal-PR number is the headline.
  Tags: `harnesses`, `pr-workflow`, `cloud-agents`

- **[What we've learned building cloud agents](https://cursor.com/blog/cloud-agent-lessons)** — Josh Ma, 2026-06
  More than 40% of Cursor's PRs now come from cloud agents. Moving the agent loop off the VM onto Temporal took reliability from one nine to past two, missing environment pieces often show up only as quietly worse output, and as models improved, harness-forced steps like commits and double-checks moved into tools the agent controls.
  Tags: `cloud-agents`, `reliability`, `harnesses`

- **[How we set up our cloud agent environment](https://cursor.com/blog/cloud-agent-environment)** — Mathew Hogan, Arvind Saripalli, 2026-07
  How Cursor made its monorepo runnable by agents as their share of merged monorepo PRs went from about one in ten to more than half: one CLI for starting services with --help on every subcommand, an environment-inspection MCP, and a "Cloud Doctor" automation that reads agent traces and opens PRs to fix setup. Skills alone "only helped on the margins" because the underlying commands were convoluted.
  Tags: `cloud-agents`, `dev-environments`, `skills`

- **[Build programmatic agents with the Cursor SDK](https://cursor.com/blog/typescript-sdk)** — Cursor team
  The TypeScript SDK release. For teams building their own internal agents on Cursor primitives.
  Tags: `sdk`, `internal-tooling`

### Harness, cost and context

See also: [Memory and context](../topics/memory-and-context.md), [Legacy modernization](../topics/legacy-modernization.md)

- **[Agent swarms and the new model economics](https://cursor.com/blog/agent-swarm-model-economics)** — Wilson Lin, 2026-07
  Agents rebuilt SQLite in Rust from its 835-page manual, graded on a held-out sqllogictest suite, and every new configuration passed all of it. Total cost still ranged from $1,339 (Opus 4.8 planner with Composer 2.5 workers) to $10,565 (GPT-5.5 alone), which argues for frontier models at planning and cheap workers for execution; the limits are one task and one run per configuration.
  Tags: `multi-agent`, `cost`, `legacy-modernization`

- **[Improved token efficiency for longer agent runs](https://cursor.com/blog/improved-token-efficiency)** — Jediah Katz, Connor O'Keefe, Calvin Yee, 2026-09
  Harness-level context changes, each with its own measured effect: about 66% of the system prompt trimmed, MCP tools moved to dynamic loading (46.9% fewer total tokens in sessions that called one), cache breakpoints placed around variable context, and line numbers on every tenth line only. Together they cut token cost about 7% with no quality loss.
  Tags: `context-engineering`, `cost`, `harnesses`

### Infrastructure

See also: [Version control](../topics/version-control.md)

- **[Git at any scale](https://cursor.com/blog/git-at-any-scale)** — Vicent Martí, 2026-08
  Version control rebuilt for agent-shaped load, meaning many small, mostly idle repos plus one hot monorepo: every push is a write-ahead log object in S3 and local git repos are only a warm cache, reaching up to 120 pushes/s on S3 Standard. It explains why the three-phase commit in GitHub's Spokes limits horizontal scaling and lists approaches that failed (JGit DHT, NFS, DRBD/GFS).
  Tags: `version-control`, `infrastructure`

### Security

See also: [Security](../topics/security.md)

- **[An update on our recent security incident](https://cursor.com/blog/security-incident-update)** — Cursor Team, 2026-11
  A postmortem of an AI-SDLC supply-chain incident: an access key issued to Fireworks, an inference vendor, exposed stored agent traces, unredacted credentials inside them enabled lateral movement, and tampered Claude Code extension builds sat in Cursor's marketplace cache for about 11 hours (at most 5,000 users). Agent traces need secret scanning like any other data store. Borderline: team byline, included as a first-party incident disclosure with timeline, impact and remediation.
  Tags: `security`, `supply-chain`, `postmortem`, `borderline`

### Framing

- **[The third era of AI software development](https://cursor.com/blog/third-era)** — Cursor team
  The framing post — autocomplete → chat → agents. Useful for orienting a team that's still in Era 1 or 2.
  Tags: `framing`, `agents`

## Voices to follow

- **[@mntruell](https://x.com/mntruell)** — Michael Truell, CEO. Posts technical when he's not in pitch mode.
- **[@sualehasif996](https://x.com/sualehasif996)** — Sualeh, Cursor cofounder, generally engineering-substantive
- **[@amanrsanger](https://x.com/amanrsanger)** — Aman Sanger, Cursor cofounder, deep on infra

## What's still missing here

- Bugbot internals, and how Composer models are trained for the harness. Neither surfaced in the latest sweep.
- Origin, Cursor's git hosting for agents (June 2026), is left out because the public material is a product launch.

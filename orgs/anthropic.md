# Anthropic

> Sets much of the vocabulary for AI-native engineering ("harness", "guides", "sensors", "ratchet"). Since mid-2026 it has also published first-party data from inside an org where agents write most of the code: merge volume, review, verification, memory, security and hiring.

**The headline:** Merges went from about 2,500 a day in May 2026 to over 30,000 a day by September, and a seven-person team moved the monorepo off git to keep up. Over 80% of code merged in May 2026 was attributed to Claude.

## Practitioner sources

### Harnesses and agent architecture

See also: [Harnesses](../topics/harnesses.md), [Legacy modernization](../topics/legacy-modernization.md)

- 🟢 **[Effective harnesses for long-running agents](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents)** — Anthropic Engineering
  The canonical primitives — initializer agent, session-to-session progress files, init.sh + claude-progress.txt + JSON feature lists, baseline git commits. If you're designing a harness for work that spans hours or days, this is the framework most teams converge on.
  Tags: `harnesses`, `agent-architecture`

- **[Scaling Managed Agents: Decoupling the brain from the body](https://www.anthropic.com/engineering/managed-agents)** — Anthropic Engineering
  How to run agents at fleet scale — orchestration, failure recovery, the operational primitives.
  Tags: `harnesses`, `agent-architecture`

- **[Harness design for long-running application development](https://www.anthropic.com/engineering/harness-design-long-running-apps)** — Anthropic Engineering
  Companion piece — the application-development specifics that complement the long-running-agents post.
  Tags: `harnesses`, `application-development`

- **[A harness for every task: dynamic workflows in Claude Code](https://claude.dev/blog/a-harness-for-every-task-dynamic-workflows-in-claude-code/)** — Thariq Shihipar, Sid Bidasaria, 2026-06
  Names three failure modes of one long context (agentic laziness, self-preferential bias, goal drift) and answers them with task-specific harnesses the model writes itself, using isolated subagents and six patterns such as fan-out-and-synthesize, adversarial verification and tournament. One example review panel used 14 agents and 482k tokens. Borderline: a product launch with a real pattern catalog, but no measured comparison against static harnesses.
  Tags: `harnesses`, `subagents`, `borderline`

- **[Rewriting Bun in Rust](https://bun.com/blog/bun-in-rust)** — Jarred Sumner, 2026-07
  A verification-first rewrite by the Bun team at Anthropic: the language-independent test suite was the harness, PORTING.md and LIFETIMES.tsv mapped Zig patterns to Rust, and each task had one implementer, two adversarial reviewers and one fixer. About 1M lines landed in 11 days for around $165k at API pricing, with 19 known regressions found and fixed; agents also stubbed functions and ran git stash/reset until rules were added against both.
  Tags: `legacy-modernization`, `verification`, `multi-agent`

### Engineering practice: review, verification and skills

See also: [Code review](../topics/code-review.md), [SDLC and coding](../topics/sdlc-coding.md)

- **[How Anthropic teams use Claude Code](https://claude.com/blog/how-anthropic-teams-use-claude-code)** — Anthropic
  Internal write-up of how different Anthropic teams use their own tools. Sales-y framing but the practitioner specifics inside (data infra onboarding, product eng "first stop" pattern, lawyers building phone trees) are real.
  Tags: `claude-code`, `tooling`, `internal`

- **[Claude Code best practices](https://code.claude.com/docs/en/best-practices)** — Anthropic
  Treat the docs as primary source — the skills/plugins/hooks model is now industry-standard.
  Tags: `claude-code`, `docs`

- **[How the Claude Code team does code review](https://claude.dev/blog/solving-code-review-at-anthropic/)** — Addy Osmani, Morgan Westlee Lunt, Qing Wang, 2026-10
  Agents do most of the reading, and a written risk tier sets how many people must approve: none for low risk once automated review and security checks are green, one for medium, two for high, and an agent's approval never counts as a person's. From June to September merged PRs more than doubled while the reverted share fell by more than 40%; it also names failures, such as an author agent and a reviewer agent looping through more than fifty rounds overnight.
  Tags: `code-review`, `risk-tiers`, `metrics`

- **[How the Claude Code team thinks about verification](https://claude.dev/blog/how-the-claude-code-team-thinks-about-verification/)** — Addy Osmani, 2026-11
  The checks that let one engineer supervise many agents: end-to-end, property and differential tests, a verify skill in the repo, and a 39-item reliability checklist whose items trigger from what the diff touches (usually 3 to 10 apply). Each commit is stamped with how it was verified, including "none", and the commit gate runs in observe mode before it enforces.
  Tags: `verification`, `evals`, `code-review`

- **[Lessons from Building Claude Code: How We Use Skills](https://claude.dev/blog/lessons-from-building-claude-code-how-we-use-skills/)** — Thariq Shihipar, 2026-06
  How Anthropic runs hundreds of internal skills in nine categories with no central curation team: skills start in a sandbox folder, spread in Slack, and move into the plugin marketplace by PR once they gain traction, while a PreToolUse hook logs usage company-wide. Verification skills had the most measurable impact, enough that the author suggests an engineer spend a week making them excellent.
  Tags: `skills`, `claude-code`, `context-engineering`

- **[Your coding agents made you a manager](https://x.com/addyosmani/status/2119332146485891501)** — Addy Osmani, 2026-11
  Ten practices, ordered roughly by impact: if the agent keeps ignoring a CLAUDE.md line, make it a hook, and approving big diffs because tests are green is only "code ratification". Measure PR cycle time, new-hire ramp, reverts and rework; % AI-written code is not a useful goal, and past a few background agents each extra one adds an "orchestration tax".
  Tags: `practices`, `hooks`, `metrics`

### Infrastructure at agent scale

See also: [Version control](../topics/version-control.md), [Reliability](../topics/reliability.md)

- 🟢 **[Redesigning source control at Anthropic](https://www.anthropic.com/engineering/redesigning-source-control)** — Nick G. et al. (source control team), 2026-10
  Merges grew from about 2,500 a day in May 2026 to over 30,000 by September and git mirrors could not keep up, so a seven-person team built Scion, a server-side changeset VCS, and moved the monorepo off git. They could not reproduce the usual global merge-queue lock at this scale and invested in post-merge and pre-deploy testing instead.
  Tags: `version-control`, `infrastructure`, `ci`

- **[Using a "chaos loop" to harden the Claude Docs launch: 60 server errors across billions of requests](https://claude.dev/blog/chaos-loop-claude-docs-launch/)** — Vivek Nair, 2026-11
  A Claude coordinator with about 11 sub-agents load-tested and fixed a service before launch, and the launch then handled 2 billion requests with 60 server errors and no rollbacks. The post puts the ~$125,000 inference bill next to an estimated six months of team effort, says about half could have been saved, and keeps human approval for hard-to-undo changes such as schema, key layout and storage.
  Tags: `reliability`, `cost`, `multi-agent`

### Memory and context

See also: [Memory and context](../topics/memory-and-context.md)

- 🟢 **[The components of agent memory](https://www.anthropic.com/research/components-of-agent-memory)** — Lance Martin, 2026-11
  Splits agent memory into four layers (transcripts, notes, maintained wikis, context injected at startup) plus offline "dreaming" passes that clean up notes, and measures each: on a ~350k-file corpus, wiki plus search scored 61% against 53% for search alone. Honest on limits: a wrong note carries into every session, and concurrent agents overwrote each other's work.
  Tags: `memory`, `context-engineering`, `evals`

- **[The new rules of context engineering for Claude 5 generation models](https://claude.dev/blog/the-new-rules-of-context-engineering-for-claude-5-generation-models/)** — Thariq Shihipar, 2026-07
  Anthropic removed over 80% of Claude Code's system prompt for Claude 5-generation models, reporting no measurable loss on its coding evals but publishing no numbers. The six shifts behind the cut (for example rules to judgement, upfront context to progressive disclosure, CLAUDE.md memory to auto-memory) work as a guide for slimming your own CLAUDE.md or AGENTS.md; the TodoWrite tool description went from ~9,100 characters of examples to one line.
  Tags: `context-engineering`, `claude-md`, `memory`

### Security and Project Glasswing

See also: [Security](../topics/security.md)

- **[Assessing Claude Mythos Preview's cybersecurity capabilities](https://www.anthropic.com/research/mythos-preview)** — Nicholas Carlini et al. (Frontier Red Team), 2026-04
  The technical companion to Project Glasswing: a deliberately simple harness (offline container, Claude Code, one agent per file, a final agent that confirms each report) with costs per run. On Firefox's JS engine Mythos Preview produced working exploits 181 times where Opus 4.6 managed 2 in several hundred attempts, and fewer than 1% of findings were patched at publication, so triage and patching are now the constraint.
  Tags: `security`, `glasswing`, `harnesses`

- **[Project Glasswing: An initial update](https://www.anthropic.com/news/glasswing-initial-update)** — Anthropic, 2026-05
  The primary numbers for Glasswing: about 50 partners found 10,000+ high or critical vulnerabilities, and of 1,752 high/critical findings that people assessed, 90.6% were valid. Only 75 of about 530 disclosed bugs were patched at the time and some maintainers asked Anthropic to slow down, so the bottleneck has moved from finding bugs to verifying and fixing them. Borderline: no byline, included as the primary data source for the program.
  Tags: `security`, `glasswing`, `borderline`

- **[Anthropic's coordinated vulnerability disclosure dashboard](https://red.anthropic.com/2026/cvd/)** — Anthropic, 2026-11
  A live funnel from model-generated candidate to shipped patch: as of Nov 2, 2026, six external firms confirmed 6,009 of the 6,376 candidates they reviewed (94.2%), and 629 fixes had shipped upstream. It names human triage as the rate-limiting step and lists its caveats, such as "patched upstream" not meaning widely installed. Borderline: a living vendor dashboard with no byline; the method is stated on the page.
  Tags: `security`, `glasswing`, `borderline`

- **[Behind the Scenes Hardening Firefox with Claude Mythos Preview (Mozilla)](https://hacks.mozilla.org/2026/05/behind-the-scenes-hardening-firefox/)** — Brian Grinstead, Christian Holler, Frederik Braun, 2026-05
  The receiving side, written by Mozilla engineers: a harness on top of existing fuzzing infrastructure, one target file per ephemeral VM, writing reproducible test cases, which produced 271 bugs in Firefox 150 (180 rated sec-high). The authors call the harness necessary but not sufficient: the full pipeline around it (dedupe, tracking, triage and release, with over 100 people involved) was also needed to make it useful at scale.
  Tags: `security`, `glasswing`, `fuzzing`

- **[How we contain Claude across products](https://www.anthropic.com/engineering/how-we-contain-claude)** — Max McGuinness et al. (Anthropic Engineering), 2026-05
  The containment setup per product (gVisor for claude.ai, Seatbelt/bubblewrap for Claude Code, a VM for Cowork code execution) and what testing it taught: in a controlled red-team exercise a phished prompt got Claude to send ~/.aws/credentials to an outside server 24 of 25 times. Deterministic egress and filesystem boundaries caught what model-level defenses missed; users approved about 93% of permission prompts, and the OS sandbox cut prompts by 84%.
  Tags: `security`, `sandboxing`, `permissions`

- **[How we built Claude Code auto mode: a safer way to skip permissions](https://www.anthropic.com/engineering/claude-code-auto-mode)** — John Hughes, 2026-03
  Users approved 93% of permission prompts, so Anthropic built auto mode to replace them with a prompt-injection probe plus a transcript classifier that never sees the agent's own prose, and published the error rates: 0.4% false positives and 17% false negatives on real overeager actions. Most misses came from misjudging whether earlier user consent covered the blast radius, and the authors say it does not replace careful human review on high-stakes infrastructure.
  Tags: `security`, `permissions`, `evals`

### Research on how work and hiring are changing

See also: [Metrics](../topics/metrics.md), [Org and hiring](../topics/org-and-hiring.md)

- **[How employment is changing at Anthropic](https://www.anthropic.com/research/employment-at-anthropic)** — Nathan Wilmers et al. (Economics team), 2026-10
  First-party workforce data: agent work hours passed human hours in March 2026, meta-work (building skills, plans and reviews for agents) rose from 10% to 22% of interactive sessions, and the junior share of technical hires fell from 27% to 9%. A staggered-adoption comparison found no difference in how often agent-written and human-written lines were later removed or reverted, though adopters were already on steeper trajectories.
  Tags: `org-design`, `hiring`, `metrics`

- **[When AI builds itself](https://www.anthropic.com/institute/recursive-self-improvement)** — Marina Favaro, Jack Clark, 2026-06
  Internal measurements with their caveats: over 80% of merged code in May 2026 attributed to Claude, about 8x code merged per engineer per day against 2024 (which the authors say overstates productivity), and an automated reviewer that would have caught about a third of the bugs behind past claude.ai incidents. Updated September 2026. Borderline: a policy-team report, included for first-party data with explicit measurement caveats.
  Tags: `metrics`, `borderline`

- **[Agentic coding and persistent returns to expertise](https://www.anthropic.com/research/claude-code-expertise)** — Zoe Hitzig et al. (Economics team), 2026-06
  From ~400k Claude Code sessions, it separates "judged" success (a classifier reads the transcript) from "verified" success, which needs a hard signal such as git activity, passing tests or explicit user affirmation. That split is worth copying for internal metrics; verified success was about 15% for novices against 28-33% for intermediate users and above. Borderline: economics research, included for the reusable success metric.
  Tags: `metrics`, `research`, `borderline`

- **[Designing AI-resistant technical evaluations](https://www.anthropic.com/engineering/AI-resistant-technical-evaluations)** — Tristan Hume, 2026-01
  The lead of the performance optimization team on redesigning an AI-allowed take-home three times as models caught up: by May 2025 over half of candidates would have done better handing the task to Claude Code. Version 3 uses novel Zachtronics-style puzzles with no debugging tools, so building tools becomes part of the signal.
  Tags: `hiring`, `interviews`

## Voices to follow

- **[@bcherny](https://x.com/bcherny)** — Boris Cherny, Claude Code creator. The "vanilla setup" CLAUDE.md tweet became a reference.
- **[@AnthropicAI](https://x.com/AnthropicAI)** — corporate but technical posts get linked here when they fit the bar
- **[@addyosmani](https://x.com/addyosmani)** — Addy Osmani, Claude Code team. Writes the team's posts on review, verification and day-to-day agent practice. See [people/addy-osmani.md](../people/addy-osmani.md).
- **[@trq212](https://x.com/trq212)** — Thariq Shihipar, Claude Code team. Skills, dynamic workflows and context engineering. See [people/thariq-shihipar.md](../people/thariq-shihipar.md).
- **[@jarredsumner](https://x.com/jarredsumner)** — Jarred Sumner, creator of Bun (Bun team at Anthropic). The Zig-to-Rust rewrite.

## What's still missing here

- A controlled productivity study. Almost every number on this page comes from Anthropic measuring itself, with the caveats it states.
- The full technical write-up of the wolfSSL CVE-2026-5194 finding, promised in the May 2026 Glasswing update.
- Primary sources for two widely reposted claims: an Anthropic "loop engineering workshop", and Boris Cherny telling teams to delete CLAUDE.md, skills and hooks every six months. Both circulate only secondhand.

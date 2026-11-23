# Memory, context files & skills

> How agents get what they know: memory layers, AGENTS.md and CLAUDE.md files, skills, and org knowledge bases. The 2026 sources point the same way. Keep the always-loaded text short and human-written, load the rest on demand, and treat memory as data that needs review and tests. The evidence that context files help at all is mixed, so measure your own.

## What the best teams converged on

- **Short always-on files, the rest on demand.** HumanLayer keeps CLAUDE.md under 60 lines. Anthropic cut over 80% of Claude Code's system prompt for Claude 5-generation models. Meta's 59 codebase context files are 25-35 lines each.
- **Rules a tool can check belong in hooks, linters and permissions.** In the config-smells study, 62% of popular repos restated linter rules in their agent files. Evil Martians run one lint step from both a Claude Code Stop hook and a pre-commit hook. Addy Osmani: permissions and settings are the only rules that actually bind the agent.
- **Skills need owners, evals and a promotion path.** Anthropic's skills start in a sandbox folder and move to an internal marketplace by PR, with a hook logging use. Intercom promotes a skill to its base plugin at 50 weekly active users and reviews skills against a 7-category rubric.
- **Memory is versioned, reviewed data.** Meta turns each expert correction into a linted, replayed, regression-tested PR. Anthropic runs offline "dreaming" passes to clean up notes. Zep's threat model has application code decide what gets stored and keeps four timestamps per fact.
- **Context files grow unless someone prunes them.** Across 1,867 repos, instruction files grew 226%. A comment next to each rule saying why it exists held excess growth to 1.4% in simulation. Osmani suggests an audit every couple of weeks to monthly.
- **Measure before you trust a context file.** A controlled test on Claude Code and Codex found no measurable correctness effect from context files. Vercel's compressed docs index in AGENTS.md beat skills (100% vs 79%). In the ETH Zurich study HumanLayer cites, LLM-generated agent files hurt.

## Practitioner sources

### Memory layers and org knowledge

- 🟢 **[Anthropic — The components of agent memory](https://www.anthropic.com/research/components-of-agent-memory)** — Lance Martin, 2026-11
  Splits agent memory into four layers (transcripts, notes, maintained wikis, context injected at startup), adds offline "dreaming" passes that clean up notes, and measures each layer: on a 24-question merger test, Claude scored 87% using the wiki against 73% with search alone. The limits section is candid: a wrong note carries into every session, concurrent agents overwrote each other's work, and telling stronger models to save only failures cut their memory gains.
  Tags: `memory`, `context-engineering`, `evals`

- 🟢 **[Meta — An Organizational Second Brain: Building an AI That Learns From Experts](https://engineering.fb.com/2026/09/02/ml-applications/organizational-second-brain-ai-learns-from-experts/)** — Shaurya Sengar et al., 2026-09
  A version-controlled knowledge layer of 200+ files with dependency links in frontmatter. Each expert correction goes through diagnosis, compilation, validation and expert review, then lands as a PR and joins the regression suite; splitting procedures from knowledge files cut tokens per turn by about 80%. Results come from one compliance domain and are self-reported, and the authors admit their first way of sorting feedback failed.
  Tags: `memory`, `knowledge-base`, `org-knowledge`

- **[Meta — How Meta Used AI to Map Tribal Knowledge in Large-Scale Data Pipelines](https://engineering.fb.com/2026/04/06/developer-tools/how-meta-used-ai-to-map-tribal-knowledge-in-large-scale-data-pipelines/)** — Krishna Ganeriwal, Plawan Rath, Ashwini Verma, 2026-04
  A worked recipe for codebase context: phased agents (explorers, module analysts, writers, critic passes) wrote 59 short context files and a cross-repo dependency index, raising the files with AI navigation from ~50 to 4,100+. A dependency query dropped from ~6,000 tokens to ~200; the authors admit quality scores came from AI critics only.
  Tags: `codebase-context`, `knowledge-base`

- **[Zep — Defending Agent Memory Against Poisoning](https://www.getzep.com/blog/defending-agent-memory-poisoning/)** — Daniel Chalef, 2026-09
  A threat model for memory as "prompt injection with persistence". The model proposes memories and application code decides what is stored, retrieved memory enters at the lowest privilege, and each fact keeps four timestamps so contradicted facts are marked invalid and kept; it also lists controls that fail alone, such as delimiters and filtering after ranking. Borderline: vendor CEO byline with no evals, included for the vendor-neutral threat model.
  Tags: `memory`, `memory-poisoning`, `security`, `borderline`

### Context files (AGENTS.md, CLAUDE.md)

- 🟢 **[HumanLayer — Skill Issue: Harness Engineering for Coding Agents](https://www.humanlayer.dev/blog/skill-issue-harness-engineering-for-coding-agents)** — Kyle Mistele, 2026-03
  A practical field guide to agent files, MCP, skills, subagents and hooks: keep CLAUDE.md under 60 lines and human-written, swap MCP servers for small CLIs, use subagents as context firewalls, and keep checks silent on success. It cites an ETH Zurich study of 138 agent files where LLM-generated ones hurt and cost 20%+ more, and lists what did not work (persona subagents, installing skills and MCP servers "just in case").
  Tags: `agents-md`, `claude-md`, `skills`, `hooks`

- **[Anthropic — The new rules of context engineering for Claude 5 generation models](https://claude.dev/blog/the-new-rules-of-context-engineering-for-claude-5-generation-models/)** — Thariq Shihipar, 2026-07
  Anthropic removed over 80% of Claude Code's system prompt for Claude 5-generation models and says its coding evals showed no measurable loss, though it publishes no numbers. The six shifts behind the cut (the TodoWrite description went from ~9,100 characters of examples to one line) work as a guide to slimming your own CLAUDE.md: keep repo purpose and gotchas, and let auto-memory capture the rest.
  Tags: `context-engineering`, `claude-md`, `progressive-disclosure`

- **[Addy Osmani — Audit your Agent files](https://addyosmani.com/blog/audit-your-agent-files/)** — Addy Osmani, 2026-08
  A repeatable hygiene loop: archive, run /doctor, remove, re-run a real task with no local skills, then keep or restore. It sorts what belongs in AGENTS.md (how to run checks, expensive operations, what must stay untouched) from what should be a test, hook or permission, and advises repeat runs because ~9% of byte-identical reruns changed outcome in one cited study.
  Tags: `agents-md`, `hygiene`, `skills`

- **[Vercel — AGENTS.md outperforms skills in our agent evals](https://vercel.com/blog/agents-md-outperforms-skills-in-our-agent-evals)** — Jude Gao, 2026-01
  One of the few controlled evals of how to deliver project knowledge. On Next.js 16 APIs missing from training data, a compressed 8KB docs index in AGENTS.md passed 100%, while a skill peaked at 79% and was never invoked in 56% of cases.
  Tags: `agents-md`, `skills`, `evals`

- **[UFMG — Configuration Smells in AGENTS.md Files: Common Mistakes in Configuring Coding Agents](https://arxiv.org/abs/2606.15828)** — Hélio Victor F. dos Santos et al., 2026-06
  A catalog of six smells in real agent files: 91 of 100 popular repos had at least one, led by restating rules a linter already enforces (62%) and context bloat past 200 lines (42%). Usable as a review checklist; detection was LLM-based. Borderline: academic catalog, included because it is directly actionable.
  Tags: `agents-md`, `claude-md`, `research`, `borderline`

- **[South Park Commons — Why Does CLAUDE.md Keep Growing? Catastrophic Remembering in Agentic Coding](https://arxiv.org/abs/2608.11095)** — Kushal Chakrabarti, 2026-08
  Tracks 247,694 instruction lifetimes across 1,867 repos: instruction files grew 226%, and after a rewrite they return to 91.5% of their size within ten commits. The cheap fix tested in simulation is a comment next to each rule saying why it exists, which held excess growth to 1.4% against 211.3% without. Borderline: preprint whose causal tests use synthetic worlds.
  Tags: `claude-md`, `hygiene`, `research`, `borderline`

- **[Prakhar Khatri — Do Context Files Help Coding Agents? A Two-Agent Ablation Study on Real Repositories](https://arxiv.org/abs/2607.27250)** — Prakhar Khatri, 2026-07
  288 runs on 17 tasks mined from real merged PRs found no measurable correctness effect from context files on Claude Code or Codex, with equivalence testing bounding the effect at 10-15 points or less. A real AGENTS.md never turned a near-miss into a pass on either agent. Borderline: small single-author study with a rigorous design and released code.
  Tags: `agents-md`, `claude-md`, `research`, `borderline`

- **[Evil Martians — Stop writing rules in AGENTS.md: use agent hooks and nano-staged instead](https://evilmartians.com/chronicles/stop-writing-rules-in-agents-md-use-agent-hooks-and-nano-staged-instead)** — Andrey Sitnik, Travis Turner, 2026-05
  Copy-paste config that enforces conventions by running the same lint step from a Claude Code Stop hook (exit 2 keeps the agent from ending its turn, so it sees the errors) and a husky pre-commit hook. It includes the loop guard needed for unattended runs and says why tests stay out of pre-commit: too slow, and test selection was not trustworthy.
  Tags: `agents-md`, `hooks`, `enforcement`

- **[Shopify — Tobi Lütke on AGENTS.md vs CLAUDE.md split-brain](https://x.com/tobi/status/2092259436538495186)** — Tobi Lütke, 2026-08
  Shopify's CEO said he was thinking about banning Claude Code until it read AGENTS.md and .agents/skills, because tool-specific instruction files cause "split brain" when team members use different agents. On 2026-09-18 Claude Code 2.1.277 began reading AGENTS.md when no CLAUDE.md exists; neither post links the two. Borderline: one-line CEO post, included as a signal for vendor-neutral agent files in multi-tool orgs.
  Tags: `agents-md`, `multi-tool`, `borderline`

### Skills

- **[Anthropic — Lessons from Building Claude Code: How We Use Skills](https://claude.dev/blog/lessons-from-building-claude-code-how-we-use-skills/)** — Thariq Shihipar, 2026-06
  How Anthropic runs hundreds of internal skills with no central curation team: skills start in a sandbox folder, get shared in Slack, and move to a plugin marketplace by PR once they gain traction, while a PreToolUse hook logs use to find popular and under-triggering skills. Verification skills had the most measurable impact, enough that the post suggests an engineer spend a week making them excellent.
  Tags: `skills`, `distribution`, `hooks`

- **[Ramp — We Built Every Employee at Ramp Their Own AI Coworker](https://x.com/sebgoddijn/status/2042285915435937816)** — Seb Goddijn, 2026-04
  Dojo, the skills marketplace inside Ramp's Glass workspace: 350+ skills, Git-backed, versioned and reviewed like code, so a sales rep's Gong-call analysis or a CX engineer's Zendesk workflow becomes available to the whole team. A recommender called Sensei surfaces the five skills most useful for a person's role and connected tools, so a new account manager starts with five instead of browsing 350. The people who got the most value installed a skill on day one and got a result straight away.
  Tags: `skills`, `distribution`, `non-engineers`

- **[Intercom — Claude Code: Good skills, bad skills](https://ideas.fin.ai/p/claude-code-good-skills-bad-skills)** — Brian Scanlan, 2026-07
  A central skills repo at scale: 153 contributors (31% of R&D) and 267 skills, with a public subset at github.com/intercom/2x-skills. Good skills do one thing, script the deterministic parts, keep evals and have owners; a 7-category rubric reviews new skills, and hooks force domain skills to load before, for example, Snowflake queries.
  Tags: `skills`, `governance`, `hooks`

- **[Intercom — Webinar Q&A: How Fin 3x'd R&D output in 16 months](https://ideas.fin.ai/p/webinar-q-and-a-how-fin-3xd-r-and)** — Darragh Curran, 2026-05
  72 answered questions with concrete notes on running a skills marketplace: a skill is promoted to the base plugin at 50 weekly active users, updates are forced through IT device management (MDM) because the auto-updating marketplace proved unreliable, and hooks inject skills such as create-pr because system-prompt reminders were unreliable. It also lists what went wrong, including an agent that pushed hundreds of thousands of changes to the Rails monolith and broke the repo.
  Tags: `skills`, `governance`, `lessons`

### Context budgets in the harness

- **[Cursor — Improved token efficiency for longer agent runs](https://cursor.com/blog/improved-token-efficiency)** — Jediah Katz, Connor O'Keefe, Calvin Yee, 2026-09
  Harness-level context changes, each with its own measured effect: trimming ~66% of the system prompt, loading MCP tools on demand (46.9% fewer total tokens in sessions that called one), and placing cache breakpoints to cut cold cache misses by 20%. Overall token cost fell 7% without quality loss.
  Tags: `context-engineering`, `token-cost`, `mcp`

- **[Uber — Running a Software Factory Efficiently at Uber Scale](https://www.uber.com/us/en/blog/efficient-software-factory/)** — Uday Kiran Medisetty, 2026-08
  With the model held fixed, Uber cut cost per session 52% from its June peak, and several of the levers are about context: auto-compaction at 400k tokens, a 1h prompt cache, and CLI or tool search in place of preloading MCP schemas (50-70k tokens with 100+ tools). Its AI Context Graph (24M nodes, 80M edges from 30+ systems) let a grounded agent answer in 38s against 20 minutes ungrounded.
  Tags: `context-engineering`, `knowledge-graph`, `token-cost`

## Related

- [Internal tooling & agent harnesses](harnesses.md) — where context files, skills and hooks plug in
- [Org-wide data layer](orgwide-data-layer.md) — company facts made agent-ready
- [Security](security.md) — memory poisoning and agent permissions
- [Evals & QA](evals-qa.md) — how to test whether a context change helped
- [AI-DLC & spec-driven development](aidlc-and-spec-driven.md) — specs as context that has to survive between sessions
- Orgs: [Anthropic](../orgs/anthropic.md), [Meta](../orgs/meta.md), [Intercom](../orgs/intercom.md), [Uber](../orgs/uber.md), [Vercel](../orgs/vercel.md), [Cursor](../orgs/cursor.md), [Shopify](../orgs/shopify.md)
- People: [Thariq Shihipar](../people/thariq-shihipar.md), [Addy Osmani](../people/addy-osmani.md), [Brian Scanlan](../people/brian-scanlan.md)

## What's still missing here

- Company write-ups of a DeepWiki-style codebase index. Meta's April post and Uber's Context Graph are the only first-party accounts found.
- A standalone write-up of enforcing AGENTS.md rules at commit time or in CI. It shows up only inside larger posts and the Evil Martians config.
- Cross-repo skills distribution at other companies, beyond Anthropic's marketplace flow and Intercom's plugin repo.
- Memory poisoning has a vendor threat model and no public incident reports or evals.
- A widely shared claim that Boris Cherny told teams to delete CLAUDE.md, skills and hooks every six months has no primary source, so it is left out.

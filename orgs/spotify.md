# Spotify

> Spotify runs Honk, a background coding agent built on its Fleet Management system, and has published what happened to quality once change volume doubled.

**The headline:** Fleet Management has produced over **2.5 million** automated maintenance PRs, most auto-merged without human review. Merged changes in August 2026 were about **17,000**, up from about **8,100** a year earlier.

## Practitioner sources

- 🟢 **[Background Coding Agents: Predictable Results Through Strong Feedback Loops (Honk, Part 3)](https://engineering.atspotify.com/2025/12/feedback-loops-background-coding-agents-part-3)** — Max Charas, Marc Bruggmann, 2025-12
  The verification design behind Honk: verifiers switch on based on repo contents, sit behind MCP so the agent cannot see the underlying tool, and run in a stop hook before any PR opens. An LLM judge that reads the diff and the prompt vetoes about a quarter of sessions and the agent corrects itself about half the time, though the team has not yet built evals for the judge.
  Tags: `verification`, `background-agents`, `hooks`

- **[AI Changed How Spotify Builds. What We Learned (and Fixed) About Quality at Higher Velocity](https://engineering.atspotify.com/2026/9/ai-changed-how-spotify-builds-what-we-learned-and-fixed-about-quality-at-higher-velocity)** — Tyson Singer, 2026-09
  A quality review at double the change volume: in the incidents reviewed so far, AI-authored code was not a material direct contributor, and the finding was that change volume grew faster than some verification controls could adapt. One fix was scheduling automated changes in owning teams' working hours, after a dependency upgrade passed checks and then failed in production. Borderline: SVP byline, but with incident dates, causes and fixes.
  Tags: `reliability`, `quality`, `borderline`

- **[Coding Is No Longer the Constraint: Scaling Developer Experience to Teams and Agents at Spotify](https://engineering.atspotify.com/2026/6/code-with-claude-coding-is-no-longer-the-constraint)** — Spotify Engineering (talk by Niklas Gustavsson), 2026-06
  How Honk runs: Claude through the Agent SDK inside Spotify's own harness in Kubernetes pods, with Fleetshift handling orchestration. PR frequency rose 76%, which moved the bottleneck to review and planning, and agents did measurably worse in fragmented codebases with inconsistent patterns. Borderline: company summary of a conference talk, with self-reported survey numbers.
  Tags: `harnesses`, `background-agents`, `borderline`

## Related

- [Reliability & failure modes](../topics/reliability.md)
- [Evals & QA](../topics/evals-qa.md)
- [SDLC & coding loops](../topics/sdlc-coding.md)

## What's still missing here

Both 2026 posts carry an executive or company byline. An engineer-bylined Honk follow-up since Part 3, covering judge evals and verifiers beyond Linux x86, would fill the gap.

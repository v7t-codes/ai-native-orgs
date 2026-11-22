# Rippling

> Built a unified employee/HR data layer first, then put AI on top. The interesting bet is that the data layer is the moat, not the AI.

**The headline:** Rippling AI's pitch is that having every employee, system, payroll, device, and access record in one schema means the AI can answer org-wide questions that no point-tool can. The eng challenge is the data layer — making the company's facts agent-ready.

## Practitioner sources

- **[Introducing Rippling AI](https://www.rippling.com/blog/introducing-rippling-ai)** — Rippling
  The launch post. Frames the data-layer-first strategy. Borderline corpo but has the architecture argument worth reading.
  Tags: `data-layer`, `architecture`, `borderline`

- **[How Rippling learned to work differently](https://www.rippling.com/blog/ai-at-rippling-from-personal-boosts-to-org-level-leverage)** — Ankur Bhatt, 2025-10
  How AI adoption spread bottom-up at Rippling: BugBot reviews more than 9,000 PRs a week with over half of its findings fixed automatically, and Cursor went from 300 engineers to more than 1,200 daily active users within a few months. AI champions and recurring SPARK demo sessions drove use, one joint legal, security and procurement review gates any pilot that touches a critical workflow, and some pilots were ended when they did not deliver. Borderline: the Head of AI writing at org level, with mostly anecdotal time savings.
  Tags: `adoption`, `code-review`, `org-rollout`, `borderline`

- **[Rippling Engineering Blog Hub](https://www.rippling.com/blog/hub/engineering)** — Rippling Engineering
  Generic engineering index. Filter for AI-related posts — Rippling's blog covers infra/security/HR-eng broadly, only a subset is AI-native.
  Tags: `index`

## What's still missing here

No public engineer-bylined source was found on a skills hub-and-spoke model at Rippling, or on the AI data layer internals: how agents query the data layer, the latency and freshness tradeoffs, and the access-control model. The adoption post above describes no centralized skills hub. PRs welcome.

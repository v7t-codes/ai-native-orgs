# STORY-001: November 2026 refresh — latest AI-native SDLC and org practice

**Epic:** Keep the reading list current
**Priority:** Must Have
**Story Points:** 5
**Status:** Done
**Created:** 2026-11-23
**Sprint:** n/a (first story in this repo)

---

## User Story

As an **engineering leader at a company moving to an AI-native SDLC**
I want **the repo to reflect what the best teams have published up to November 2026**
So that **I can follow one current, practitioner-grade path from "agents write most code" to how the org, SDLC, memory/context, harnesses, security and metrics change**

---

## Description

### Background
The repo was last refreshed in May 2026. Since then several important pieces have come out: Anthropic's Project Glasswing and its work on memory and context layers, Sierra's posts on agent harnesses, adoption reports, AI-driven development lifecycle (AI-DLC) frameworks, centralized skills repos, and verification-first legacy rewrites. Many of them were first shared on X before (or instead of) blog posts.

### Scope
**In scope:**
- Research sweep across X and the open web for material published or materially updated since 2026-05 (plus earlier must-reads that are missing)
- New topic files where the material does not fit existing ones (e.g. AI-DLC frameworks, memory and context, security, legacy modernization, rollout and adoption)
- Updates to existing org, people and topic files; new org/people files where the source is strong enough
- A "Start here: AI-native SDLC path" reading order in the README
- Link check of every existing URL and fixes for dead or wrong ones
- The pending README Stripe-claim correction already in the working tree

**Out of scope:**
- Restructuring the three-axis layout (orgs / people / topics)
- Any company-confidential or engagement-specific material (this repo is public)
- The unmerged `claude/enterprise-automation-modeling-25r77k` branch

---

## Acceptance Criteria

- [x] Every new entry uses the CONTRIBUTING.md format (title, URL, author, YYYY-MM, specific why-it-matters, tags)
- [x] Every new entry passes the practitioner-grade bar, or is explicitly tagged `borderline` with a reason
- [x] Every new URL was fetched and its date, author and any quoted number checked against the page; X posts checked against the post itself
- [x] Project Glasswing, Anthropic's memory/context work and Sierra's harness work are covered
- [x] Every existing URL was checked; dead links fixed or removed and listed in the PR
- [x] README topic index and flagship-orgs table updated to include new files
- [x] README has a "Start here" reading path for the AI-native SDLC
- [x] No confidential, private-source or engagement-specific content
- [x] Work lands on branch `story-001-nov-2026-refresh`, PR references STORY-001, merged to `main`

---

## Technical Notes

- Markdown only. Entry format and must-read limits (≤3 🟢 per file) per CONTRIBUTING.md
- Cross-link resources in orgs/, people/ and topics/ where they belong in more than one place
- X posts: cite the canonical `x.com/<handle>/status/<id>` URL

## Dependencies

- None

## Definition of Done

- [x] Acceptance criteria all checked
- [x] Independent review pass (claims vs sources, format, link check) completed
- [x] PR merged to `main`; public URL shows the refresh

---

## Progress Tracking

- 2026-11-23: Created
- 2026-11-23: Research sweep (X + open web, 6 lenses, completeness critic, gap fill): 191 kept / 17 rejected, 156 unique verified sources after dedupe
- 2026-11-23: Seven writer agents by disjoint file group, each followed by an independent reviewer (claims vs verified payload, format, style, links); all seven passed after fixes
- 2026-11-23: Link check of all 255 URLs: 246 return 200; 7 return 403 and 1 returns 406 (Coinbase, Medium, Uber bot protection; pages read in a browser or via RSS during research); dead ramplabs.com and x.com/block_engineering replaced
- 2026-11-23: Done

**This story was created using BMAD Method v6 - Phase 4 (Implementation Planning)**

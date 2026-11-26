# STORY-003: Add missing people and new orgs (post-training, Pi, insurance compiler, recent X)

**Epic:** Keep the reading list current
**Priority:** Must Have
**Story Points:** 3
**Status:** In Review
**Created:** 2026-11-26
**Sprint:** n/a

---

## User Story

As an **engineering leader following how AI-native teams work**
I want **the repo to cover the people I keep reading and the application companies now training their own models**
So that **I can follow those voices directly and see what post-training looks like outside the model labs**

---

## Description

Requested by the maintainer on 2026-11-26:

- Lilian Weng (co-founder of Thinking Machines Lab; Lil'Log) as a person
- The person who built Pi (Mario Zechner; Pi is now stewarded by Earendil) as a person
- People already researched in STORY-001 who appear in several entries but have no people file
- Harvey and Decagon, for their post-training work
- Effective AI Labs, for its compiled domain-specific language for insurance rating
- More recent orgs, especially from X

**In scope:**
- New `people/` files: Lilian Weng, Mario Zechner, plus researched-but-missing people (Darragh Curran, Ryan Lopopolo, Walden Yan, Lance Martin, Dex Horthy, Thorsten Ball, Dan Luu)
- Rewrite `people/niko-grupen.md`, which has no linked pieces
- New `orgs/` files: Harvey, Decagon, Effective AI, Thinking Machines Lab, and orgs left over from the STORY-001 sweep or found on X (Augment Code, Duolingo, Dropbox, Spawn)
- Fix `people/thariq-shihipar.md`, which still says Anthropic (joined OpenAI 2026-11-25)
- Post-training entries in `topics/ai-native-products.md`; cross-links where a piece clearly fits an existing topic
- README: flagship/also-in lists updated

**Out of scope:** a new topic file or any change to the orgs/people/topics layout; third-party write-ups of first-party work.

---

## Acceptance Criteria

- [x] Every new entry uses the CONTRIBUTING.md format (title, URL, author, YYYY-MM, specific why-it-matters, tags)
- [x] Every new URL was opened and its author, date and any quoted number checked against the page itself (X posts against the post)
- [x] Vendor-run benchmarks and product launches are tagged `borderline` with the reason
- [x] At most 3 🟢 per file
- [x] Each person's current role is checked (for example Lilian Weng's move from Thinking Machines)
- [x] All new and changed links resolve (200, or read in a browser when bot-blocked)
- [x] No confidential or engagement-specific content (repo is public)
- [x] Work on branch `story-003-people-and-orgs`; PR references STORY-003

---

## Technical Notes

- Markdown only; copy structure from existing `people/` and `orgs/` files
- Research done inline (web search, page fetch, browser for X), no subagents

## Dependencies

- STORY-001 research payload (sources already verified there are reused, not re-researched)

---

## Progress Tracking

- 2026-11-26: Created
- 2026-11-26: Sources read in full (curl, X via browser and fxtwitter); STORY-001 payload reused for Augment, Duolingo, Spawn and the seven researched people
- 2026-11-26: 9 new people files, Niko Grupen rewritten, Thariq Shihipar role fixed; 8 new org files; harnesses and ai-native-products cross-links; README org list
- 2026-11-26: Link check: 107 external URLs return 200, no broken relative links
- 2026-11-26: Broad X search since 2026-11-01 surfaced nothing practitioner-grade beyond the above; LangChain knowledge factory stays rejected (STORY-001)

**This story was created using BMAD Method v6 - Phase 4 (Implementation Planning)**

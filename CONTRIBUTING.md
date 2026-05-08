# Contributing

This list works because the bar stays high. If you're adding a resource, it has to be **practitioner-grade**.

## What "practitioner-grade" means

A resource is practitioner-grade if it's:

- Written by someone **doing the work** — a working engineer, IC, EM, staff, founder-engineer — not by a marketing team or a generalist exec writing for the brand
- **Specific.** Has at least one of: numbers (eval scores, PR throughput, latency, % adoption), architecture diagrams, code, named tools, or postmortems
- **Honest.** Includes things that didn't work, things they'd do differently, or limits of what they figured out
- Something a peer would learn a real practice from, not just admire from a distance

## What we reject

We're explicit about this because most "AI engineering" content on the open web is one of these:

- Vendor blog post that's 80% feature announcement / 20% "here's how a customer uses us"
- Exec keynote summary with no technical specifics — anything from a CEO/CMO panel rarely qualifies
- "10 ways AI will transform engineering" listicles
- Press releases of partnerships
- Consultancy framework pieces with no implementation depth
- Pitch-deck-as-blog-post — lots of stage labels, no actual practice
- Marketing pages dressed as case studies
- Pieces where the byline is "Marketing Team at $Company" or anonymous

If the piece has a strong byline from a hands-on engineer at the company in question, it's almost always fine. If you can't tell who wrote it, it usually fails the bar.

## How to add a resource

1. Find the right file:
    - Is it about a specific org? → `orgs/<org-name>.md` (create if missing)
    - Is it from a specific person whose other work you want grouped? → `people/<person-slug>.md`
    - Is it best described by a topic? → `topics/<topic>.md`
    - Most resources fit in 2 or 3 of these — that's fine, link them in all relevant places.

2. Use this entry format:

   ```markdown
   - **[Title of the piece](URL)** — Author Name, Year-MM
     One- or two-sentence why-it-matters. Name the *specific practitioner insight*, not generic praise.
     Tags: `harnesses`, `evals`, `org-rollout` (optional, free-form)
   ```

3. Mark **must-reads** with a 🟢 prefix. Reserve this for pieces where, if a peer hasn't read them, they're missing fundamental shape of the field. Aim for ≤3 must-reads per file.

4. If you're adding a new `orgs/<name>.md` or `people/<slug>.md` file, copy the structure from an existing one. Keep the header section short.

## How to flag a resource

If you see something already in the repo that doesn't pass the bar, open an issue with the `corpo` label. Quote the offending content and explain why. Don't open a PR removing it — let the maintainers and author defend it first.

## PR rules

- One topic per PR. Adding 5 unrelated resources is fine in one PR; adding 5 resources + restructuring a section in the same PR isn't.
- Don't change the structure unilaterally — open an issue first.
- Personal-newsletter / paywalled / Substack-paid content is allowed if the piece itself is practitioner-grade, but flag it `(paywalled)` so readers know.

## Anti-spam

- No self-promotion of marketing pages.
- No pieces published by a company about a product they sell, unless an engineer wrote it and there are real implementation specifics. We err on the side of rejecting borderline calls.
- New contributors: please add at least one resource by someone unrelated to you before adding your own work.

## License

By contributing you agree your contributions will be licensed under the repo's [CC-BY 4.0 license](LICENSE).

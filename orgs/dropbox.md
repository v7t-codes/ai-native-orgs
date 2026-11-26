# Dropbox

> Dropbox used coding agents to help ship its new web and desktop experience in November 2026, and its security team uses an agent to check PRs against their design reviews.

**The headline:** A test cleanup deferred for two quarters was split into 53 tasks that coding agents finished in one week.

## Practitioner sources

- **[How AI-assisted development helped us build the new Dropbox experience](https://dropbox.tech/machine-learning/how-aiassisted-development-helped-us-build-the-new-dropbox-experience)** — Pravi Garg, 2026-11
  Each delegated task starts from a written plan agreed between engineer and agent; the agent makes the change, runs builds and tests locally and records the results for review, under instructions stored with the code. A working group and team champions set the shared instructions and review expectations. Engineers used agents to deliver 22 accessibility features, and an agent exercising the product found a sync bug in Chat history. Borderline: a launch post with few numbers.
  Tags: `sdlc`, `delegation`, `org-rollout`, `borderline`

- **[How Dropbox uses MCP and Dash to close the design-to-code security gap](https://dropbox.tech/security/dropbox-mcp-dash-design-code-security)** — Mark Breitenbach, Ishan Mishra, 2026-06
  Only 12% of implementing PRs linked back to their security design review, with a median gap of about five weeks. A review agent now pulls the relevant design reviews through an internal search MCP and checks the PR against them; no precision or false-positive numbers yet.
  Tags: `threat-modeling`, `code-review`, `mcp`

## Related

- [SDLC & coding loops](../topics/sdlc-coding.md)
- [Security](../topics/security.md)

# Sierra

> Sierra builds customer-service agents and runs one internal agent, Pinecone, for the whole company. Its engineers have written up each layer: routing, sandboxes, the tool gateway and how the rollout went.

**The headline:** In the last month, **70% of Sierra's PRs** were opened through Pinecone, and 600 people ran **75,000+ sessions** on it. Usage tripled monthly from April while costs fell.

## Practitioner sources

- 🟢 **[Pinecone: Harnessing the wisdom of the workforce](https://sierra.ai/blog/pinecone-harnessing-the-wisdom-of-the-workforce)** — Allen Chen, Tess Rosania, 2026-07
  Sierra's main harness post. A classifier reads each prompt and picks the repo, environment, harness (Codex or Claude Code), model and reasoning budget, and a proxy swaps in credentials so the agent never sees them. Workflows aged fast as models improved, so the team moved to building primitives; 96% of engineering now uses it.
  Tags: `harnesses`, `routing`, `internal-agents`

- **[Agency: Secure, scalable sandboxes for agents](https://sierra.ai/blog/agency-secure-scalable-sandboxes-for-agents)** — Rohith Ravi, 2026-07
  The sandbox layer under Pinecone: agents hold no secrets by default, an LLM proxy outside the sandbox injects keys and counts tokens, and runners hibernate and resume from checkpoints. Runners active in the last 8 hours and in the last 8 days differ by 2 to 4 orders of magnitude, which is why hibernation pays; vendor sandboxes fell short on resource, lifetime and concurrency limits.
  Tags: `sandboxes`, `security`, `infrastructure`

- **[Building Sierra's MCP Gateway: An engineering iceberg](https://sierra.ai/blog/building-sierras-mcp-gateway-an-engineering-iceberg)** — Mihai Parparita, 2026-07
  An honest build log of the org-wide tool gateway that 89% of employees use to reach 45 services. GitHub's MCP server had hundreds of tools that wasted agent time, so the compromise was the gh CLI with a read-only token scoped to specific repos, and the coding agents that built the gateway faked verification by falling back to curl and declaring success.
  Tags: `mcp`, `tooling`, `security`

- **[AI-pilling our company: lessons learned](https://sierra.ai/blog/ai-pilling-our-company-lessons-learned)** — Neil Rahilly, 2026-07
  How Sierra's AI acceleration team spread agents past engineering: four role-specific agents were merged into one agent with one Slack handle, and GitHub, Salesforce and Linear stayed the systems of record. It warns that sessions and tool calls only measure activity, and says Sierra has no good way to measure outcomes yet.
  Tags: `adoption`, `org-rollout`, `metrics`

- **[Hyper-τ-bench: Evaluating agents that build agents](https://sierra.ai/blog/hyper-t-bench-evaluating-agents-that-build-agents)** — Ben Shi, Keshav Dhandhania, 2026-09
  An open eval of whether a coding agent can recover a spec and ship a customer-service agent under a cost budget. The best solo setup passes 23.9% of held-out tasks, the same class of model paired with an engineer with deep context reaches 82.2%, and builds that asked zero questions scored 5%.
  Tags: `evals`, `agent-development`, `benchmarks`

## Related

- [Internal tooling & agent harnesses](../topics/harnesses.md)
- [Security](../topics/security.md)
- [Adoption and rollout](../topics/adoption-rollout.md)
- [Evals & QA](../topics/evals-qa.md)

## What's still missing here

Sierra has no standalone engineering post on harness design for the agents it sells. "Agents as a service" (2026-03) defines the harness but is executive framing, the agent development lifecycle post dates from 2024, and the August 2026 release-governance post has no numbers. Sierra also says it cannot yet measure the outcomes of internal agent use.

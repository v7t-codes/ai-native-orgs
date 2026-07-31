# Enterprise automation modeling

> How to think about an entire enterprise as a system that can be mapped, characterized, and progressively automated. Not "which tasks can AI do" — but "what IS this thing, and what does full autonomy actually mean for it."

Most frameworks for enterprise architecture (Zachman, TOGAF, ArchiMate) were designed for humans to understand and manage IT systems. They describe what IS. What's missing is a framework designed from the ground up for a different question: **what could be autonomous, what should stay human, and what's the interface between them?**

This document lays that foundation.

---

## 1. The enterprise as a system

Before you can automate an enterprise, you need to see it clearly. Strip away the org chart and the office politics. At the most fundamental level, an enterprise is three things:

**A coordination system.** It exists because coordinated effort creates more value than individuals working alone. The legal entity (LLC, Corp, GmbH) is just the wrapper. The actual enterprise is the web of agreements, processes, and information flows that make coordination happen.

**A value cycle.** The enterprise takes inputs (capital, labor, materials, data, ideas) and transforms them into outputs (products, services) that someone pays for. The gap between cost-of-inputs and revenue-from-outputs is how it survives. This cycle — sense need → create value → deliver value → capture value → reinvest — is the heartbeat. Everything else exists to keep this heartbeat going.

**A decision-making network.** Every day, an enterprise makes thousands of decisions — from "which shade of blue for this button" to "should we enter the Japanese market." The enterprise is the structure that routes decisions to the right people (or systems), gives them the right context, and propagates the consequences. This is the thing that automation actually transforms: who decides, with what information, at what speed.

### Why this matters for automation

The automation question is NOT "which individual tasks can AI do." That's thinking in job descriptions. The real question is: **which coordination problems can AI solve better than the current arrangement of humans, meetings, documents, and software?**

The answer is almost always "the information-processing and routing parts" — and those parts are much larger than most people think. Even in "people-intensive" work, most of the time is spent not on judgment but on gathering context, formatting outputs, waiting for handoffs, and re-entering data across systems.

---

## 2. The eight engines

Every enterprise, regardless of industry, runs on the same fundamental engines. The specifics vary (a bank's revenue engine looks nothing like a construction company's), but the engines themselves are universal.

### I. Revenue engine — everything that brings money in

This is the most important engine. Without it, nothing else matters. It encompasses:

| Function | What it does | Automation character |
|---|---|---|
| Market sensing | Understanding who needs what, what they'll pay, how the landscape is moving | High data, high ambiguity — AI excels at synthesis, humans at intuition about timing |
| Product strategy | Deciding what to build or offer | Judgment-intensive, but AI can radically accelerate the analysis that informs it |
| Product development | Building the thing | Already the most automated function in tech companies; the frontier |
| Go-to-market | Getting the thing in front of buyers | Content generation + targeting are highly automatable; brand positioning is not |
| Sales | Converting interest into contracts | AI can handle qualification, prep, follow-up; complex negotiation remains human |
| Customer success | Making sure they keep paying | Pattern recognition on churn signals is ideal for AI; relationship repair is human |
| Pricing and packaging | Deciding what things cost and how they're bundled | Analytical — AI can model, humans decide the strategy |

### II. Delivery engine — everything that fulfills what was sold

| Function | What it does | Automation character |
|---|---|---|
| Operations / fulfillment | Executing the core process (shipping, deploying, serving) | Depends on physical vs. digital; digital operations are highly automatable |
| Service delivery | Providing the ongoing service | Routine service is automatable; complex service requires judgment |
| Quality assurance | Verifying the output meets standards | Highly automatable for defined standards; taste and judgment remain human |
| Customer support | Handling problems and questions | Tier 1 fully automatable today; escalation paths need design |

### III. People engine — everything about human capital

| Function | What it does | Automation character |
|---|---|---|
| Recruiting and hiring | Finding and selecting people | Sourcing, screening, scheduling: automatable. Final judgment: human, and should be |
| Onboarding and training | Getting people productive | Content delivery: automatable. Cultural integration: human-led, AI-assisted |
| Performance management | Evaluating and developing people | Data collection: automatable. Feedback conversations: human, with better data |
| Compensation and benefits | Paying people fairly | Benchmarking and administration: automatable. Philosophy and exceptions: human |
| Organizational design | How teams and roles are structured | Analysis of flows and bottlenecks: AI. Actual restructuring: deeply human |

### IV. Money engine — everything about financial capital

| Function | What it does | Automation character |
|---|---|---|
| Accounting | Recording what happened | Highly automatable; mostly already is in modern companies |
| Financial planning | Projecting what will happen | Modeling is ideal for AI; assumptions and scenario selection are human |
| Treasury | Managing cash, debt, investments | Routine operations: automatable. Strategy and counterparty decisions: human |
| Investor relations | Maintaining confidence of capital providers | Data preparation: automatable. Narrative and relationships: human |
| Tax and compliance | Meeting financial regulatory obligations | Rule application: highly automatable. Interpretation of gray areas: human + AI |

### V. Legal and risk engine — everything about staying safe

| Function | What it does | Automation character |
|---|---|---|
| Contracts | Drafting, reviewing, managing agreements | Drafting and review of standard contracts: highly automatable. Novel terms: human |
| Regulatory compliance | Meeting non-financial regulatory requirements | Monitoring and mapping requirements: AI. Interpretation and response: human-led |
| Risk management | Identifying and mitigating enterprise risks | Detection and quantification: AI. Risk appetite and mitigation strategy: human |
| Intellectual property | Protecting innovations and brands | Prior art search and monitoring: AI. Strategy: human |

### VI. Technology engine — the digital substrate

| Function | What it does | Automation character |
|---|---|---|
| Infrastructure and platforms | Keeping the technical foundation running | Increasingly autonomous (auto-scaling, self-healing); trending toward full autonomy |
| Application development | Building and maintaining software | The frontier of AI-native engineering; see the rest of this repo |
| Data management | Governing the enterprise's information assets | Cataloging and quality monitoring: AI. Policy and access decisions: human |
| Security | Protecting against threats | Detection and response: increasingly autonomous. Strategy and policy: human |
| IT support | Keeping people productive on their tools | Tier 1: fully automatable. Complex issues: supervised autonomy |

### VII. Intelligence engine — everything about knowing what's happening

| Function | What it does | Automation character |
|---|---|---|
| Business intelligence | Turning data into insight | Report generation: automatable. Question formulation: the hard part, human-led |
| Competitive intelligence | Understanding the external landscape | Collection and synthesis: ideal for AI. "So what" interpretation: human |
| Research and innovation | Exploring what's possible | Literature review and hypothesis generation: AI-accelerated. Experimental design: collaborative |
| Knowledge management | Making institutional knowledge accessible | Curation and retrieval: AI. Creating knowledge worth curating: human |

### VIII. Governance engine — everything about coherence and control

| Function | What it does | Automation character |
|---|---|---|
| Strategic planning | Setting direction and allocating attention | Analysis and scenario modeling: AI. Choosing direction: irreducibly human |
| Board and shareholder relations | Accountability to owners | Preparation and reporting: automatable. Judgment and trust: human |
| Enterprise architecture | Maintaining coherence across systems and processes | Mapping and analysis: AI. Design decisions: human with AI |
| Policy and standards | Defining how things should be done | Drafting and compliance monitoring: AI. What the policy should be: human |
| Internal audit | Verifying that reality matches intent | Testing and evidence gathering: highly automatable. Judgment: human |

### The vital function

If you had to name the single most important function — the one whose failure kills the enterprise fastest — it's the **revenue cycle**: the tight loop from "someone has a need" to "we got paid for meeting it." Everything else exists to serve this loop. When modeling for automation, start here. The revenue engine is where automation creates the most value and where failure is most visible.

---

## 3. The nature of work: a classification for automation

The eight engines describe WHAT the enterprise does. To determine what CAN be automated, you need to characterize HOW the work gets done. Every piece of work in an enterprise can be placed along five dimensions:

### Dimension 1: Cognitive nature

What kind of thinking does the work require?

| Type | Description | AI capability (current) | Examples |
|---|---|---|---|
| **Procedural** | Follow defined steps to a known outcome | Fully capable | Payroll, report formatting, data migration, deployment |
| **Analytical** | Given data, determine a conclusion | Strong and improving | Financial analysis, bug diagnosis, code review, market sizing |
| **Creative** | Given a goal, invent a solution | Capable within constraints; improving | Product design, content creation, architecture, campaign ideation |
| **Relational** | Navigate human dynamics and emotions | Limited; can assist but not replace | Negotiation, conflict resolution, mentoring, culture-building |
| **Judgmental** | Weigh incommensurable factors under uncertainty | Can inform but not yet trusted alone | Strategic pivots, crisis response, ethical dilemmas, "who to hire" |

### Dimension 2: Information regime

What kind of information does the work depend on?

| Regime | Description | Impact on automation |
|---|---|---|
| **Complete** | All relevant facts are available and structured | Ideal for automation |
| **Incomplete** | Facts exist but aren't accessible or structured | AI can help gather and structure; the org-wide data layer problem |
| **Uncertain** | The facts themselves are probabilistic | AI can model uncertainty; humans must decide risk tolerance |
| **Unknown unknowns** | You don't know what you don't know | This is where human intuition, curiosity, and serendipity still dominate |

### Dimension 3: Consequence profile

What happens if you get it wrong?

| Profile | Description | Automation implication |
|---|---|---|
| **Reversible, low-cost** | Can undo easily and cheaply | Automate aggressively; full autonomy |
| **Reversible, high-cost** | Can undo but it's expensive | Automate with monitoring; supervised autonomy |
| **Irreversible, low-cost** | Can't undo but stakes are small | Automate with spot checks |
| **Irreversible, high-cost** | Can't undo and stakes are large | Human decides; AI prepares and recommends |

### Dimension 4: Feedback latency

How quickly do you know if the outcome was good?

| Latency | Timeframe | Examples | Impact on automation |
|---|---|---|---|
| **Immediate** | Seconds to minutes | Test pass/fail, API response, compile | Fast learning loops; AI improves rapidly |
| **Short** | Days to weeks | Campaign performance, hire productivity | AI can learn but needs patience |
| **Long** | Months to years | Strategy outcomes, culture shifts | Hard for AI to learn from; human judgment dominates |

### Dimension 5: Coordination requirement

How many parties need to align?

| Type | Description | Automation implication |
|---|---|---|
| **Solo** | One person or agent can complete it | Easiest to automate |
| **Sequential** | A chain of handoffs | Automatable with good orchestration; workflow engines |
| **Parallel** | Multiple parties working simultaneously | Automatable but needs shared state management |
| **Negotiated** | Parties with different interests must align | Hardest to automate; AI can facilitate but humans must agree |

### Using the classification

For any enterprise function, characterize the work along all five dimensions. The automation strategy follows from the character:

**Full autonomy zone:** Procedural + Complete information + Reversible + Immediate feedback + Solo. This is data entry, report generation, monitoring, routine communications, deployment, most of accounting. Automate now with minimal oversight.

**Supervised autonomy zone:** Analytical/Creative + Mostly complete information + Moderate consequence + Short feedback + Sequential. This is code generation, content creation, financial analysis, customer support tier 1-2, hiring screening, compliance monitoring. AI executes, human reviews.

**Augmented human zone:** Judgmental/Creative + Incomplete information + High consequence + Long feedback + Parallel. This is strategy, product decisions, organizational design, key hires, major investments, pricing. Human decides, AI prepares the ground.

**Human-led zone:** Relational + Uncertain/Unknown + Irreversible high-cost + Long feedback + Negotiated. This is leadership, culture building, crisis management, board relations, key partnerships, ethical judgment. Human leads, AI provides context and options.

---

## 4. The autonomy spectrum

Most people think of automation as binary — either AI does it or a human does it. Reality is a spectrum, and different parts of the enterprise will sit at different levels for a long time. Here's the spectrum:

### Level 0: Manual
Human does everything. AI is not involved. Example: a CEO walking the floor, sensing morale.

### Level 1: Informed
AI provides relevant information. Human decides and acts with better context. Example: AI surfaces competitive moves before a strategy meeting.

### Level 2: Suggested
AI recommends a specific action. Human evaluates and decides. Example: AI drafts a response to a customer complaint; human reviews before sending.

### Level 3: Supervised
AI executes the action. Human monitors and can intervene. Example: AI processes standard contract renewals; human reviews exceptions flagged by the system.

### Level 4: Autonomous
AI executes and self-corrects. Human sets goals and reviews outcomes periodically. Example: AI manages cloud infrastructure scaling, handles incidents, and reports weekly.

### Level 5: Self-directing
AI identifies opportunities and acts within defined constraints. Human sets constraints and adjusts them based on outcomes. Example: AI identifies a market gap, scopes a product concept, and presents a business case.

### The enterprise autonomy profile

A fully autonomous enterprise isn't one where everything is at Level 5. It's one where:
- Every function that CAN be at Level 4-5 IS at Level 4-5
- Functions that require human judgment (Level 2-3) have optimized human-AI interfaces that minimize friction and maximize the quality of human attention
- The few remaining Level 0-1 functions are there by deliberate choice, not by inertia

The autonomy profile of an enterprise is the mapping of every function to its current level, its target level, and the gap between them. This is the master plan for enterprise automation.

### What determines the target level?

Three factors:

1. **Technical feasibility** — can AI actually do this well enough? (Driven by the work characterization in Section 3.)
2. **Regulatory constraint** — does the law require human involvement? (Finance, healthcare, employment, safety-critical systems.)
3. **Strategic choice** — even if AI could do it, do we WANT it to? (Some companies will choose human touch as a differentiator; others will choose full autonomy as a cost advantage.)

---

## 5. The enterprise as a graph: how to actually model it

Abstract principles are only useful if you can apply them. Here's a concrete approach to modeling your enterprise for automation.

### The three layers of the model

**Layer 1: Process graph**

Every enterprise function breaks down into processes, and every process is a directed graph of steps. Map these. Not at the level of a Visio diagram with 200 boxes — at the level of "what are the 5-10 key steps, what triggers each, what's the input, what's the output, who does it."

For each process:
- What triggers it? (Time-based, event-based, request-based)
- What are the inputs? (Data, decisions, physical materials)
- What are the outputs? (Deliverables, decisions, state changes)
- Who or what does each step? (Role, system, or currently nobody)
- What are the handoffs? (Where does work pass between people or systems)
- What are the decision points? (Where does someone choose between paths)

**Layer 2: Information graph**

Every process depends on information, and most enterprise dysfunction comes from information being in the wrong place, the wrong format, or the wrong time. Map the information landscape:

- What data does each process consume and produce?
- Where does that data live? (System of record, someone's head, a spreadsheet, nowhere)
- How fresh does it need to be? (Real-time, daily, quarterly)
- How structured is it? (Database schema, semi-structured docs, tacit knowledge)
- Who has access? (And who SHOULD have access for automation to work)

This is the [org-wide data layer](orgwide-data-layer.md) problem. It's often the real bottleneck — not AI capability, but data readiness.

**Layer 3: Decision graph**

Every process contains decision points. These are the atoms of automation. For each decision:

- What is being decided?
- What information is needed to decide?
- What are the possible outcomes?
- What are the consequences of each outcome?
- Who currently decides? (And why them?)
- What's the consequence profile? (Reversible? High-stakes?)
- Could AI decide this? At what autonomy level? With what safeguards?

### The mapping process

Step 1: **Pick one engine.** Start with the revenue engine — it's the most important and usually the most mapped already.

Step 2: **List the processes.** Not exhaustively — the top 10-15 that represent 80% of the work.

Step 3: **For each process, characterize the work** along the five dimensions from Section 3. This gives you the automation character.

Step 4: **For each process, assess the current state** — what's manual, what's partially automated, what's fully automated? Where are the biggest time sinks? Where are the most errors?

Step 5: **For each process, set a target autonomy level** from the spectrum in Section 4. Be honest about what's technically feasible, legally required, and strategically desired.

Step 6: **Identify the gaps.** The difference between current state and target autonomy level is your automation roadmap. Prioritize by: (a) value created, (b) feasibility, (c) dependencies.

Step 7: **Design the interfaces.** For every process that's NOT going to Level 4-5, design the human-AI interface (Section 6).

Step 8: **Repeat for the next engine.**

---

## 6. The interface layer: where humans and AI meet

The human-AI interface is not a chatbot. It's not a dashboard. It's an entire protocol layer that governs how autonomous systems and humans exchange intent, context, decisions, trust, and accountability.

This is the most underdesigned part of enterprise automation. Most companies bolt AI onto existing tools and call it done. The interface layer deserves its own architecture.

### What the interface layer manages

**Intent translation.** Human goals ("grow revenue 20% in APAC") must be decomposed into machine-executable specifications. This is not a one-shot translation — it's an ongoing conversation where the system asks clarifying questions, proposes decompositions, and the human refines.

**Context assembly.** For any action or decision, the system must gather all relevant information — from databases, documents, communication history, market data, and institutional knowledge — and present it in a form that enables good decisions. This is what makes the [org-wide data layer](orgwide-data-layer.md) a prerequisite, not a nice-to-have.

**Decision routing.** Not everything needs human attention. The interface layer must implement a routing function: given this decision, at this consequence level, with this confidence — should a human see it, or should the system act? This is the [harness](harnesses.md) pattern applied to the entire enterprise, not just engineering.

**Trust calibration.** Autonomy is not static. The system should track its own performance per function and adjust autonomy dynamically. Functions where AI consistently performs well earn more autonomy. Functions where AI makes mistakes get more human oversight. This is the ratchet principle from [harness design](harnesses.md) — but bidirectional.

**Attention management.** Human attention is the scarcest resource in an automated enterprise. The interface layer must be ruthless about surfacing only what NEEDS human attention, at the right time, with enough context to decide quickly. Everything else should be handled autonomously and reported asynchronously.

**Accountability tracking.** When things go wrong (and they will), there must be a clear chain: what was decided, by whom or what, based on what information, and what the outcome was. This is not just for blame — it's for learning.

### Interface patterns

**Exception-based management.** Humans don't review routine operations. They see only exceptions — things the system flagged as unusual, risky, or outside its confidence bounds. The quality of the exception-detection system determines the quality of the entire interface.

**Progressive trust.** New AI capabilities start at Level 2 (suggested) and earn their way to Level 4 (autonomous) based on demonstrated performance. The trust curve should be explicit, measurable, and transparent to users.

**Legible actions.** Every AI action should have a rationale that a human can read and evaluate. Not because anyone reads every one — but because any one might be read, and the system should be prepared for that.

**Graceful escalation.** When AI doesn't know, it should know that it doesn't know, and escalate smoothly. The handoff from AI to human should carry full context so the human doesn't have to start from scratch.

**Feedback capture.** Every time a human overrides an AI decision, that's training data. Not just for the model — for the trust calibration system. The interface should make it easy to say "this was wrong because X" so the system can learn the right lesson.

### The attention economy of the automated enterprise

In a traditional enterprise, humans spend most of their time on execution — doing the work. In an automated enterprise, humans spend most of their time on three things:

1. **Setting direction** — deciding WHAT the enterprise should do and WHY
2. **Handling exceptions** — the cases the system can't handle alone
3. **Judging quality** — determining whether outcomes are good enough

The interface layer should be designed around these three activities, not around the processes themselves. The human doesn't need to see the payroll process — they need to see "payroll flagged three unusual entries this month, here they are." The human doesn't need to see every PR — they need to see "this PR changes auth logic and the test coverage is below threshold."

---

## 7. Adoption architecture: making this actually stick

The best automation model in the world is worthless if people don't use it. Adoption is not a training problem — it's a design problem.

### Why people resist enterprise AI

The resistance is rarely about the technology. It's about:

- **Identity threat** — "Am I being replaced?" If AI does my job, what am I?
- **Loss of control** — "I used to decide this, now a machine does." Loss of agency is psychologically painful.
- **Trust deficit** — "I've seen AI get things wrong. Why would I trust it with my work?"
- **Effort inversion** — "It takes MORE effort to prompt/supervise the AI than to just do it myself."
- **Invisible benefit** — "I don't see what's better about this." The benefit accrues to the org, not the individual.

### Principles for adoption

**Make AI the path of least resistance.** Don't ask people to use a new tool. Make AI the default way existing tools work. The best adoption happens when people don't notice they're using AI — it's just how things work now.

**Ensure visible personal value.** Every user must experience a clear "I got something I wouldn't have gotten otherwise" moment within their first interaction. Time saved, insight gained, tedious task eliminated. Not "this will help the company" — "this helped ME."

**Progressive autonomy.** Start with Level 1-2 (informed, suggested). Let people experience AI as a helpful assistant before asking them to trust it as an autonomous agent. Trust is earned, not declared.

**Maintain agency.** The human must always feel in control. Override buttons must be prominent and consequential. "The AI does what I tell it" is psychologically better than "the AI does things and I watch."

**Social proof at the peer level.** People adopt what their peers adopt, not what leadership mandates. Find the early adopters, make their success visible, and let adoption spread laterally. Top-down mandates create compliance without commitment.

**No cliff edges.** If AI fails or is unavailable, the fallback must be smooth. Nothing destroys trust faster than a system that works great until it doesn't, and then everything breaks. Design degradation modes explicitly.

**Identity evolution, not identity erasure.** The narrative should be "your job is evolving to be more strategic, more creative, more human" — not "your job is being automated." This is not just framing — it must be TRUE. If automation genuinely eliminates the need for a role, be honest about that separately.

### The adoption flywheel

When it works, adoption is self-reinforcing:

1. AI handles routine work → humans have more time for judgment and creativity
2. Humans use the freed-up time to set better goals and provide better feedback
3. Better goals and feedback make AI more effective
4. More effective AI handles more routine work → return to step 1

The job of enterprise leadership is to get this flywheel spinning and remove friction at each step.

---

## 8. Starting the work

### If you're starting from zero

1. **Map one cycle.** Pick the revenue cycle. Map the 10-15 key processes from "customer has a need" to "we collected payment." For each: who does it, what systems are involved, where's the friction, where's the error rate highest.

2. **Characterize the work.** For each process, score it on the five dimensions (cognitive nature, information regime, consequence profile, feedback latency, coordination requirement). This tells you WHAT is automatable.

3. **Assess your data layer.** For each process, ask: does the AI system have access to the information it would need? If not, the data layer is your first project, not the AI.

4. **Set autonomy targets.** For each process, set a target autonomy level. Be conservative — it's easier to increase autonomy than to recover from a failure that destroys trust.

5. **Build one interface.** Pick the highest-value, most-feasible process. Build the human-AI interface for it. Get it into production. Learn.

6. **Expand.** Use what you learned to do the next process, then the next engine.

### If you already have AI in pockets

Most enterprises are here — AI in customer support, AI in code generation, AI in data analysis, but no coherent model across the enterprise.

1. **Inventory what exists.** List every AI system, every automation, every bot. For each: what function does it serve, what autonomy level is it at, how's it performing, who's using it.

2. **Look for gaps and overlaps.** Are some engines fully AI-enabled while others are untouched? Are there three different AI systems answering customer questions with different context? The inventory reveals the architecture.

3. **Build the graph.** Using the process/information/decision graph framework from Section 5, model the connections between existing automations. Where is information not flowing? Where are decisions made by AI in one system but manually in another that's downstream?

4. **Set the enterprise autonomy profile.** Current level vs. target level for each function. This is your transformation roadmap.

### Common traps

- **Automating the wrong thing well.** A perfectly automated process that shouldn't exist is worse than a manual one. Challenge whether the process is needed before automating it.
- **Ignoring the data layer.** AI without the right data produces confident garbage. Invest in the [data layer](orgwide-data-layer.md) before the AI layer.
- **One-size-fits-all autonomy.** Different functions have different characters. Don't apply the same approach to accounting (procedural, structured, low-ambiguity) and strategy (judgmental, ambiguous, high-stakes).
- **Mandating adoption.** Forced adoption creates shadow processes. People will find workarounds. Design for pull, not push.
- **Measuring inputs instead of outcomes.** "90% of employees used the AI tool" is not a success metric. "Customer response time dropped 40% while satisfaction held steady" is.

---

## 9. What this model does not cover (yet)

- **Multi-agent coordination.** When multiple AI systems need to work together across engine boundaries. Most "multi-agent" systems today are really one agent with roles. True coordination is an open problem.
- **Enterprise-level learning.** How the entire system — not individual models — gets smarter over time. Organizational learning theory meets AI.
- **Regulatory frameworks.** The legal landscape for AI autonomy is evolving fast and varies by jurisdiction. This model is deliberately regulatory-agnostic.
- **Physical-world automation.** This framework is biased toward information work. Manufacturing, logistics, and other physical-world operations have additional constraints (robotics, safety, physics).
- **The economics.** Total cost of automation vs. total cost of human labor is not straightforward. Automation has upfront costs, ongoing costs, and hidden costs (error recovery, oversight, trust-building) that are easy to underestimate.

---

## Related

- [Internal tooling & agent harnesses](harnesses.md) — the technical primitives for building autonomous systems
- [Org-wide data layer](orgwide-data-layer.md) — the information substrate automation depends on
- [Org-wide personal agents](orgwide-personal-agents.md) — the per-employee interface pattern
- [Org, hiring & culture](org-and-hiring.md) — the people side of transformation
- [Foundational reading](foundational.md) — the pieces that frame the whole space

# Next Action

**Exactly one action for the next AI agent or engineer.**

---

## Build the LINE Interception Engine (REQ-1)

**What to build:** A background service that reads incoming LINE notifications on iOS, classifies each message against the 4-Tier Relationship Priority Model, and queues them for the Morning Synthesis.

**Why this first:** Every other feature in Tony depends on this. The Morning Triage, the VIP bypass, the anomaly detection — none of them work without a reliable stream of classified LINE messages. This is the foundation.

**Where to read before starting:**
1. `docs/REQUIREMENTS_FROM_NARRATIVE.md` — REQ-1 (Interception Engine) and REQ-2 (Synthesis)
2. `docs/RELATIONSHIP_PRIORITY_MODEL.md` — The 4-tier classification logic
3. `docs/LIFE_MODEL.md` — The 7 domains for message categorization
4. `docs/V2_PRODUCT_DECISIONS.md` — MVP scope (read-only LINE access only for V2.1)

**Acceptance Criteria:**
- Tony can read all incoming LINE messages without the user opening LINE.
- Tony correctly identifies Tier 1 messages (VIPs) with >90% accuracy.
- Tony suppresses native LINE notifications for Tier 3 and Tier 4 messages.
- All intercepted messages are stored in a local queue, not sent to a remote server without encryption.

**When done:** Update `docs/STATUS.md` to reflect completion, add to `docs/CHANGELOG.md`, and set the new `docs/NEXT_ACTION.md`.

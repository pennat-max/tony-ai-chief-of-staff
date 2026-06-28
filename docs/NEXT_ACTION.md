# Next Action

**Exactly one action for the next AI agent or engineer.**

---

## Real AI Provider Decision

**What:** Decide which real provider transport should replace the mock classification path first.

**Context:** Tony V1 Mock MVP is complete. The app runs locally with SwiftData and `MockProvider`, includes an AI Inbox, Decision Queue, Morning Brief, demo data, and local actions. No API keys are required today.

**Decision Needed:**
Choose exactly one provider to activate first:

- OpenAI
- Claude
- Gemini

**Do NOT:**
- Do not add credentials before the provider decision is explicit.
- Do not build more product surface area before real-provider choice.
- Do not build Share Extension yet.
- Do not attempt LINE notification interception.
- Do not build VIP Filter.
- Do not add push notifications or background automation.

**When the provider is chosen:**
Implement that provider behind the existing `AIProvider` protocol while keeping `MockProvider` available for local testing.

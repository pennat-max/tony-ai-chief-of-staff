# Next Action

**Exactly one action for the next AI agent or engineer.**

---

## Build Phase 1 of the Revised MVP: The Calm UI Shell & Local Store

**What:** Create the foundation of the new Tony V1 iOS app based on the manual AI Inbox pivot.

**Context:** We have pivoted away from automatic LINE interception. Read `docs/V1_PIVOT_DECISION.md` and `docs/V1_REVISED_MVP.md` before starting.

**Steps:**
1. Open Xcode and create a new SwiftUI project (iOS 17+).
2. Implement the **Calm UI** design language: Pure black background, white text, no tab bars.
3. Build the core SwiftData models for the AI Inbox (`InboxItem` with properties for raw text, domain, urgency, and action state).
4. Build the three primary input methods in the UI:
   - A simple text field.
   - A Voice Dictation button (using `SFSpeechRecognizer`).
   - *Note: The iOS Share Extension will be a separate phase.*
5. Build the basic list view to display captured items.

**Do NOT:**
- Do not integrate the LLM API yet. Just save the raw text locally.
- Do not build the Morning Brief yet.
- Do not attempt any notification interception.

**When complete:**
Update `STATUS.md` to `V1_PHASE_1_COMPLETE` and set the next action to LLM API Integration.

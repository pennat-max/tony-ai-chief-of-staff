# Next Action

**Exactly one action for the next AI agent or engineer.**

---

## LLM API Integration

**What:** Add the first LLM classification pass for the local Tony V1 AI Inbox.

**Context:** Phase 1 is complete. The app already captures manual text and voice dictation into SwiftData as `InboxItem` records. The next step is to classify each captured item without changing the product scope.

**Steps:**
1. Open `ios/TonyV1/TonyV1.xcodeproj`.
2. Add an LLM client layer for classifying `InboxItem.rawText`.
3. Send raw text to the chosen API with a strict JSON response contract.
4. Parse and persist:
   - `domain`
   - `urgency`
   - `actionState`
5. Keep all existing captures in SwiftData.
6. Surface classification values in the existing list view.

**Do NOT:**
- Do not build the Morning Brief yet.
- Do not build the Share Extension yet.
- Do not attempt LINE notification interception.
- Do not build the VIP Filter.
- Do not add push notifications or background automation.

**When complete:**
Update `docs/STATUS.md`, `docs/NEXT_ACTION.md`, and `docs/CHANGELOG.md`.

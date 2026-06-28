# Next Action

**Exactly one action for the next AI agent or engineer.**

---

## Activate the First Real AI Provider Transport

**What:** Replace the default mock classification path with one approved real provider behind the existing `AIProvider` protocol.

**Context:** The app already has provider architecture and uses `MockProvider` by default. It does not require API keys today. The next phase should choose exactly one real provider transport and keep the same strict JSON contract.

**Steps:**
1. Open `ios/TonyV1/TonyV1.xcodeproj`.
2. Choose the first real provider to activate: OpenAI, Claude, or Gemini.
3. Confirm the approved credential path before adding any real API key usage.
4. Implement the selected provider behind `AIProvider`.
5. Keep `MockProvider` available for local development and previews.
6. Preserve the strict JSON response contract:
   - `domain`
   - `urgency`
   - `actionState`
7. Persist parsed values to the existing `InboxItem` records.

**Do NOT:**
- Do not build the Morning Brief yet.
- Do not build the Share Extension yet.
- Do not attempt LINE notification interception.
- Do not build the VIP Filter.
- Do not add push notifications or background automation.

**When complete:**
Update `docs/STATUS.md`, `docs/NEXT_ACTION.md`, and `docs/CHANGELOG.md`.

# Next Action

**Exactly one action for the next AI agent or engineer.**

---

## Finish Tony V1 Mock MVP in One Pass

**What:** Complete the local-first Tony V1 mock product flow using the existing SwiftUI app and `MockProvider`.

**Context:** Phase 1 is complete and AI Provider abstraction is complete. The app can run without real provider credentials. Do not stop after one small function. Finish the usable mock MVP flow.

## Build Only These Items

1. Keep the existing `ios/TonyV1/` SwiftUI app.
2. Keep `MockProvider` as the default AI provider.
3. Ensure `InboxItem` supports:
   - `rawText`
   - `summary`
   - `domain`
   - `urgency`
   - `actionState`
   - `createdAt`
   - `isArchived`
   - `requiresDecision`
4. Build Decision Queue:
   - shows important items
   - supports Mark Done
   - supports Archive
   - supports Keep for Later
5. Build Morning Brief:
   - local deterministic summary from stored items
   - top 3 decisions
   - grouped summary by domain
   - one recommended first action
6. Add optional demo data helper for local testing.
7. Keep Calm UI:
   - black background
   - white text
   - large readable typography
   - simple iPhone-first layout

## Do NOT Build

- Real OpenAI provider
- Real Claude provider
- Real Gemini provider
- Backend
- Login
- Cloud sync
- LINE notification interception
- VIP Filter
- Push notifications
- Share Extension
- Image OCR
- Calendar integration

## Acceptance Criteria

The mission is complete when:

1. User can type or dictate an item.
2. Item saves to SwiftData.
3. Item is classified by `MockProvider`.
4. Inbox shows classification.
5. Decision Queue shows required decisions.
6. Morning Brief generates from local items.
7. User can mark done / archive / keep later.
8. Demo data can be generated.
9. App requires no real provider credential.

## When Complete

Update:

- `docs/STATUS.md` to `V1_MOCK_MVP_COMPLETE`
- `docs/NEXT_ACTION.md` to `Real AI Provider Decision`
- `docs/CHANGELOG.md`

Add:

- `docs/V1_MOCK_MVP_QA.md`

Do not hand back until the local mock MVP flow is complete.
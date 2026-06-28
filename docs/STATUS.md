# Tony Project Status

**Status: V1_MOCK_MVP_COMPLETE**

**Last Updated:** June 28, 2026
**Last Agent:** ChatGPT - iOS Engineer
**Current Phase:** Tony V1 local mock MVP complete

---

## Decision

Tony V1 now has a usable local-first mock MVP flow.

The app still uses `MockProvider` only. It does not require API keys and does not call OpenAI, Claude, Gemini, a backend, or any cloud service.

See:
- `docs/NEXT_ACTION.md`
- `docs/V1_MOCK_MVP_QA.md`
- `ios/TonyV1/`

---

## What is Done

- Kept the existing `ios/TonyV1/` SwiftUI app.
- Kept `MockProvider` as the default AI provider.
- Expanded `InboxItem` with:
  - `rawText`
  - `summary`
  - `domain`
  - `urgency`
  - `actionState`
  - `createdAt`
  - `isArchived`
  - `requiresDecision`
- Expanded strict mock JSON classification to include:
  - `summary`
  - `domain`
  - `urgency`
  - `actionState`
  - `requiresDecision`
- Built Decision Queue for important items.
- Added Mark Done, Archive, and Keep for Later actions.
- Built local deterministic Morning Brief with:
  - top 3 decisions
  - grouped domain summary
  - one recommended first action
- Added demo data generation for local testing.
- Preserved the black Calm UI direction with large iPhone-first typography.

---

## What is NOT Built

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

---

## Next Step

Real AI Provider Decision.

Read:
- `docs/NEXT_ACTION.md`
- `ios/TonyV1/TonyV1/Services/AIProvider.swift`
- `ios/TonyV1/TonyV1/Services/MockProvider.swift`

Then decide which real provider should be activated first. Do not add credentials or network calls until that provider decision is explicit.

---

## Confidence Level

High. The local mock MVP flow is complete and can be validated on macOS/Xcode without any real provider credentials.

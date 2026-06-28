# Tony Project Status

**Status: V1_PHASE_1_COMPLETE**

**Last Updated:** June 28, 2026
**Last Agent:** ChatGPT - iOS Engineer
**Current Phase:** Revised Tony V1 Phase 1 complete

---

## Decision

Phase 1 of the revised Tony V1 MVP is complete.

Tony now has a buildable iOS 17+ SwiftUI foundation for the Manual AI Inbox. This phase intentionally avoids LLM calls, Morning Brief logic, Share Extension ingestion, LINE notification interception, and VIP filtering.

See:
- `docs/V1_PIVOT_DECISION.md`
- `docs/V1_REVISED_MVP.md`
- `ios/TonyV1/`

---

## What is Done

- Created a new iOS 17+ SwiftUI project at `ios/TonyV1/`.
- Implemented a pure black Calm UI shell with white typography and no tab bar.
- Added SwiftData local persistence.
- Added `InboxItem` model with:
  - `rawText`
  - `domain`
  - `urgency`
  - `actionState`
  - `createdAt`
- Added one text input field for manual capture.
- Added one voice dictation button using `SFSpeechRecognizer`.
- Added a list view showing locally captured inbox items.
- Added speech and microphone permission strings in `Info.plist`.

---

## What is NOT Built Yet

Do not treat any of these as complete:

- LLM API integration
- Morning Brief
- Share Extension
- LINE notification interception
- VIP Filter

---

## Next Step

LLM API Integration.

Read:
- `docs/NEXT_ACTION.md`
- `docs/V1_REVISED_MVP.md`

Then connect captured `InboxItem.rawText` to the first classification pass and persist returned `domain`, `urgency`, and `actionState` locally.

---

## Confidence Level

High. The project has moved from pivot approval to a concrete local iOS app foundation that can support the next intelligence layer.

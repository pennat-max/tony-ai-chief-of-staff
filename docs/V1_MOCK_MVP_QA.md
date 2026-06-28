# Tony V1 Mock MVP QA

**Date:** June 28, 2026
**Status:** Ready for local Xcode validation

---

## Scope Verified

- SwiftUI app remains in `ios/TonyV1/`.
- `MockProvider` is the default provider.
- No API key is required.
- No real OpenAI, Claude, or Gemini network transport is active.
- SwiftData remains the local store.

---

## Acceptance Checklist

| Requirement | Status | Evidence |
| :--- | :--- | :--- |
| User can type an item | Complete | `ContentView.captureBar` text field saves input. |
| User can dictate an item | Complete | Existing `SpeechRecognizer` updates the same capture field. |
| Item saves to SwiftData | Complete | `captureText()` inserts `InboxItem` into `modelContext`. |
| Item is classified by `MockProvider` | Complete | `AIClassificationService` defaults to `MockProvider`. |
| Inbox shows classification | Complete | `InboxItemRow` shows `domain`, `urgency`, and `actionState`. |
| Decision Queue shows required decisions | Complete | `decisionItems` filters `requiresDecision` and high urgency active items. |
| Morning Brief generates locally | Complete | `MorningBriefService` derives top decisions, domain groups, and first action from stored items. |
| User can mark done | Complete | `markDone(_:)` sets `actionState = "done"`. |
| User can archive | Complete | `archive(_:)` sets `isArchived = true`. |
| User can keep later | Complete | `keepLater(_:)` sets `actionState = "later"`. |
| Demo data can be generated | Complete | Header demo button inserts `DemoDataFactory.makeInboxItems()`. |
| App requires no real provider credential | Complete | No API key, `URLSession`, or real provider transport is used. |

---

## Local Validation Notes

This Windows environment cannot run Xcode or `xcodebuild`. The implementation was static-checked for scope and repository hygiene. Final simulator/device validation should be done on macOS with Xcode by opening:

`ios/TonyV1/TonyV1.xcodeproj`

---

## Out of Scope Confirmed

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

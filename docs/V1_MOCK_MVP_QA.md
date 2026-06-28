# Tony V1 Mock MVP QA

**Date:** June 28, 2026
**Status:** Offline MVP hardened; ready for local Xcode validation

---

## Scope Verified

- SwiftUI app remains in `ios/TonyV1/`.
- `MockProvider` is the default provider.
- No real provider shell is included in the app target.
- No API key is required.
- No real OpenAI, Claude, or Gemini network transport is active.
- SwiftData remains the local store.
- Demo regeneration refreshes seeded demo items without duplicating user-created items.
- No more safe offline hardening remains in this Windows environment.

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
| Morning Brief generates locally | Complete | `MorningBriefService` derives top decisions, domain groups, active/later counts, and first action from stored items. |
| User can mark done | Complete | `markDone(_:)` calls `InboxItem.markDone()`. |
| User can archive | Complete | `archive(_:)` calls `InboxItem.archive()`. |
| User can keep later | Complete | `keepLater(_:)` calls `InboxItem.keepForLater()`. |
| Demo data can be generated | Complete | Header demo button inserts `DemoDataFactory.makeInboxItems()`. |
| Demo data can be regenerated safely | Complete | Existing seeded demo items are deleted before re-seeding; user-created items are preserved. |
| App requires no real provider credential | Complete | No API key, `URLSession`, or real provider transport is used. |
| AI transport remains replaceable | Complete | `AIProvider` protocol remains and `AIClassificationService` accepts any conforming provider. |

---

## Local Validation Notes

This Windows environment cannot run Xcode or `xcodebuild`. The implementation was static-checked for scope and repository hygiene. Final simulator/device validation should be done on macOS with Xcode by opening:

`ios/TonyV1/TonyV1.xcodeproj`

---

## Manual QA Steps

1. Build `TonyV1` in Xcode for an iOS 17+ simulator or device.
2. Launch the app and confirm the black Calm UI loads.
3. Type a new item and tap the send icon.
4. Confirm the item appears in Inbox with summary, domain, urgency, action state, and timestamp.
5. Tap the microphone button, grant speech/microphone permissions if prompted, dictate a short item, and save it.
6. Tap the demo data button once and confirm sample items appear.
7. Tap the demo data button again and confirm sample items are regenerated without duplicating the seeded samples.
8. Confirm Decision Queue shows high-urgency or decision-required items.
9. Tap Mark Done on a decision item and confirm it leaves Decision Queue.
10. Tap Keep for Later and confirm the item leaves Decision Queue but remains in Inbox.
11. Tap Archive and confirm the item is hidden from active Inbox.
12. Confirm Morning Brief updates active count, kept-for-later count, top decisions, domain summary, and recommended first action.
13. Confirm the app still works with no network connection and no API credentials.

---

## Out of Scope Confirmed

- Real OpenAI provider
- Real Claude provider
- Real Gemini provider
- Any network provider transport
- API key setup
- `.env.local`
- Backend
- Login
- Cloud sync
- LINE notification interception
- VIP Filter
- Push notifications
- Share Extension
- Image OCR
- Calendar integration

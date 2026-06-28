# Tony Project Status

**Status: V1_AI_PROVIDER_ABSTRACTION_COMPLETE**

**Last Updated:** June 28, 2026
**Last Agent:** ChatGPT - iOS Engineer
**Current Phase:** Revised Tony V1 mock LLM provider architecture complete

---

## Decision

Tony V1 now has an AI Provider abstraction for inbox classification without requiring API keys.

This phase intentionally does not integrate OpenAI, Claude, or Gemini network calls. `MockProvider` is the default provider and returns strict JSON that is decoded and persisted into each existing SwiftData `InboxItem`.

See:
- `docs/V1_REVISED_MVP.md`
- `ios/TonyV1/`

---

## What is Done

- Added `AIProvider` protocol.
- Added `AIClassificationService`.
- Added provider shells:
  - `OpenAIProvider`
  - `ClaudeProvider`
  - `GeminiProvider`
  - `MockProvider`
- Set `MockProvider` as the default provider.
- Added strict JSON classification contract for:
  - `domain`
  - `urgency`
  - `actionState`
- Connected the existing capture flow to classify `InboxItem.rawText` after local SwiftData insertion.
- Persisted classification results back to the same `InboxItem`.
- Kept all existing SwiftData captures intact.
- Surfaced classification values in the existing list view.

---

## What is NOT Built Yet

Do not treat any of these as complete:

- Real OpenAI API calls
- Real Claude API calls
- Real Gemini API calls
- Morning Brief
- Share Extension
- LINE notification interception
- VIP Filter
- Push notifications
- Background automation

---

## Next Step

Choose and activate the first real AI provider transport.

Read:
- `docs/NEXT_ACTION.md`
- `ios/TonyV1/TonyV1/Services/AIProvider.swift`
- `ios/TonyV1/TonyV1/Services/AIClassificationService.swift`

Then implement one real provider behind the existing `AIProvider` protocol only after the credential and provider decision is approved.

---

## Confidence Level

High. The app can classify new captures with mock JSON now, runs without API keys, and has a clean provider boundary for a future real LLM transport.

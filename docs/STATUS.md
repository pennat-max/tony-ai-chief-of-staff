# Tony Project Status

**Status: V1_OFFLINE_MVP_HARDENED**

**Last Updated:** June 28, 2026
**Last Agent:** ChatGPT - iOS Engineer
**Current Phase:** Tony V1 offline MVP hardened

---

## Decision

Tony V1 has completed the safe overnight offline hardening pass.

The app remains an offline, local-first iPhone product. It uses `MockProvider` only, requires no API keys, creates no `.env.local`, and has no network provider implementation. The AI transport remains replaceable through the existing `AIProvider` protocol.

See:
- `docs/OVERNIGHT_AGENT_MISSION.md`
- `docs/V1_MOCK_MVP_QA.md`
- `ios/TonyV1/`

---

## What Was Hardened

- Static-reviewed `ios/TonyV1/` for offline scope and obvious compile risks.
- Kept `MockProvider` as the only active AI provider.
- Kept `AIProvider` as the replaceable transport boundary.
- Added safer `InboxItem` helpers for active state, decision eligibility, display summary, and item actions.
- Improved mock classification consistency with centralized domain, urgency, and action-state constants.
- Improved deterministic Morning Brief logic with active/later counts and decision filtering.
- Improved Decision Queue filtering through shared model helpers.
- Added a developer-safe notice surface for local mock fallback/demo regeneration status.
- Hardened demo data regeneration so it refreshes seeded demo items without duplicating user-created items.
- Updated QA documentation with manual validation steps.

---

## Explicitly Not Built

- OpenAI integration
- Claude integration
- Gemini integration
- API key setup
- `.env.local`
- Network provider transport
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

Stop. No more safe offline hardening remains in this environment.

The remaining validation is local macOS/Xcode QA:
- Open `ios/TonyV1/TonyV1.xcodeproj`.
- Build on an iOS 17+ simulator or device.
- Run the manual QA checklist in `docs/V1_MOCK_MVP_QA.md`.

---

## Confidence Level

High for offline scope and repository hygiene. Xcode build/runtime validation still requires macOS/Xcode.

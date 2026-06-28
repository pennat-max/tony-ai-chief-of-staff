# Tony Project Status

**Status: TRACER_BULLET_CODE_READY**

**Last Updated:** June 28, 2026
**Last Agent:** Manus AI — Technical Architect
**Current Phase:** Code Written. Physical Device Test Requires a Human on a Mac.

---

## What is Done

- All Swift source files for the Tracer Bullet are written and committed (`ios/TonyTracerBullet/`).
- The iOS 27 Shortcuts Notification Automation pipeline is documented (`docs/V1_TECHNICAL_FEASIBILITY.md`).
- The `IngestMessageIntent` App Intent code is complete and uses the correct App Group container.
- Setup instructions for Shortcuts are written (`ios/TonyTracerBullet/SHORTCUTS_SETUP.md`).
- Reality Validation is complete (`docs/REALITY_VALIDATION.md`) — all 11 platforms researched and documented.

## What is NOT Done

- **The app has not been compiled in Xcode.**
- **The app has not been installed on a physical iPhone.**
- **The acceptance test (LINE → Tony without opening app) has not been run.**

## Why the Physical Test Cannot Be Run by an AI Agent

The AI agent sandbox runs on Linux (Ubuntu 24.04, x86_64). Xcode is a macOS-exclusive application. There is no path to compile, sign, or install a SwiftUI app from a Linux environment. A human engineer with a Mac, Xcode, and an iPhone running iOS 27 beta must perform this test.

## Integration Reality Summary (from REALITY_VALIDATION.md)

| Platform | Possible? | Method | Notes |
| :--- | :--- | :--- | :--- |
| LINE (read) | Yes | iOS 27 Shortcuts Notification Trigger | No personal API exists |
| WhatsApp (read) | Yes | iOS 27 Shortcuts Notification Trigger | Unofficial wrappers = account ban |
| Apple Calendar | Yes | EventKit (native) | Best integration on iOS |
| Google Calendar | Yes | EventKit (via iOS sync) | Skip Google API entirely |
| Gmail | Yes | Gmail REST API + OAuth 2.0 | Not for V1 |
| Google Drive | Yes | Drive REST API + OAuth 2.0 | Not for V1 |
| Apple Photos | Yes | PhotoKit + Vision OCR | Not for V1 |
| Apple Health | Yes | HealthKit (native, on-device only) | Not for V1 |
| Banking (SCB/KBank) | Partial | Notification Trigger only | No Open Banking API in Thailand |
| Voice / Siri | Partial | SFSpeechRecognizer (foreground only) | No custom wake word possible |
| iOS Shortcuts | Yes | App Intents + iOS 27 | Core V1 mechanism |

## The ONE Next Step

**A human engineer must run the Physical iPhone Test on a Mac.**

See `docs/NEXT_ACTION.md` for exact steps.

Do not build VIP Filter.
Do not add LLM.
Do not polish UI.
Do not proceed to Week 2.

## Known Risks

- SwiftData cross-process sharing requires App Group entitlement in Xcode (code fix is in place, must be validated).
- iOS 27 beta notification content extraction may return empty strings in early builds.

## Confidence Level

**Medium.** Architecture is sound, code is logically correct, but not validated on hardware.

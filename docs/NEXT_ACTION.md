# Next Action

**Exactly one action for the next AI agent or engineer.**

---

## Local Mac Xcode QA

**What:** Validate the hardened Tony V1 offline MVP in Xcode.

**Context:** Safe offline hardening is complete. The app still uses SwiftData and `MockProvider` only. It has no API keys, `.env.local`, network provider, backend, login, cloud sync, LINE interception, VIP filter, push notifications, Share Extension, Image OCR, or Calendar integration.

**Steps:**
1. Open `ios/TonyV1/TonyV1.xcodeproj` on macOS with Xcode.
2. Build the `TonyV1` target for an iOS 17+ simulator or device.
3. Run the manual QA checklist in `docs/V1_MOCK_MVP_QA.md`.
4. Record any Xcode-only compile/runtime issues in `docs/BLOCKERS.md`.

**Do NOT:**
- Do not request API keys.
- Do not create `.env.local`.
- Do not add OpenAI, Claude, Gemini, or any network provider.
- Do not add backend, login, cloud sync, LINE interception, VIP filter, push notifications, or background automation.
- Do not rewrite the app from scratch.

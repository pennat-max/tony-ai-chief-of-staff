# Next Action

**Exactly one action for the next AI agent or engineer.**

> **Reality Validation is complete.** See `docs/REALITY_VALIDATION.md` for the honest integration status of all 11 platforms (LINE, WhatsApp, Gmail, Calendar, Drive, Photos, Health, Banking, Notifications, Voice, Shortcuts). Read it before touching any code.

> **Do NOT start Week 2 (VIP Filter), add LLM, or build any new features until the Physical iPhone Test passes.**

---

## Run the Physical iPhone Test

**Prerequisites:**
- Mac with Xcode 16 or later
- Apple Developer account (free account works for device testing)
- Physical iPhone running iOS 27 beta

**Steps:**
1. Open Xcode. Create a new iOS App project named `TonyTracerBullet`. See `ios/TonyTracerBullet/README_XCODE.md` for exact settings.
2. Copy the 5 source files from `ios/TonyTracerBullet/TonyTracerBullet/` into the Xcode project.
3. **Add App Group entitlement:** In Xcode → Target → Signing & Capabilities → + Capability → App Groups. Create a group named `group.com.tony.tracerbullet`. Update `IngestMessageIntent.swift` to use this shared container URL for the `ModelContainer`.
4. Set Deployment Target to iOS 27.
5. Build and run on the physical iPhone (⌘R).
6. Open the app once to register the App Intent with iOS.
7. Follow `ios/TonyTracerBullet/SHORTCUTS_SETUP.md` to configure the Shortcuts automation.
8. Close the Tony app completely (swipe away in app switcher).
9. Send a LINE message to the iPhone from another device.
10. Open Tony. Check if the message appears in the list.

**If the test passes:**
- Document the device model, iOS version, and Xcode version in `docs/TRACER_BULLET_RESULT.md`.
- Update `docs/STATUS.md` to `TRACER_BULLET_PASSED_ON_DEVICE`.
- Add entry to `docs/CHANGELOG.md`.
- Set `docs/NEXT_ACTION.md` to "Build VIP Filter (Week 2)".

**If the test fails:**
- Document the exact failure (error message, console log, which step failed) in `docs/TRACER_BULLET_RESULT.md`.
- Update `docs/STATUS.md` to `TRACER_BULLET_FAILED`.
- Update `docs/BLOCKERS.md` with the specific technical issue.
- Stop. Do not proceed to Week 2. Wait for Product Owner decision.

# Tracer Bullet Result: NOT YET TESTED ON DEVICE

**Date:** June 28, 2026
**Author:** Manus AI — iOS Engineer
**Status:** TRACER_BULLET_CODE_READY

---

## What Was Done

All Swift source files for the Tracer Bullet were written and committed to the repository. The code has been reviewed for correctness but has **not been compiled in Xcode** and **has not been run on a physical iPhone**.

**Files written:**
- `TonyTracerBulletApp.swift` — App entry point
- `Model/IngestedMessage.swift` — SwiftData model
- `Intent/IngestMessageIntent.swift` — Headless App Intent
- `Intent/AppShortcuts.swift` — App Shortcuts provider
- `Views/MessageListView.swift` — Plain list UI
- `ios/TonyTracerBullet/SHORTCUTS_SETUP.md` — Setup guide

## What Has NOT Been Done

- The app has **not** been opened in Xcode.
- The app has **not** been compiled.
- The app has **not** been installed on any iPhone.
- The Shortcuts automation has **not** been configured.
- The acceptance test (LINE message → appears in Tony without opening app) has **not** been run.

## Known Risks Before Physical Test

The following issues may be discovered during device testing:

1. **SwiftData container sharing between App Intent and main app:** The `IngestMessageIntent` creates its own `ModelContainer` instance. On iOS, App Intents run in a separate process from the main app. Sharing a SwiftData store across processes requires an App Group entitlement and a shared container URL. This is not yet implemented in the code and is the most likely cause of failure.

2. **iOS 27 beta stability:** The Shortcuts Notification trigger was introduced in iOS 27 Developer Beta 1 (June 2026). Early beta reports indicate the notification content filtering is buggy. The trigger itself may fire but pass empty strings for Title and Body.

3. **App Intent registration timing:** The `IngestMessageIntent` will only appear in the Shortcuts app after the Tony app has been launched at least once on the device. If the user configures the Shortcut before first launch, the intent will not be visible.

## What Needs to Happen Next

A physical device test must be run. See `docs/NEXT_ACTION.md` for the exact steps.

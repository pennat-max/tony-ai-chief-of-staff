# Next Action

**Exactly one action for the next AI agent or engineer.**

---

## Compile and Run the Tracer Bullet on a Physical iPhone

**What to do:**
1. Open Xcode 16+.
2. Create a new SwiftUI project named `TonyTracerBullet` (see `ios/TonyTracerBullet/README_XCODE.md`).
3. Copy the 5 source files from `ios/TonyTracerBullet/TonyTracerBullet/` into the project.
4. Set Deployment Target to iOS 27.
5. Build and run on a physical iPhone running iOS 27 beta.
6. Follow `ios/TonyTracerBullet/SHORTCUTS_SETUP.md` to configure the Shortcuts automation.
7. Run the acceptance test.

**Acceptance Criteria:**
- App closed. LINE message received. Open Tony. Message is in the list.

**If it passes:** Update `docs/STATUS.md` to `TRACER_BULLET_PASSED_ON_DEVICE`, add to `CHANGELOG.md`, and set `NEXT_ACTION.md` to "Build VIP Filter (Week 2)".

**If it fails:** Document the exact failure in `docs/TRACER_BULLET_RESULT.md` and update `STATUS.md` to `TRACER_BULLET_FAILED`. Stop and wait for Product Owner decision.

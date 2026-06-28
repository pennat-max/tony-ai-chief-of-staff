# Blockers

**Last Updated:** June 28, 2026

## Active Blockers

### BLOCKER-1: Physical Device Test Not Yet Run (Medium)
The Swift source code is complete, but it has not been compiled and run on a physical iPhone. This requires:
- A Mac with Xcode 16+.
- An Apple Developer account (free or paid).
- A physical iPhone running iOS 27 beta.

**Impact:** We cannot confirm the Tracer Bullet passes until this is done.

## Resolved Blockers

- **LINE API Access:** Resolved. V1 uses iOS notification interception, not the LINE API.
- **iOS Notification Interception Constraints:** Resolved. iOS 27 Shortcuts Notification trigger is the solution.
- **No iOS Engineer:** Resolved for code writing. Still needed for physical device compilation and testing.

# Next Action

**Exactly one action for the next AI agent or engineer.**

---

## Build the "Tracer Bullet" Ingestion Pipeline (Week 1)

**What to build:** A bare-bones SwiftUI app targeting iOS 27 that exposes a custom App Intent (`IngestMessageIntent`). The intent must accept `sender` and `body` strings and save them to local storage. 

**Why this first:** We must prove that an iOS 27 Shortcuts Notification Automation can silently pass data from a third-party notification into our app's local storage without user intervention. If this fails, V1 fails.

**Where to read before starting:**
1. `docs/V1_TECHNICAL_FEASIBILITY.md` — Read the architectural decision and the Week 1 Acceptance Test.

**Acceptance Criteria:**
- The app exposes `IngestMessageIntent` to the iOS Shortcuts app.
- A user can map a notification's `Title` and `Body` to this intent in the Shortcuts app.
- The app successfully saves the data to local storage while running in the background.

**When done:** Update `docs/STATUS.md` to reflect completion, add to `docs/CHANGELOG.md`, and set the new `docs/NEXT_ACTION.md`.

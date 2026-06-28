# Next Action

**Exactly one action for the next AI agent or engineer.**

---

## Initialize the iOS Xcode Project (Week 1)

**What to build:** Create a new native iOS project (SwiftUI) and implement the `UNUserNotificationCenter` delegate to intercept incoming push notifications. 

**Why this first:** The entire 30-day MVP relies on the ability to read LINE messages via iOS push notifications. If we cannot intercept and read the text of incoming notifications, the product fails. This technical risk must be retired immediately.

**Where to read before starting:**
1. `docs/V1_PRODUCT_OWNER_DECISIONS.md` — Read the "One-Page MVP Definition" and the "3 Rules of V1". Do not read the older v2 documents; they contain out-of-scope features.

**Acceptance Criteria:**
- A blank SwiftUI app is running on a physical iPhone or simulator.
- The app requests and receives Notification permissions.
- When a test notification arrives (simulating a LINE message), the app prints the sender's name and message body to the console.

**When done:** Update `docs/STATUS.md` to reflect completion, add to `docs/CHANGELOG.md`, and set the new `docs/NEXT_ACTION.md`.

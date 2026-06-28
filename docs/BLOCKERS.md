# Blockers

**Last Updated:** June 28, 2026

## Active Blockers

### BLOCKER-1: iOS Notification Interception Constraints (High Risk)
iOS heavily restricts an app's ability to read notifications intended for other apps (like LINE). While an app can read its *own* notifications, reading *all* notifications system-wide is generally restricted to MDM (Mobile Device Management) profiles, Accessibility features, or specific entitlements not available to standard App Store apps.

**Impact:** The core premise of the 30-day MVP relies on this.

**Possible Paths Forward:**
1. **The Shortcuts / Automations Hack:** Use iOS Shortcuts. Create a personal automation triggered by "When I receive a message from [App: LINE]". The shortcut passes the message content to the Tony app via a URL scheme or App Intent. This is clunky to set up but bypasses Apple's security sandbox legitimately.
2. **The Notification Extension:** Investigate if a Notification Service Extension can be abused to read incoming payloads, though this is unlikely to work across apps.
3. **The Screen Recording Hack:** Require the user to leave the phone plugged in and screen-recording overnight, using OCR to read the banners. (Too much friction, reject).

**Recommended Path:** The next engineer MUST immediately investigate Path 1 (iOS Shortcuts Automation) as the primary ingestion method for V1.

### BLOCKER-2: No iOS Engineer Assigned (High)
The project requires an engineer proficient in Swift, SwiftUI, and iOS system-level constraints (Notifications, Shortcuts, App Intents).

**Impact:** Development cannot start.

## Resolved Blockers

- **LINE API Access:** Resolved by abandoning the API approach entirely. V1 will rely exclusively on on-device notification interception (or Shortcuts).

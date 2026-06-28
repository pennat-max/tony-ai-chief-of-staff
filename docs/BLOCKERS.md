# Blockers

**Last Updated:** June 28, 2026

## Active Blockers

### BLOCKER-1: LINE API Access (Critical)
LINE does not provide a public API for reading messages from a user's personal LINE account. The LINE Messaging API is for business accounts (LINE Official Accounts) only.

**Impact:** The entire MVP (V2.1) depends on reading LINE messages. Without this, the Morning Triage cannot be built as designed.

**Possible Paths Forward:**
1. **iOS Notification Access:** Use iOS notification access permissions to read LINE notification content as it arrives. This is the most feasible path and does not require LINE's cooperation. Limitation: only captures messages that generate a notification, not historical messages.
2. **LINE Business Connect:** Explore whether พี่คอม's key business contacts can be migrated to a LINE Official Account channel, which does have API access.
3. **Accessibility Service (Android):** If an Android device is acceptable, Android Accessibility Services can read on-screen content from any app. This is more powerful but raises privacy concerns.
4. **Manual Forward Workflow:** As a V2.1 fallback, users can forward important LINE messages to a dedicated Tony email address or LINE bot. This is low-tech but deployable immediately.

**Recommended Path:** Start with iOS Notification Access (Path 1) for V2.1. Design the product so it degrades gracefully when notification access is unavailable.

### BLOCKER-2: No Engineering Team Yet (High)
There is currently no engineer assigned to build Tony. The product definition is complete and ready for engineering, but no development has started.

**Impact:** All timelines are blocked until an engineer or development agent is assigned.

## Resolved Blockers

None yet — this is the first iteration.

# Blockers

**Last Updated:** June 28, 2026

## Active Blockers

### BLOCKER-1: No iOS Engineer Assigned (High)
The project requires an engineer proficient in Swift, SwiftUI, and iOS 27 App Intents.

**Impact:** Development cannot start.

## Resolved Blockers

- **LINE API Access:** Resolved by abandoning the API approach entirely. V1 will rely exclusively on on-device notification interception.
- **iOS Notification Interception Constraints:** Resolved. Research confirms that iOS 27 introduces a `Notification` trigger in the Shortcuts app that can extract the Title and Body of third-party notifications and pass them to our app via App Intents. (See `docs/V1_TECHNICAL_FEASIBILITY.md`).

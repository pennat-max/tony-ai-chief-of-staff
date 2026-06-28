# Blockers

**Last Updated:** June 28, 2026

## Active Blockers

### BLOCKER-1: Physical Device Test Not Run (High)
The Tracer Bullet code has been written but has not been compiled or tested on a physical iPhone. No success can be claimed until the acceptance test passes on a real device.

**Required to unblock:**
- Mac + Xcode 16+
- Apple Developer account
- iPhone running iOS 27 beta

### BLOCKER-2: App Group Entitlement Missing (High — Code Fix Required)
The current `IngestMessageIntent.swift` creates a `ModelContainer` using the default configuration. App Intents run in a separate OS process from the main app. Without a shared App Group container, the intent will write to a different SwiftData store than the one the UI reads from. The message will be saved but will never appear in the list.

**Fix required before testing:**
In Xcode, add the App Groups capability and create `group.com.tony.tracerbullet`. Update `IngestMessageIntent.swift`:

```swift
// Replace the ModelContainer init with:
let groupURL = FileManager.default
    .containerURL(forSecurityApplicationGroupIdentifier: "group.com.tony.tracerbullet")!
    .appendingPathComponent("tony.store")
let config = ModelConfiguration(url: groupURL)
let container = try ModelContainer(for: IngestedMessage.self, configurations: config)
```

Also update `TonyTracerBulletApp.swift` to use the same shared container URL.

### BLOCKER-3: iOS 27 Beta Notification Content Extraction (Medium)
Early iOS 27 Developer Beta reports indicate that notification content filtering in Shortcuts is buggy. The trigger fires correctly, but the `Title` and `Body` variables may return empty strings. This is expected to be fixed in future betas.

**Workaround if empty strings are returned:** Use a fixed test string in the Shortcut (hardcode "Test Sender" and "Test Body") to confirm the App Intent pipeline works independently of the notification extraction.

## Resolved Blockers

- **LINE API Access:** Resolved. V1 uses iOS notification interception, not the LINE API.
- **iOS Notification Interception Constraints:** Resolved. iOS 27 Shortcuts Notification trigger is the solution.

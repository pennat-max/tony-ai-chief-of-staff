# Technical Feasibility: Tony V1 (iOS Ingestion)

**Date:** June 28, 2026
**Author:** Manus AI — Technical Architect
**Status:** Feasibility Research Complete

This document investigates the safest and most reliable method to ingest LINE message notifications into the Tony V1 app on iOS, bypassing Apple's restrictive notification sandbox.

---

## 1. Can iOS Shortcuts actually trigger from incoming LINE notifications?
**Yes, but only starting in iOS 27.** 
Prior to iOS 27, the Shortcuts app could only trigger automations based on native Messages (iMessage/SMS) or Mail. However, in the iOS 27 Developer Beta (released June 2026), Apple introduced a new `Notification` automation trigger [1]. This allows an iOS Shortcut to run automatically whenever the device receives a push notification from *any* specified app, including third-party apps like LINE.

## 2. Can the shortcut access sender name and message body?
**Yes.**
The iOS 27 `Notification` trigger provides a `Shortcut Input` variable that contains the notification payload. By extracting the metadata, the shortcut can access the `Title` (which LINE uses for the sender's name or group name), the `Subtitle`, and the `Body` (the actual message content) [2]. *Note: Early betas of iOS 27 had bugs with notification filtering, but the raw extraction of Title and Body works [3].*

## 3. Can it pass that text into Tony via URL scheme, App Intent, clipboard, or file?
**Yes, via App Intents.**
The most robust way to pass this data into a native SwiftUI app (Tony) is by building a custom App Intent [4]. The iOS Shortcut triggered by the LINE notification can take the extracted `Title` and `Body` and pass them directly as parameters to the Tony App Intent. 
- *Alternative:* Custom URL Schemes (e.g., `tonyapp://ingest?sender=X&body=Y`) also work but are less elegant than App Intents.
- *Alternative:* Saving to a shared local file or the clipboard is possible but messy for background processing.

## 4. What requires manual setup by พี่คอม?
พี่คอม will need to manually configure the automation exactly once on his iPhone:
1. Open the Shortcuts app.
2. Go to Automations > New > Notification.
3. Select "LINE" as the App.
4. Add the Tony App Intent action (e.g., "Ingest Message to Tony").
5. Map the LINE Notification `Title` to the Tony `Sender` parameter.
6. Map the LINE Notification `Body` to the Tony `Message` parameter.
7. Ensure "Run Immediately" is checked and "Notify When Run" is turned off.

## 5. What works silently and what does not?
If configured correctly with "Run Immediately" and notifications disabled for the Shortcut execution itself, the interception runs **completely silently in the background**. พี่คอม will still receive the native LINE notification banner (unless he mutes LINE), but Tony will silently build its database in the background without launching the Tony app to the foreground.

## 6. What is the fallback if notification interception is impossible?
If the iOS 27 feature proves too buggy for production, the fallback is the **Share Sheet Extension**. 
- *How it works:* พี่คอม reads a message in LINE, highlights it, taps "Share", and selects the Tony icon.
- *Drawback:* This violates the core product requirement of "zero manual organization." It requires active user intervention and fails the "Morning Triage" use case. Therefore, the iOS 27 Notification trigger is a hard dependency for V1.

## 7. What is the recommended V1 ingestion method?
**Native iOS App (SwiftUI) + Custom App Intent + iOS 27 Shortcuts Notification Automation.**
This is the only path that achieves background, zero-touch ingestion of third-party messaging data on an unjailbroken iPhone.

## 8. What should Claude/Codex build first?
The engineering team must build a "Tracer Bullet" prototype:
1. A basic SwiftUI app targeting iOS 27.
2. A custom App Intent (`IngestMessageIntent`) that accepts two strings: `sender` and `body`.
3. The intent should simply append these strings to a local SwiftData or CoreData store.
4. A single UI view that lists the ingested messages.
*Do not build the LLM integration or VIP logic until this pipeline is proven.*

## 9. What is the acceptance test for Week 1?
1. Install the Tracer Bullet app on an iOS 27 device.
2. Set up the Shortcuts Notification Automation for a test app (e.g., WhatsApp or LINE).
3. Send a message to the device.
4. Open the Tracer Bullet app. If the message appears in the list without the user ever manually opening the app, Week 1 is a success.

## 10. Should we continue with native iOS, PWA, or Shortcut-first prototype?
**Native iOS (SwiftUI) is mandatory.**
A Progressive Web App (PWA) on iOS cannot expose App Intents to the Shortcuts app, nor can it reliably execute background code when a notification arrives [5]. A "Shortcut-only" prototype (building the whole UI inside Shortcuts) is too limiting for the custom "Typographic Calm" UI required for Tony. A native SwiftUI app that exposes a headless App Intent is the correct architecture.

---

### References
[1] Reddit: You can now create shortcuts and automations based on notifications (iOS 27) https://www.reddit.com/r/shortcuts/comments/1u3bnhz/you_can_now_create_shortcuts_and_automations/
[2] WalletPal: How to trigger shortcuts when i get a notification https://walletpalapp.github.io/apple-shortcuts-notification-trigger
[3] Derek Seaman: Home Assistant Notifications That Run Apple Shortcuts https://www.derekseaman.com/2026/06/home-assistant-notifications-that-run-apple-shortcuts-yes-really.html
[4] Apple Developer: Get to know App Intents https://developer.apple.com/videos/play/wwdc2025/244/
[5] MagicBell: PWA iOS Limitations and Safari Support https://www.magicbell.com/blog/pwa-ios-limitations-safari-support-complete-guide

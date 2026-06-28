# TonyTracerBullet — Xcode Project Setup

This directory contains all Swift source files for the Tony Tracer Bullet iOS app.
Because Xcode `.xcodeproj` files are binary/complex XML, this README documents
how to create the project manually in Xcode and then add these source files.

## Create the Xcode Project

1. Open Xcode 16+ (required for iOS 27 / App Intents)
2. File → New → Project
3. Choose: **iOS → App**
4. Settings:
   - Product Name: `TonyTracerBullet`
   - Team: Your Apple Developer Team
   - Organization Identifier: `com.tony`
   - Bundle Identifier: `com.tony.tracerbullet`
   - Interface: **SwiftUI**
   - Language: **Swift**
   - Storage: **SwiftData** ← IMPORTANT
5. Click Next, save to this directory.

## Add Source Files

Replace the auto-generated files with the files in this directory:

| File | Location in Xcode |
| :--- | :--- |
| `TonyTracerBulletApp.swift` | Root group |
| `Model/IngestedMessage.swift` | Model group |
| `Intent/IngestMessageIntent.swift` | Intent group |
| `Views/MessageListView.swift` | Views group |

## Required Capabilities

In Xcode → Target → Signing & Capabilities:
- Add **App Intents** (automatic with the framework import)
- Minimum Deployment Target: **iOS 27.0**

## Build & Run

1. Connect a physical iPhone running iOS 27 beta.
2. Build and run (⌘R).
3. Follow `SHORTCUTS_SETUP.md` to configure the automation.

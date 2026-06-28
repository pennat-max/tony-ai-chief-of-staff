// TonyTracerBulletApp.swift
// TonyTracerBullet
//
// App entry point. Sets up SwiftData container and shows the list view.
// Nothing else. No onboarding. No settings. No LLM.

import SwiftUI
import SwiftData

@main
struct TonyTracerBulletApp: App {

    var body: some Scene {
        WindowGroup {
            MessageListView()
        }
        // SwiftData container shared across the app and the App Intent
        .modelContainer(for: IngestedMessage.self)
    }
}

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
        // IMPORTANT: Must use the same App Group container URL as IngestMessageIntent.
        // Both the main app and the App Intent process must read/write the same store.
        //
        // Prerequisite: Add App Groups capability in Xcode with group "group.com.tony.tracerbullet".
        .modelContainer(sharedModelContainer)
    }

    /// Returns a SwiftData ModelContainer backed by the shared App Group directory.
    /// Falls back to an in-memory store if the App Group is not configured (e.g., Simulator without entitlements).
    var sharedModelContainer: ModelContainer {
        if let groupURL = FileManager.default
            .containerURL(forSecurityApplicationGroupIdentifier: "group.com.tony.tracerbullet") {
            let storeURL = groupURL.appendingPathComponent("tony.store")
            let config = ModelConfiguration(url: storeURL)
            return (try? ModelContainer(for: IngestedMessage.self, configurations: config))
                ?? (try! ModelContainer(for: IngestedMessage.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true)))
        } else {
            // App Group not configured — use in-memory store so the app still launches.
            return try! ModelContainer(for: IngestedMessage.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        }
    }
}

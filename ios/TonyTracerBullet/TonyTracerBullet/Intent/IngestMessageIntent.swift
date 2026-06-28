// IngestMessageIntent.swift
// TonyTracerBullet
//
// Custom App Intent that receives a LINE message from an iOS Shortcut
// and saves it to local SwiftData storage.
//
// This is the core of the Tracer Bullet proof-of-concept.
// The Shortcuts automation calls this intent with the notification
// title (sender) and body (message) extracted from the LINE push.

import AppIntents
import SwiftData
import Foundation

struct IngestMessageIntent: AppIntent {

    // MARK: - Metadata

    static var title: LocalizedStringResource = "Ingest Message to Tony"
    static var description = IntentDescription(
        "Saves an incoming message (sender and body) into Tony's local store. " +
        "Called automatically by the iOS Shortcuts Notification Automation."
    )

    // Run in the background without launching the app UI
    static var openAppWhenRun: Bool = false

    // MARK: - Parameters

    @Parameter(title: "Sender", description: "The sender's name (from notification title)")
    var sender: String

    @Parameter(title: "Message Body", description: "The message content (from notification body)")
    var body: String

    @Parameter(title: "Received At", description: "When the notification arrived")
    var receivedAt: Date

    // MARK: - Perform

    @MainActor
    func perform() async throws -> some IntentResult {
        // IMPORTANT: App Intents run in a separate OS process from the main app.
        // A shared App Group container is required so both processes read/write
        // the same SwiftData store. Without this, messages are saved but never
        // visible in the UI.
        //
        // Prerequisite: Add the App Groups capability in Xcode and create the
        // group identifier "group.com.tony.tracerbullet".
        guard let groupURL = FileManager.default
            .containerURL(forSecurityApplicationGroupIdentifier: "group.com.tony.tracerbullet")
        else {
            // App Group not configured — this is a setup error, not a runtime error.
            // The app will build but messages will not appear in the UI.
            throw NSError(
                domain: "TonyTracerBullet",
                code: 1,
                userInfo: [NSLocalizedDescriptionKey:
                    "App Group 'group.com.tony.tracerbullet' not found. " +
                    "Add the App Groups capability in Xcode before testing."]
            )
        }

        let storeURL = groupURL.appendingPathComponent("tony.store")
        let config = ModelConfiguration(url: storeURL)
        let container = try ModelContainer(for: IngestedMessage.self, configurations: config)
        let context = container.mainContext

        // Create and save the new message
        let message = IngestedMessage(
            sender: sender,
            body: body,
            receivedAt: receivedAt
        )
        context.insert(message)
        try context.save()

        return .result()
    }
}

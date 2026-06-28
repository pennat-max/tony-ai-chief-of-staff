// AppShortcuts.swift
// TonyTracerBullet
//
// Registers the IngestMessageIntent as an App Shortcut so it appears
// in the iOS Shortcuts app and can be called from automations.

import AppIntents

struct TonyAppShortcuts: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: IngestMessageIntent(),
            phrases: [
                "Ingest message to Tony",
                "Send message to Tony"
            ],
            shortTitle: "Ingest Message",
            systemImageName: "tray.and.arrow.down"
        )
    }
}

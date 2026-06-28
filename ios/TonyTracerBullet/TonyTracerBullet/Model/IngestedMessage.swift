// IngestedMessage.swift
// TonyTracerBullet
//
// SwiftData model for messages ingested via the App Intent.
// No network calls. No encryption. Pure local storage only.

import Foundation
import SwiftData

@Model
final class IngestedMessage {
    // Unique identifier for deduplication
    var id: UUID

    // Sender name extracted from LINE notification Title
    var sender: String

    // Message body extracted from LINE notification Body
    var body: String

    // Timestamp when the notification was received (from Shortcut)
    var receivedAt: Date

    // Timestamp when Tony ingested the message (for debugging)
    var ingestedAt: Date

    init(
        id: UUID = UUID(),
        sender: String,
        body: String,
        receivedAt: Date,
        ingestedAt: Date = .now
    ) {
        self.id = id
        self.sender = sender
        self.body = body
        self.receivedAt = receivedAt
        self.ingestedAt = ingestedAt
    }
}

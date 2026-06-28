import Foundation
import SwiftData

@Model
final class InboxItem {
    var rawText: String
    var domain: String
    var urgency: String
    var actionState: String
    var createdAt: Date

    init(
        rawText: String,
        domain: String = "unclassified",
        urgency: String = "normal",
        actionState: String = "captured",
        createdAt: Date = .now
    ) {
        self.rawText = rawText
        self.domain = domain
        self.urgency = urgency
        self.actionState = actionState
        self.createdAt = createdAt
    }
}

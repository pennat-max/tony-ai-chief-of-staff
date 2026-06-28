import Foundation
import SwiftData

@Model
final class InboxItem {
    var rawText: String
    var summary: String = ""
    var domain: String
    var urgency: String
    var actionState: String
    var createdAt: Date
    var isArchived: Bool = false
    var requiresDecision: Bool = false

    init(
        rawText: String,
        summary: String = "",
        domain: String = "unclassified",
        urgency: String = "normal",
        actionState: String = "captured",
        createdAt: Date = .now,
        isArchived: Bool = false,
        requiresDecision: Bool = false
    ) {
        self.rawText = rawText
        self.summary = summary
        self.domain = domain
        self.urgency = urgency
        self.actionState = actionState
        self.createdAt = createdAt
        self.isArchived = isArchived
        self.requiresDecision = requiresDecision
    }
}

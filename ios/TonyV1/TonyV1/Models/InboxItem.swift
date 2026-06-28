import Foundation
import SwiftData

@Model
final class InboxItem {
    static let actionCaptured = "captured"
    static let actionNeedsAction = "needsAction"
    static let actionNeedsDecision = "needsDecision"
    static let actionDone = "done"
    static let actionArchived = "archived"
    static let actionLater = "later"

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

    var displaySummary: String {
        summary.isEmpty ? rawText : summary
    }

    var isActive: Bool {
        !isArchived && actionState != Self.actionDone
    }

    var isDecisionCandidate: Bool {
        isActive
            && actionState != Self.actionLater
            && (requiresDecision || urgency == "high")
    }

    func markDone() {
        actionState = Self.actionDone
        requiresDecision = false
    }

    func archive() {
        isArchived = true
        actionState = Self.actionArchived
        requiresDecision = false
    }

    func keepForLater() {
        actionState = Self.actionLater
        requiresDecision = false
    }
}

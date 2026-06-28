import Foundation

struct MockProvider: AIProvider {
    let name = "Mock"

    private enum Domain {
        static let money = "money"
        static let farm = "farm"
        static let export = "export"
        static let health = "health"
        static let ai = "ai"
        static let vigo4u = "vigo4u"
        static let personal = "personal"
    }

    private enum Urgency {
        static let high = "high"
        static let medium = "medium"
        static let low = "low"
    }

    private enum ActionState {
        static let needsDecision = "needsDecision"
        static let needsAction = "needsAction"
        static let captured = "captured"
    }

    func classify(rawText: String) async throws -> String {
        let normalized = rawText.lowercased()
        let domain = inferDomain(from: normalized)
        let urgency = inferUrgency(from: normalized)
        let actionState = inferActionState(from: normalized, urgency: urgency)
        let requiresDecision = actionState == ActionState.needsDecision || urgency == Urgency.high

        let response = AIClassification(
            summary: summarize(rawText),
            domain: domain,
            urgency: urgency,
            actionState: actionState,
            requiresDecision: requiresDecision
        )

        let data = try JSONEncoder().encode(response)
        guard let json = String(data: data, encoding: .utf8) else {
            throw AIProviderError.invalidResponse
        }

        return json
    }

    private func inferDomain(from text: String) -> String {
        if containsAny(["farm", "fertilizer", "crop", "homestay"], in: text) {
            return Domain.farm
        }

        if containsAny(["vigo", "vehicle", "car", "dealer"], in: text) {
            return Domain.vigo4u
        }

        if containsAny(["export", "shipment", "quote", "customs", "buyer", "chen"], in: text) {
            return Domain.export
        }

        if containsAny(["health", "doctor", "run", "fasting", "sleep", "exercise"], in: text) {
            return Domain.health
        }

        if containsAny(["project", "build", "ship", "release", "app", "ai"], in: text) {
            return Domain.ai
        }

        if containsAny(["invoice", "payment", "money", "cash", "budget", "thb", "baht", "transfer"], in: text) {
            return Domain.money
        }

        return Domain.personal
    }

    private func inferUrgency(from text: String) -> String {
        if containsAny(["urgent", "asap", "today", "now", "deadline"], in: text) {
            return Urgency.high
        }

        if containsAny(["tomorrow", "this week"], in: text) {
            return Urgency.medium
        }

        return Urgency.low
    }

    private func inferActionState(from text: String, urgency: String) -> String {
        if urgency == Urgency.high || containsAny(["approve", "decide", "accept", "decline"], in: text) {
            return ActionState.needsDecision
        }

        if containsAny(["reply", "call", "send", "transfer", "review", "schedule"], in: text) {
            return ActionState.needsAction
        }

        return ActionState.captured
    }

    private func summarize(_ rawText: String) -> String {
        let trimmed = rawText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard trimmed.count > 92 else { return trimmed }

        let endIndex = trimmed.index(trimmed.startIndex, offsetBy: 92)
        return String(trimmed[..<endIndex]) + "..."
    }

    private func containsAny(_ needles: [String], in text: String) -> Bool {
        needles.contains { text.contains($0) }
    }
}

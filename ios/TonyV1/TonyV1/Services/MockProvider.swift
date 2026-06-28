import Foundation

struct MockProvider: AIProvider {
    let name = "Mock"

    func classify(rawText: String) async throws -> String {
        let normalized = rawText.lowercased()
        let domain = inferDomain(from: normalized)
        let urgency = inferUrgency(from: normalized)
        let actionState = inferActionState(from: normalized, urgency: urgency)

        let response = AIClassification(
            domain: domain,
            urgency: urgency,
            actionState: actionState
        )

        let data = try JSONEncoder().encode(response)
        guard let json = String(data: data, encoding: .utf8) else {
            throw AIProviderError.invalidResponse
        }

        return json
    }

    private func inferDomain(from text: String) -> String {
        if containsAny(["invoice", "payment", "money", "cash", "budget", "thb", "baht", "transfer"], in: text) {
            return "money"
        }

        if containsAny(["farm", "fertilizer", "crop", "homestay"], in: text) {
            return "farm"
        }

        if containsAny(["export", "shipment", "quote", "customs", "buyer", "chen"], in: text) {
            return "export"
        }

        if containsAny(["health", "doctor", "run", "fasting", "sleep", "exercise"], in: text) {
            return "health"
        }

        if containsAny(["project", "build", "ship", "release", "app", "ai"], in: text) {
            return "ai"
        }

        if containsAny(["vigo", "vehicle", "car", "dealer"], in: text) {
            return "vigo4u"
        }

        return "personal"
    }

    private func inferUrgency(from text: String) -> String {
        if containsAny(["urgent", "asap", "today", "now", "deadline"], in: text) {
            return "high"
        }

        if containsAny(["tomorrow", "this week"], in: text) {
            return "medium"
        }

        return "low"
    }

    private func inferActionState(from text: String, urgency: String) -> String {
        if urgency == "high" {
            return "needsDecision"
        }

        if containsAny(["approve", "decide", "reply", "call", "send", "transfer"], in: text) {
            return "needsAction"
        }

        return "captured"
    }

    private func containsAny(_ needles: [String], in text: String) -> Bool {
        needles.contains { text.contains($0) }
    }
}

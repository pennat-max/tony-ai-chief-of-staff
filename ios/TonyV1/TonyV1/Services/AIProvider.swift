import Foundation

struct AIClassification: Codable {
    let summary: String
    let domain: String
    let urgency: String
    let actionState: String
    let requiresDecision: Bool
}

enum AIProviderError: Error {
    case providerNotConfigured(String)
    case invalidResponse
}

protocol AIProvider {
    var name: String { get }

    func classify(rawText: String) async throws -> String
}

extension AIProvider {
    func decodeClassificationJSON(_ json: String) throws -> AIClassification {
        guard let data = json.data(using: .utf8) else {
            throw AIProviderError.invalidResponse
        }

        let decoder = JSONDecoder()
        return try decoder.decode(AIClassification.self, from: data)
    }
}

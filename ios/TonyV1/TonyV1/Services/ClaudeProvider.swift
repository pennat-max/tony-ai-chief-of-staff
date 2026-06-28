import Foundation

struct ClaudeProvider: AIProvider {
    let name = "Claude"

    func classify(rawText: String) async throws -> String {
        throw AIProviderError.providerNotConfigured("ClaudeProvider is intentionally disabled until real API integration is approved.")
    }
}

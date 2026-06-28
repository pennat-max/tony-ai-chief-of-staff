import Foundation

struct OpenAIProvider: AIProvider {
    let name = "OpenAI"

    func classify(rawText: String) async throws -> String {
        throw AIProviderError.providerNotConfigured("OpenAIProvider is intentionally disabled until real API integration is approved.")
    }
}

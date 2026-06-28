import Foundation

struct GeminiProvider: AIProvider {
    let name = "Gemini"

    func classify(rawText: String) async throws -> String {
        throw AIProviderError.providerNotConfigured("GeminiProvider is intentionally disabled until real API integration is approved.")
    }
}

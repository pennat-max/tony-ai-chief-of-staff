import Foundation

struct AIClassificationService {
    private let provider: AIProvider

    init(provider: AIProvider = MockProvider()) {
        self.provider = provider
    }

    func classify(rawText: String) async throws -> AIClassification {
        let json = try await provider.classify(rawText: rawText)
        return try provider.decodeClassificationJSON(json)
    }
}

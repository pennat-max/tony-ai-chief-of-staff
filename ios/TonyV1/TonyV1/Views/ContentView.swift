import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \InboxItem.createdAt, order: .reverse) private var items: [InboxItem]

    @StateObject private var speechRecognizer = SpeechRecognizer()
    @State private var rawText = ""
    @State private var developerNotice: String?

    private let classificationService = AIClassificationService()
    private let morningBriefService = MorningBriefService()

    private var canCapture: Bool {
        !rawText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    private var activeItems: [InboxItem] {
        items.filter { $0.isActive }
    }

    private var decisionItems: [InboxItem] {
        activeItems.filter { $0.isDecisionCandidate }
    }

    private var morningBrief: MorningBrief {
        morningBriefService.generate(from: items)
    }

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 28) {
                    header
                    captureBar
                    MorningBriefView(brief: morningBrief)
                    DecisionQueueView(
                        items: decisionItems,
                        markDone: markDone,
                        archive: archive,
                        keepLater: keepLater
                    )
                    InboxListView(
                        items: activeItems,
                        markDone: markDone,
                        archive: archive,
                        keepLater: keepLater
                    )
                }
                .padding(.horizontal, 20)
                .padding(.top, 28)
                .padding(.bottom, 40)
            }
        }
        .foregroundStyle(.white)
        .onChange(of: speechRecognizer.transcript) { _, newTranscript in
            rawText = newTranscript
        }
    }

    private var header: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Tony")
                    .font(.system(size: 40, weight: .regular, design: .serif))

                Text("AI Inbox")
                    .font(.system(size: 15, weight: .medium, design: .default))
                    .foregroundStyle(.white.opacity(0.62))
            }

            Spacer()

            Button(action: seedDemoData) {
                Image(systemName: "wand.and.stars")
                    .font(.system(size: 20, weight: .semibold))
                    .frame(width: 44, height: 44)
                    .background(Color.white.opacity(0.12), in: Circle())
            }
            .buttonStyle(.plain)
            .accessibilityLabel("Generate demo data")
        }
    }

    private var captureBar: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 12) {
                TextField("Capture anything", text: $rawText, axis: .vertical)
                    .textFieldStyle(.plain)
                    .lineLimit(1...4)
                    .font(.system(size: 18, weight: .regular, design: .default))
                    .padding(.vertical, 12)
                    .padding(.horizontal, 14)
                    .background(.white.opacity(0.08), in: Capsule())
                    .submitLabel(.done)
                    .onSubmit(captureText)

                Button(action: speechRecognizer.toggleRecording) {
                    Image(systemName: speechRecognizer.isRecording ? "stop.circle.fill" : "mic.fill")
                        .font(.system(size: 22, weight: .semibold))
                        .frame(width: 48, height: 48)
                        .background(speechRecognizer.isRecording ? Color.red : Color.white.opacity(0.14), in: Circle())
                }
                .buttonStyle(.plain)
                .accessibilityLabel(speechRecognizer.isRecording ? "Stop dictation" : "Start dictation")

                Button(action: captureText) {
                    Image(systemName: "arrow.up.circle.fill")
                        .font(.system(size: 24, weight: .semibold))
                        .frame(width: 48, height: 48)
                        .foregroundStyle(canCapture ? Color.black : Color.white.opacity(0.35))
                        .background(canCapture ? Color.white : Color.white.opacity(0.08), in: Circle())
                }
                .buttonStyle(.plain)
                .disabled(!canCapture)
                .accessibilityLabel("Save inbox item")
            }

            if let permissionError = speechRecognizer.permissionError {
                Text(permissionError)
                    .font(.footnote)
                    .foregroundStyle(.red.opacity(0.9))
            }

            if let developerNotice = developerNotice {
                Text(developerNotice)
                    .font(.footnote)
                    .foregroundStyle(.white.opacity(0.56))
            }
        }
    }

    private func captureText() {
        let trimmedText = rawText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedText.isEmpty else { return }

        let item = InboxItem(rawText: trimmedText)
        modelContext.insert(item)
        rawText = ""
        speechRecognizer.transcript = ""

        Task { @MainActor in
            await classify(item)
        }
    }

    private func seedDemoData() {
        Task { @MainActor in
            let existingDemoItems = items.filter { DemoDataFactory.isDemoItem($0) }
            for item in existingDemoItems {
                modelContext.delete(item)
            }

            for item in DemoDataFactory.makeInboxItems() {
                modelContext.insert(item)
                await classify(item)
            }

            developerNotice = "Demo data regenerated locally."
            try? modelContext.save()
        }
    }

    @MainActor
    private func classify(_ item: InboxItem) async {
        do {
            let classification = try await classificationService.classify(rawText: item.rawText)
            item.summary = classification.summary
            item.domain = classification.domain
            item.urgency = classification.urgency
            item.actionState = classification.actionState
            item.requiresDecision = classification.requiresDecision
        } catch {
            item.summary = item.rawText
            item.domain = "unclassified"
            item.urgency = "low"
            item.actionState = InboxItem.actionCaptured
            item.requiresDecision = false
            developerNotice = "Mock classification fallback used."
        }

        try? modelContext.save()
    }

    private func markDone(_ item: InboxItem) {
        item.markDone()
        try? modelContext.save()
    }

    private func archive(_ item: InboxItem) {
        item.archive()
        try? modelContext.save()
    }

    private func keepLater(_ item: InboxItem) {
        item.keepForLater()
        try? modelContext.save()
    }
}

private struct MorningBriefView: View {
    let brief: MorningBrief

    var body: some View {
        SectionBlock(title: "Morning Brief") {
            VStack(alignment: .leading, spacing: 14) {
                Text("\(brief.activeCount) active items / \(brief.laterCount) kept for later")
                    .font(.caption)
                    .textCase(.uppercase)
                    .foregroundStyle(.white.opacity(0.48))

                Text(brief.recommendedFirstAction)
                    .font(.system(size: 22, weight: .regular, design: .serif))
                    .lineLimit(4)

                if !brief.topDecisions.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Top Decisions")
                            .font(.caption)
                            .textCase(.uppercase)
                            .foregroundStyle(.white.opacity(0.48))

                        ForEach(brief.topDecisions) { item in
                            Text(item.displaySummary)
                                .font(.system(size: 16, weight: .regular, design: .default))
                                .foregroundStyle(.white.opacity(0.78))
                                .lineLimit(2)
                        }
                    }
                }

                if !brief.domainSummaries.isEmpty {
                    FlowLine(items: brief.domainSummaries.map { "\($0.domain) \($0.count)" })
                }
            }
        }
    }
}

private struct DecisionQueueView: View {
    let items: [InboxItem]
    let markDone: (InboxItem) -> Void
    let archive: (InboxItem) -> Void
    let keepLater: (InboxItem) -> Void

    var body: some View {
        SectionBlock(title: "Decision Queue") {
            if items.isEmpty {
                Text("Clear")
                    .font(.system(size: 18, weight: .regular, design: .serif))
                    .foregroundStyle(.white.opacity(0.62))
            } else {
                VStack(spacing: 16) {
                    ForEach(items) { item in
                        InboxItemRow(
                            item: item,
                            markDone: markDone,
                            archive: archive,
                            keepLater: keepLater
                        )
                    }
                }
            }
        }
    }
}

private struct InboxListView: View {
    let items: [InboxItem]
    let markDone: (InboxItem) -> Void
    let archive: (InboxItem) -> Void
    let keepLater: (InboxItem) -> Void

    var body: some View {
        SectionBlock(title: "Inbox") {
            if items.isEmpty {
                Text("Empty")
                    .font(.system(size: 18, weight: .regular, design: .serif))
                    .foregroundStyle(.white.opacity(0.62))
            } else {
                VStack(spacing: 16) {
                    ForEach(items) { item in
                        InboxItemRow(
                            item: item,
                            markDone: markDone,
                            archive: archive,
                            keepLater: keepLater
                        )
                    }
                }
            }
        }
    }
}

private struct InboxItemRow: View {
    let item: InboxItem
    let markDone: (InboxItem) -> Void
    let archive: (InboxItem) -> Void
    let keepLater: (InboxItem) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(item.displaySummary)
                .font(.system(size: 19, weight: .regular, design: .serif))
                .foregroundStyle(.white)
                .lineLimit(4)

            HStack(spacing: 10) {
                Text(item.domain)
                Text(item.urgency)
                Text(item.actionState)
                Spacer()
                Text(item.createdAt, style: .time)
            }
            .font(.caption)
            .textCase(.uppercase)
            .foregroundStyle(.white.opacity(0.48))

            HStack(spacing: 14) {
                IconAction(systemName: "checkmark.circle", label: "Mark done") {
                    markDone(item)
                }
                IconAction(systemName: "archivebox", label: "Archive") {
                    archive(item)
                }
                IconAction(systemName: "clock", label: "Keep for later") {
                    keepLater(item)
                }
            }
        }
        .padding(.vertical, 4)
    }
}

private struct IconAction: View {
    let systemName: String
    let label: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: systemName)
                .font(.system(size: 19, weight: .medium))
                .frame(width: 38, height: 38)
                .background(Color.white.opacity(0.08), in: Circle())
        }
        .buttonStyle(.plain)
        .accessibilityLabel(label)
    }
}

private struct SectionBlock<Content: View>: View {
    let title: String
    let content: Content

    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text(title)
                .font(.system(size: 14, weight: .semibold, design: .default))
                .textCase(.uppercase)
                .foregroundStyle(.white.opacity(0.52))

            content

            Divider()
                .overlay(.white.opacity(0.16))
        }
    }
}

private struct FlowLine: View {
    let items: [String]

    var body: some View {
        Text(items.joined(separator: "   "))
            .font(.caption)
            .textCase(.uppercase)
            .foregroundStyle(.white.opacity(0.58))
            .lineLimit(3)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: InboxItem.self, inMemory: true)
}

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \InboxItem.createdAt, order: .reverse) private var items: [InboxItem]

    @StateObject private var speechRecognizer = SpeechRecognizer()
    @State private var rawText = ""

    private var canCapture: Bool {
        !rawText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(alignment: .leading, spacing: 22) {
                header
                captureBar
                inboxList
            }
            .padding(.horizontal, 20)
            .padding(.top, 28)
        }
        .foregroundStyle(.white)
        .onChange(of: speechRecognizer.transcript) { _, newTranscript in
            rawText = newTranscript
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Tony")
                .font(.system(size: 40, weight: .regular, design: .serif))

            Text("AI Inbox")
                .font(.system(size: 15, weight: .medium, design: .default))
                .foregroundStyle(.white.opacity(0.62))
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
        }
    }

    private var inboxList: some View {
        List {
            ForEach(items) { item in
                InboxItemRow(item: item)
                    .listRowInsets(EdgeInsets(top: 14, leading: 0, bottom: 14, trailing: 0))
                    .listRowSeparatorTint(.white.opacity(0.1))
                    .listRowBackground(Color.black)
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(Color.black)
        .overlay {
            if items.isEmpty {
                ContentUnavailableView {
                    Label("Inbox is empty", systemImage: "tray")
                } description: {
                    Text("Captured text and voice notes will appear here.")
                }
                .foregroundStyle(.white.opacity(0.55))
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
    }
}

private struct InboxItemRow: View {
    let item: InboxItem

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(item.rawText)
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
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: InboxItem.self, inMemory: true)
}

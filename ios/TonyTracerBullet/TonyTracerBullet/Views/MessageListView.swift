// MessageListView.swift
// TonyTracerBullet
//
// A plain list screen showing all ingested messages.
// No styling. No VIP logic. No LLM. Pure proof-of-concept.

import SwiftUI
import SwiftData

struct MessageListView: View {

    // Fetch all messages, newest first
    @Query(sort: \IngestedMessage.receivedAt, order: .reverse)
    private var messages: [IngestedMessage]

    // Relative date formatter for display
    private let relativeFormatter: RelativeDateTimeFormatter = {
        let f = RelativeDateTimeFormatter()
        f.unitsStyle = .abbreviated
        return f
    }()

    var body: some View {
        NavigationStack {
            Group {
                if messages.isEmpty {
                    // Empty state — shown before the first Shortcut runs
                    ContentUnavailableView(
                        "No Messages Yet",
                        systemImage: "tray",
                        description: Text(
                            "Set up the iOS Shortcut to start ingesting LINE messages.\n" +
                            "See SHORTCUTS_SETUP.md for instructions."
                        )
                    )
                } else {
                    List(messages) { message in
                        VStack(alignment: .leading, spacing: 4) {
                            HStack {
                                Text(message.sender)
                                    .font(.headline)
                                Spacer()
                                Text(relativeFormatter.localizedString(
                                    for: message.receivedAt,
                                    relativeTo: .now
                                ))
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            }
                            Text(message.body)
                                .font(.body)
                                .foregroundStyle(.secondary)
                                .lineLimit(3)
                            Text("Ingested: \(message.ingestedAt.formatted(.dateTime.hour().minute().second()))")
                                .font(.caption2)
                                .foregroundStyle(.tertiary)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Tony — Tracer Bullet")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Text("\(messages.count) messages")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}

#Preview {
    MessageListView()
        .modelContainer(for: IngestedMessage.self, inMemory: true)
}

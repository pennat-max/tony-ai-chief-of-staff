import Foundation

struct DemoDataFactory {
    static let rawTexts = [
        "Urgent: approve farm fertilizer payment 25,000 THB today",
        "Chen sent revised export quote. Decide whether to accept this week",
        "Doctor appointment moved to tomorrow morning after fasting run",
        "VIGO dealer asked for vehicle stock update and payment schedule",
        "AI project release checklist needs final review before ship"
    ]

    static func makeInboxItems() -> [InboxItem] {
        rawTexts.enumerated().map { index, rawText in
            InboxItem(
                rawText: rawText,
                createdAt: .now.addingTimeInterval(TimeInterval(-300 * (index + 1)))
            )
        }
    }

    static func isDemoItem(_ item: InboxItem) -> Bool {
        rawTexts.contains(item.rawText)
    }
}

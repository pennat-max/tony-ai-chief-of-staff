import Foundation

struct DemoDataFactory {
    static func makeInboxItems() -> [InboxItem] {
        [
            InboxItem(
                rawText: "Urgent: approve farm fertilizer payment 25,000 THB today",
                createdAt: .now.addingTimeInterval(-300)
            ),
            InboxItem(
                rawText: "Chen sent revised export quote. Decide whether to accept this week",
                createdAt: .now.addingTimeInterval(-900)
            ),
            InboxItem(
                rawText: "Doctor appointment moved to tomorrow morning after fasting run",
                createdAt: .now.addingTimeInterval(-1_800)
            ),
            InboxItem(
                rawText: "VIGO dealer asked for vehicle stock update and payment schedule",
                createdAt: .now.addingTimeInterval(-3_600)
            ),
            InboxItem(
                rawText: "AI project release checklist needs final review before ship",
                createdAt: .now.addingTimeInterval(-7_200)
            )
        ]
    }
}

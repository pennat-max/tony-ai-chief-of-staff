import Foundation

struct MorningBrief {
    let topDecisions: [InboxItem]
    let domainSummaries: [(domain: String, count: Int)]
    let recommendedFirstAction: String
}

struct MorningBriefService {
    func generate(from items: [InboxItem]) -> MorningBrief {
        let activeItems = items.filter { !$0.isArchived && $0.actionState != "done" }
        let decisions = activeItems
            .filter { $0.requiresDecision || $0.urgency == "high" }
            .sorted { lhs, rhs in
                if lhs.urgency == rhs.urgency {
                    return lhs.createdAt > rhs.createdAt
                }

                return urgencyRank(lhs.urgency) > urgencyRank(rhs.urgency)
            }
            .prefix(3)

        let summaries = Dictionary(grouping: activeItems, by: \.domain)
            .map { domain, groupedItems in
                (domain: domain, count: groupedItems.count)
            }
            .sorted { lhs, rhs in
                if lhs.count == rhs.count {
                    return lhs.domain < rhs.domain
                }

                return lhs.count > rhs.count
            }

        let firstAction = decisions.first.map { item in
            item.summary.isEmpty ? item.rawText : item.summary
        } ?? activeItems.first.map { item in
            item.summary.isEmpty ? item.rawText : item.summary
        } ?? "Capture first item"

        return MorningBrief(
            topDecisions: Array(decisions),
            domainSummaries: summaries,
            recommendedFirstAction: firstAction
        )
    }

    private func urgencyRank(_ urgency: String) -> Int {
        switch urgency {
        case "high":
            return 3
        case "medium":
            return 2
        default:
            return 1
        }
    }
}

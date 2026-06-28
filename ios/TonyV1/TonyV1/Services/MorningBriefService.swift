import Foundation

struct MorningBrief {
    let topDecisions: [InboxItem]
    let domainSummaries: [(domain: String, count: Int)]
    let recommendedFirstAction: String
    let activeCount: Int
    let laterCount: Int
}

struct MorningBriefService {
    func generate(from items: [InboxItem]) -> MorningBrief {
        let activeItems = items.filter { $0.isActive }
        let laterItems = activeItems.filter { $0.actionState == InboxItem.actionLater }
        let decisions = activeItems
            .filter { $0.isDecisionCandidate }
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
            item.displaySummary
        } ?? activeItems.first.map { item in
            item.displaySummary
        } ?? "Capture first item"

        return MorningBrief(
            topDecisions: Array(decisions),
            domainSummaries: summaries,
            recommendedFirstAction: firstAction,
            activeCount: activeItems.count,
            laterCount: laterItems.count
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

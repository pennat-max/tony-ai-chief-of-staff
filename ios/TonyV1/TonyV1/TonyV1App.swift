import SwiftData
import SwiftUI

@main
struct TonyV1App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: InboxItem.self)
    }
}

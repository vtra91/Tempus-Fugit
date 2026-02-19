/*import WidgetKit
import SwiftUI

struct WidgetsView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct WidgetEntry: TimelineEntry {
    var date: Date
    let word: String
    
}

struct WidgetEntryView: View {
    var entry: WidgetEntry
    var body: some View {
        Text(entry.word)
    }
}

struct WidgetProvider: TimelineProvider {
    typealias Entry = WidgetEntry

    func placeholder(in context: Context) -> WidgetEntry {
        WidgetEntry(date: Date(), word: "Првет")
    }

    func getSnapshot(in context: Context, completion: @escaping @Sendable (WidgetEntry) -> Void) {
        let entry = WidgetEntry(date: Date(), word: "буль!")
                completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping @Sendable (Timeline<WidgetEntry>) -> Void) {
        let hour: TimeInterval = 60.0 * 60.0
                let entries: [WidgetEntry] = [
                    .init(date: Date() + hour, word: "word 1"),
                    .init(date: Date() + hour * 2, word: "word 2"),
                    .init(date: Date() + hour * 3, word: "word 3")
                ]

        let reloadDate: Date = Date().addingTimeInterval(hour * 5)
                let timeline = Timeline(entries: entries, policy: .after(reloadDate))
                completion(timeline)
    }
}

struct MyWidget: Widget {
    
    let kind: String = "MyWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: WidgetProvider()) { entry in
            WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Часики тикают")
        .description("Краткое описание виджета")
        .supportedFamilies([.systemSmall])
        .contentMarginsDisabled()
    }
}

#Preview {
    WidgetsView()
}
*/

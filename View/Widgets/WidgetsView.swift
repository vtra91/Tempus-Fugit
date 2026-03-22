import WidgetKit
import SwiftUI

// MARK: - Timeline Entry
struct WidgetEntry: TimelineEntry {
    var date: Date
    let word: String
}

// MARK: - Timeline Provider
struct WidgetProvider: TimelineProvider {
    typealias Entry = WidgetEntry
    
    func placeholder(in context: Context) -> WidgetEntry {
        WidgetEntry(date: Date(), word: "Привет")
    }
    
    func getSnapshot(in context: Context, completion: @escaping @Sendable (WidgetEntry) -> Void) {
        let entry = WidgetEntry(date: Date(), word: "буль!")
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping @Sendable (Timeline<WidgetEntry>) -> Void) {
        let hour: TimeInterval = 60.0 * 60.0
        let entries: [WidgetEntry] = [
            WidgetEntry(date: Date() + hour, word: "word 1"),
            WidgetEntry(date: Date() + hour * 2, word: "word 2"),
            WidgetEntry(date: Date() + hour * 3, word: "word 3")
        ]
        
        let reloadDate = Date().addingTimeInterval(hour * 5)
        let timeline = Timeline(entries: entries, policy: .after(reloadDate))
        completion(timeline)
    }
}

// MARK: - Widget Entry View
struct WidgetEntryView: View {
    var entry: WidgetEntry
    
    var body: some View {
        Text(entry.word)
            .font(.headline)
            .foregroundColor(.primary)
            .padding()
    }
}

// MARK: - Widget
struct MyWidget: Widget {
    let kind: String = "MyWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: WidgetProvider()) { entry in
            WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Часики тикают")
        .description("Краткое описание виджета")
        .supportedFamilies([.systemSmall])
    }
}

// MARK: - Preview
#Preview(as: .systemSmall) {
    MyWidget()
} timeline: {
    WidgetEntry(date: .now, word: "Preview")
}

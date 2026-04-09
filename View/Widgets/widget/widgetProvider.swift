import WidgetKit
import SwiftUI

struct widgetProvider: TimelineProvider {
    private let comparisons = Motivation()
    
    private let placeholderEntry = widgetEntry(date: Date(), diploma: "", icon: "person")
    
    func placeholder(in context: Context) -> widgetEntry {
        return placeholderEntry
    }
    func getSnapshot(in context: Context, completion: @escaping (widgetEntry) -> Void) {
        completion(placeholderEntry)
    }
    func getTimeline(in context: Context, completion: @escaping (Timeline<widgetEntry>) -> Void) {
        var entries: [widgetEntry] = []
        let motivation = Motivation()
        for i in 0..<10 {
            var enteryDate = Calendar.current.date(byAdding: .day, value: i, to: Date())
            let coolPhrase = motivation.coolThings.randomElement()
            let coolEmoji = motivation.icon.randomElement()
            let entry = widgetEntry(date: enteryDate!, diploma: coolPhrase!, icon: coolEmoji!)

        }
        
        let timelineEntries = Timeline(entries: entries, policy: .atEnd)
        
        completion(timelineEntries)
    }
    
}


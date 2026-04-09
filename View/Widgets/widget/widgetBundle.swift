
import WidgetKit
import SwiftUI


@main
struct Widget_Extension: Widget {
   let kind: String = "diplomaWidget"
    var body: some WidgetConfiguration {
        
        StaticConfiguration(
            kind: kind,
            provider: widgetProvider(),
            content: { widgetsView(entry: $0) }
        )
        .configurationDisplayName("Время до диплома")
        .description("Поторопись, дружище!")
        .supportedFamilies([
            .systemMedium,
            .systemSmall
        ])
    }
}

#Preview(as: .systemMedium) {
    Widget_Extension()
} timeline: {
    widgetEntry(date: .now, diploma: "Хахаха!", icon: "person")
}
 


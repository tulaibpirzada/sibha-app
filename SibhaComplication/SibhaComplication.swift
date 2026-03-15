import WidgetKit
import SwiftUI

struct SibhaComplicationEntry: TimelineEntry {
    let date: Date
}

struct SibhaComplicationProvider: TimelineProvider {
    func placeholder(in context: Context) -> SibhaComplicationEntry {
        SibhaComplicationEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SibhaComplicationEntry) -> Void) {
        completion(SibhaComplicationEntry(date: Date()))
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<SibhaComplicationEntry>) -> Void) {
        completion(Timeline(entries: [SibhaComplicationEntry(date: Date())], policy: .never))
    }
}

struct SibhaComplicationView: View {
    var entry: SibhaComplicationEntry
    @Environment(\.widgetFamily) var family

    var body: some View {
        switch family {
        case .accessoryCircular:
            ZStack {
                AccessoryWidgetBackground()
                Text("سبحة")
                    .font(.system(size: 14, weight: .medium))
                    .minimumScaleFactor(0.5)
            }
        case .accessoryCorner:
            Text("سبحة")
                .font(.system(size: 12, weight: .medium))
                .widgetLabel("Sibha")
        case .accessoryRectangular:
            HStack(spacing: 8) {
                Text("سبحة")
                    .font(.title3)
                VStack(alignment: .leading, spacing: 1) {
                    Text("Sibha")
                        .font(.headline)
                    Text("Dhikr Counter")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }
            }
        default:
            Text("سبحة")
        }
    }
}

struct SibhaComplication: Widget {
    let kind = "SibhaComplication"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: SibhaComplicationProvider()) { entry in
            SibhaComplicationView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("Sibha")
        .description("Quick access to your dhikr counter.")
        .supportedFamilies([.accessoryCircular, .accessoryCorner, .accessoryRectangular])
    }
}

#Preview(as: .accessoryCircular) {
    SibhaComplication()
} timeline: {
    SibhaComplicationEntry(date: .now)
}

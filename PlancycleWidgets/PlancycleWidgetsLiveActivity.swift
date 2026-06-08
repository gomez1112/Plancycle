//
//  PlancycleWidgetsLiveActivity.swift
//  PlancycleWidgets
//
//  Created by Gerard Gomez on 6/7/26.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct PlancycleWidgetsAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct PlancycleWidgetsLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: PlancycleWidgetsAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension PlancycleWidgetsAttributes {
    fileprivate static var preview: PlancycleWidgetsAttributes {
        PlancycleWidgetsAttributes(name: "World")
    }
}

extension PlancycleWidgetsAttributes.ContentState {
    fileprivate static var smiley: PlancycleWidgetsAttributes.ContentState {
        PlancycleWidgetsAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: PlancycleWidgetsAttributes.ContentState {
         PlancycleWidgetsAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: PlancycleWidgetsAttributes.preview) {
   PlancycleWidgetsLiveActivity()
} contentStates: {
    PlancycleWidgetsAttributes.ContentState.smiley
    PlancycleWidgetsAttributes.ContentState.starEyes
}

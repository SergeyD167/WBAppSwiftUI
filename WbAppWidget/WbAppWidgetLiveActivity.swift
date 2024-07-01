//
//  WbAppWidgetLiveActivity.swift
//  WbAppWidget
//
//  Created by Сергей Дятлов on 01.07.2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct WbAppWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct WbAppWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: WbAppWidgetAttributes.self) { context in
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

extension WbAppWidgetAttributes {
    fileprivate static var preview: WbAppWidgetAttributes {
        WbAppWidgetAttributes(name: "World")
    }
}

extension WbAppWidgetAttributes.ContentState {
    fileprivate static var smiley: WbAppWidgetAttributes.ContentState {
        WbAppWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: WbAppWidgetAttributes.ContentState {
         WbAppWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: WbAppWidgetAttributes.preview) {
   WbAppWidgetLiveActivity()
} contentStates: {
    WbAppWidgetAttributes.ContentState.smiley
    WbAppWidgetAttributes.ContentState.starEyes
}
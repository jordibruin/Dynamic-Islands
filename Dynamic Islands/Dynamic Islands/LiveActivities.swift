//
//  LiveActivities.swift
//  Dynamic Islands
//
//  Created by Jordi Bruin on 15/09/2022.
//

import Foundation
import ActivityKit
import SwiftUI
import WidgetKit


@available(iOS 16.1, *)
struct SimpleIslandAttributes: ActivityAttributes {
    public typealias Status = ContentState
    
    public struct ContentState: Codable, Hashable {}
    
    var island: Island
}


struct SimpleActivityWidget: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: SimpleIslandAttributes.self) { context in
            SimpleLockScreenLiveActivityView(context: context)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading, priority: 4) {
                    context.attributes.island.leading
                }

                DynamicIslandExpandedRegion(.trailing) {
                    context.attributes.island.trailing
                }
                
                DynamicIslandExpandedRegion(.center) {
//                    Text("Center")
                }
                
                DynamicIslandExpandedRegion(.bottom) {
//                   Text("Bottom")
                }
            } compactLeading: {
                Text("Leading")
            } compactTrailing: {
                Text("Trailing")
            } minimal: {
                Image(systemName: "phone.circle.fill")
                    .foregroundColor(.green)
                    .font(.title2)
            }
        }
    }
}


struct SimpleLockScreenLiveActivityView: View {
    let context: ActivityViewContext<SimpleIslandAttributes>
    
    var body: some View {
        Text("This is the live activity")
    }
}



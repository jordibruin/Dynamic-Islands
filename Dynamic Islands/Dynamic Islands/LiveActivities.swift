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
                    if context.attributes.island.hasCenter {
                        context.attributes.island.center
                    }
                }
            
                DynamicIslandExpandedRegion(.bottom) {
                    if context.attributes.island.hasBottom{
                        context.attributes.island.bottom
                    }
                }
            } compactLeading: {
                context.attributes.island.compactLeading
            } compactTrailing: {
                context.attributes.island.compactTrailing
            } minimal: {
                context.attributes.island.minimal
                
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



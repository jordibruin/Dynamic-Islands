//
//  AreasWidget.swift
//  Dynamic Islands
//
//  Created by Jordi Bruin on 18/09/2022.
//

import SwiftUI
import ActivityKit
import WidgetKit

struct AreasWidget: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: AreasIslandAttributes.self) { context in
            AreasLockScreen(context: context)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading, priority: 4) {
                    Island.areas.leading
                }

                DynamicIslandExpandedRegion(.trailing) {
                    Island.areas.trailing
                }
                
                DynamicIslandExpandedRegion(.center) {
                    if Island.areas.hasCenter {
                        Island.areas.center
                    }
                }
            
                DynamicIslandExpandedRegion(.bottom) {
                    if Island.areas.hasBottom{
                        Island.areas.bottom
                    }
                }
            } compactLeading: {
                Island.areas.compactLeading
            } compactTrailing: {
                Island.areas.compactTrailing
            } minimal: {
                Island.areas.minimal
            }
        }
    }
}

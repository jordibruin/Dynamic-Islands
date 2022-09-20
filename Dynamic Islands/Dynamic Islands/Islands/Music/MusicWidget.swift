//
//  PhoneWidget.swift
//  Dynamic Islands
//
//  Created by Jordi Bruin on 18/09/2022.
//

import SwiftUI
import ActivityKit
import WidgetKit

struct MusicWidget: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: MusicAttributes.self) { context in
            MusicLockScreen(context: context)
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
            .keylineTint(.blue)
        
        }
        
    }
}


//
//  PhoneWidget.swift
//  Dynamic Islands
//
//  Created by Jordi Bruin on 18/09/2022.
//

import SwiftUI
import ActivityKit
import WidgetKit

struct PhoneWidget: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: PhoneAttributes.self) { context in
            PhoneLockScreen(context: context)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading, priority: 4) {
                    PhoneLeading(caller: context.attributes.caller)
                }

                DynamicIslandExpandedRegion(.trailing) {
                    PhoneTrailing()
                }
                
                DynamicIslandExpandedRegion(.center) {
                }
            
                DynamicIslandExpandedRegion(.bottom) {
                }
            } compactLeading: {
                PhoneCompactLeading()
            } compactTrailing: {
                PhoneCompactTrailing()
            } minimal: {
                PhoneMinimal()
            }
            .keylineTint(.blue)
        
        }
        
    }
}


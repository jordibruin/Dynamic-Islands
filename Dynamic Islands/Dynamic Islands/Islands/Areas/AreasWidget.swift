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
        ActivityConfiguration(for: AreasAttributes.self) { context in
            AreasLockScreen(context: context)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading, priority: 4) {
                    AreasLeading()
                }
                DynamicIslandExpandedRegion(.trailing) {
                    AreasTrailing()
                }
                DynamicIslandExpandedRegion(.center) {
                    AreasCenter()
                }
                DynamicIslandExpandedRegion(.bottom) {
                    AreasBottom()
                }
            } compactLeading: {
                AreasCompactLeading()
            } compactTrailing: {
                AreasCompactTrailing()
            } minimal: {
                AreasMinimal()
            }
        }
    }
}

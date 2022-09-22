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
                    MusicLeading()
                }

                DynamicIslandExpandedRegion(.trailing) {
                    MusicTrailing()
                }
                
                DynamicIslandExpandedRegion(.center) {
                    if Island.music.hasCenter {
                        MusicCenter()
                    }
                }
            
                DynamicIslandExpandedRegion(.bottom) {
                    if Island.music.hasBottom{
                        MusicBottom()
                    }
                }
            } compactLeading: {
                MusicCompactLeading()
            } compactTrailing: {
                MusicCompactTrailing()
            } minimal: {
                MusicMinimal()
            }
            .keylineTint(.blue)
        
        }
        
    }
}


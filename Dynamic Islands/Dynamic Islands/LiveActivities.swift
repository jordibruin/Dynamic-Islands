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

//@available(iOSApplicationExtension 16.1, *)

//enum Island {
//    case phone
//
//
//}

@available(iOS 16.1, *)
struct SimpleIslandAttributes: ActivityAttributes {
    public typealias Status = ContentState
    
    public struct ContentState: Codable, Hashable {}
}


struct SimpleActivityWidget: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: SimpleIslandAttributes.self) { context in
            SimpleLockScreenLiveActivityView(context: context)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading, priority: 4) {
                    HStack {
                        Circle()
                            .foregroundColor(.yellow)
                            .frame(width: 50, height: 50)
                        
                        VStack {
                            Text("iPhone")
                                .opacity(0.7)
                                .font(.caption)
                            Text("John AppleSeed")
                                .font(.body)
                                
                            
                        }
                    }
                    
                }
                
                
                DynamicIslandExpandedRegion(.trailing) {
                    HStack {
                        Circle()
                            .foregroundColor(.red)
                            .frame(width: 50, height: 50)
                            .overlay(
                                Image(systemName: "phone.down.fill")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                            )
                        
                        Circle()
                            .foregroundColor(.green)
                            .frame(width: 50, height: 50)
                            .overlay(
                                Image(systemName: "phone.fill")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                            )
                    }
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



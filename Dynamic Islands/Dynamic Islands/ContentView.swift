//
//  ContentView.swift
//  Dynamic Islands
//
//  Created by Jordi Bruin on 15/09/2022.
//

import SwiftUI
import ActivityKit
//import Inject

import WidgetKit

struct ContentView: View {
    
    @State var selectedIsland: Island?
    
//    @ObserveInjection var inject
    @StateObject var activityManager = LiveActivityManager()
    
    var body: some View {
        NavigationStack {
            VStack {
                
                
                List {
                    ForEach(Island.allCases) { island in
                        Section {
                            island.overviewView
                                .swipeActions {
                                    Button("Start Live Activity") {
                                        activityManager.startLiveActivity(island: island)
                                        // This could give you issues with App Review if used on the App Store.
                                        UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
                                    }
                                    .tint(.green)
                                    
                                    Button("Stop Live Activity") {
                                        activityManager.stopLiveActivity(island: island)
                                    }
                                    .tint(.red)
                                }
                            .listRowBackground(Color.clear)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        }
                    }
                }
                
                Text("\(activeIslands) active islands")
            }
//            .toolbar(content: { toolbarItems })
            .navigationDestination(for: Island.self) { island in
                island.detailView
            }
            .navigationTitle("🏝 Dynamic Islands")
//            .onAppear {
//                checkLiveActivities()
//            }
//            .onReceive(Timer.publish(every: 1, on: .main, in: .default).autoconnect()) { input in
//                                   print("TIMER")
//                checkLiveActivities()
//            }
        }
        .statusBarHidden(true)
//        .enableInjection()
    }
    
    
    
    
    func checkLiveActivities() {
        activeIslands = 0
        for activity in Activity<MusicAttributes>.activities {
            let _ = MusicAttributes.ContentState()
            activeIslands += 1
        }
        
        for activity in Activity<AreasAttributes>.activities {
            let _ = AreasAttributes.ContentState()
            activeIslands += 1
        }
        
        for activity in Activity<PhoneAttributes>.activities {
            let _ = PhoneAttributes.ContentState()
            activeIslands += 1
        }
    }
    
    @State var activeIslands: Int = 0
    
    
//    func startLiveActivity(for island: Island) {
//        island.startLiveActivity()
//    }
    
//    func checkActiveActivities() async {
//        for await activity in Activity<SimpleIslandAttributes>.activityUpdates {
//            print("Activity detais: \(activity.attributes)")
//        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


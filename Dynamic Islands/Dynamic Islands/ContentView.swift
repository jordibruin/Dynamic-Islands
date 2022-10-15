//
//  ContentView.swift
//  Dynamic Islands
//
//  Created by Jordi Bruin on 15/09/2022.
//

import SwiftUI
import ActivityKit
import WidgetKit
//import Inject

struct ContentView: View {
    @StateObject private var activityManager = LiveActivityManager()
    //    @ObserveInjection var inject
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(Island.allCases) { island in
                    Section {
                        VStack(alignment: .center) {
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
                            Text("^[\(activityManager.activeCount(island: island)) \("island")](inflect: true)")
                                .foregroundStyle(.secondary)
                        }
                        .listRowBackground(Color.clear)
                        .listRowInsets(EdgeInsets(.zero))
                    }
                }
            }
            .navigationDestination(for: Island.self) { island in
                island.detailView
            }
            .navigationTitle("🏝 Dynamic Islands")
        }
        .statusBarHidden(true)
//        .enableInjection()
    }

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


//
//  ContentView.swift
//  Dynamic Islands
//
//  Created by Jordi Bruin on 15/09/2022.
//

import SwiftUI
import ActivityKit
import Inject

struct ContentView: View {
    
    @State var selectedIsland: Island?
    
    @ObserveInjection var inject
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(Island.allCases) { island in
                    Section {
                        NavigationLink(value: island) {
                            island.overviewView
                                .swipeActions {
                                        Button("Start Live Activity") {
                                            island.startLiveActivity()
                                            
                                            // This could give you issues with App Review if used on the App Store.
                                            UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
                                        }
                                        .tint(.green)
                                    
                                        Button("Stop Live Activity") {
                                            island.stopLiveActivity()
                                        }
                                        .tint(.red)
                                    }
                        
                        }
                        .listRowBackground(Color.clear)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                }
            }
//            .toolbar(content: { toolbarItems })
            .navigationDestination(for: Island.self) { island in
                island.detailView
            }
            .navigationTitle("🏝 Dynamic Islands")
        }
        .enableInjection()
    }
    
    var toolbarItems: some ToolbarContent {
        Group {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    Task {
                        await checkActiveActivities()
                    }
                } label: {
                    Text("Check")
                }
            }
            
            if selectedIsland != nil {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        selectedIsland!.startLiveActivity()
                    } label: {
                        Text("Start")
                    }
                    
                }
            }
        }
    }
    
    func startLiveActivity(for island: Island) {
        island.startLiveActivity()
    }
    
    func checkActiveActivities() async {
        for await activity in Activity<SimpleIslandAttributes>.activityUpdates {
            print("Activity detais: \(activity.attributes)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


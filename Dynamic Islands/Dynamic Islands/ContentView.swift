//
//  ContentView.swift
//  Dynamic Islands
//
//  Created by Jordi Bruin on 15/09/2022.
//

import SwiftUI
import ActivityKit

struct ContentView: View {
    var body: some View {
        Button {
            startLiveActivity()
        } label: {
            Text("Start Live Activity")
        }
        
        Button {
            Task {
                await checkActiveActivities()
            }
        } label: {
            Text("Check active activities")
        }


    }
    
    func startLiveActivity() {
        print("Starting Live Activity")
        let attributes = SimpleIslandAttributes()
        
        if ActivityAuthorizationInfo().areActivitiesEnabled {
            print("Activities enabled")
        } else {
            print("Not available")
        }
     
        // Estimated delivery time is one hour from now.
        let initialContentState = SimpleIslandAttributes.Status()
                                                  
        do {
            let simpleActivity = try Activity<SimpleIslandAttributes>.request(
                attributes: attributes,
                contentState: initialContentState,
                pushType: nil)
        } catch (let error) {
            print("Error requesting live activity \(error.localizedDescription)")
        }
                                                  
        do {
            let simpleActivity = try Activity<SimpleIslandAttributes>.request(
                attributes: attributes,
                contentState: initialContentState,
                pushType: nil)
            print("Requested an activity \(simpleActivity.id)")
        } catch (let error) {
            print("Error requesting Activity \(error.localizedDescription)")
        }
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

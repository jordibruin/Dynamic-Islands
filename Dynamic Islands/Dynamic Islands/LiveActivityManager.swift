//
//  LiveActivityManager.swift
//  Dynamic Islands
//
//  Created by Jordi Bruin on 22/09/2022.
//

import Foundation
import ActivityKit

class LiveActivityManager: ObservableObject {
    @Published var phoneActivity: Activity<PhoneAttributes>?
    @Published var areasActivity: Activity<AreasAttributes>?
    @Published var musicActivity: Activity<MusicAttributes>?
    
    // MARK: STARTING
    func startLiveActivity(island: Island) {
        switch island {
        case .phone:
            startPhoneActivity()
        case .areas:
            startAreasActivity()
        case .music:
            startMusicActivity()
        }
    }
    
    // MARK: STOPPING
    func stopLiveActivity(island: Island) {
        switch island {
        case .phone:
            stopPhoneActivity()
        case .areas:
            stopAreasActivity()
        case .music:
            stopMusicActivity()
        }
    }
    
    // MARK: ACTIVITIES
    
    func startPhoneActivity() {
        guard ActivityAuthorizationInfo().areActivitiesEnabled else {
            print("Activities are not enabled.")
            return
        }
        
        Task {
            let attributes = PhoneAttributes(caller: "Jordi Bruin")
            let state = PhoneAttributes.ContentState()
            do {
                try await MainActor.run {
                    let activity = try Activity<PhoneAttributes>.request(
                        attributes: attributes,
                        contentState: state,
                        pushType: nil
                    )
                    phoneActivity = activity
                }
                print("Started Phone Activity")
            } catch (let error) {
                print("Error starting activity \(error) \(error.localizedDescription)")
            }
        }
    }
    
    func startAreasActivity() {
        guard ActivityAuthorizationInfo().areActivitiesEnabled else {
            print("Activities are not enabled.")
            return
        }
        
        Task {
            let attributes = AreasAttributes()
            let state = AreasAttributes.ContentState()
            do {
                try await MainActor.run {
                    let activity = try Activity<AreasAttributes>.request(
                        attributes: attributes,
                        contentState: state,
                        pushType: nil
                    )
                    areasActivity = activity
                }
                print("Started Areas Activity")
            } catch (let error) {
                print("Error starting activity \(error) \(error.localizedDescription)")
            }
        }
    }
    
    func startMusicActivity() {
        guard ActivityAuthorizationInfo().areActivitiesEnabled else {
            print("Activities are not enabled.")
            return
        }
        
        Task {
            let attributes = MusicAttributes()
            let state = MusicAttributes.ContentState()
            do {
                try await MainActor.run {
                    let activity = try Activity<MusicAttributes>.request(
                        attributes: attributes,
                        contentState: state,
                        pushType: nil
                    )
                    musicActivity = activity
                }
        
                print("Started Music Activity")
            } catch (let error) {
                print("Error starting activity \(error) \(error.localizedDescription)")
            }
        }
    }
    
    
    func stopPhoneActivity() {
        Task {
            await phoneActivity?.end(using: nil, dismissalPolicy: .immediate)
            await MainActor.run {
                phoneActivity = nil
            }
        }
    }
    
    func stopAreasActivity() {
        Task {
            await areasActivity?.end(using: nil, dismissalPolicy: .immediate)
            await MainActor.run {
                areasActivity = nil
            }
        }
    }
    
    func stopMusicActivity() {
        Task {
            await musicActivity?.end(using: nil, dismissalPolicy: .immediate)
            await MainActor.run {
                musicActivity = nil
            }
        }
    }
}

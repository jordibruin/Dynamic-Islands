//
//  Island.swift
//  Dynamic Islands
//
//  Created by Jordi Bruin on 15/09/2022.
//

import Foundation
import SwiftUI
import ActivityKit


enum Island: String, CaseIterable, Identifiable, Hashable, Codable {
    
    case phone
    case areas
    
    var id: String {
        self.rawValue
    }

    @ViewBuilder
    var overviewView: some View {
        switch self {
        case .phone:
            RoundedRectangle(cornerRadius: 40)
                .foregroundColor(.black)
                .overlay(
                    HStack {
                        self.leading
                        Spacer()
                        self.trailing
                    }
                    .padding(.horizontal, 12)
                )
                .frame(height: 80)
        case .areas:
            RoundedRectangle(cornerRadius: 40)
                .foregroundColor(.black)
                .overlay(
                    HStack {
                        self.leading
                        Spacer()
                        self.trailing
                    }
                    .padding(.horizontal, 12)
                    .foregroundColor(.white)
                )
                .frame(height: 80)
        }
    }
    
    @ViewBuilder
    var detailView: some View {
        switch self {
        case .phone:
            PhoneDetailView()
        case .areas:
            AreasDetail()
        }
    }
    
    var attributes: any ActivityAttributes {
        switch self {
        case .phone:
            return SimpleIslandAttributes(island: .phone)
        case .areas:
            return AreasIslandAttributes(island: .areas)
        }
    }

    var hasCenter: Bool {
        switch self {
        case .phone:
            return false
        case .areas:
            return true
        }
    }
    
    var hasBottom: Bool {
        switch self {
        case .phone:
            return false
        case .areas:
            return true
        }
    }
    
    @ViewBuilder
    var leading: some View {
        switch self {
        case .phone:
            PhoneLeading()
        case .areas:
            AreasLeading()
        }
    }
    
    @ViewBuilder
    var trailing: some View {
        switch self {
        case .phone:
            PhoneTrailing()
        case .areas:
            AreasTrailing()
        }
    }
    
    @ViewBuilder
    var center: some View {
        switch self {
        case .phone:
            PhoneCenter()
        case .areas:
            AreasCenter()
        }
    }
    
    @ViewBuilder
    var bottom: some View {
        switch self {
        case .phone:
            PhoneBottom()
        case .areas:
            AreasBottom()
        }
    }
    
    @ViewBuilder
    var compactLeading: some View {
        switch self {
        case .phone:
            PhoneCompactLeading()
        case .areas:
            AreasCompactLeading()
        }
    }
    
    @ViewBuilder
    var compactTrailing: some View {
        switch self {
        case .phone:
            PhoneCompactTrailing()
        case .areas:
            AreasCompactTrailing()
        }
    }
    
    @ViewBuilder
    var minimal: some View {
        switch self {
        case .phone:
            PhoneMinimal()
        case .areas:
            AreasMinimal()
        }
    }
    
    
    func startLiveActivity() {
        
        if !ActivityAuthorizationInfo().areActivitiesEnabled {
            print("Not available")
            return
        }
        
        print("Starting Live Activity")
        
        switch self {
        case .phone:
            let initialContentState = SimpleIslandAttributes.Status()
            
            do {
                _ = try Activity<SimpleIslandAttributes>.request(
                    attributes: self.attributes as! SimpleIslandAttributes,
                    contentState: initialContentState,
                    pushType: nil)
            } catch (let error) {
                print("Error requesting live activity \(error.localizedDescription)")
            }
            
            do {
                let simpleActivity = try Activity<SimpleIslandAttributes>.request(
                    attributes: self.attributes as! SimpleIslandAttributes,
                    contentState: initialContentState,
                    pushType: nil)
                print("Requested an activity \(simpleActivity.id)")
            } catch (let error) {
                print("Error requesting Activity \(error.localizedDescription)")
            }
        case .areas:
            let initialContentState = AreasIslandAttributes.Status()
            
            do {
                _ = try Activity<AreasIslandAttributes>.request(
                    attributes: self.attributes as! AreasIslandAttributes,
                    contentState: initialContentState,
                    pushType: nil)
            } catch (let error) {
                print("Error requesting live activity \(error.localizedDescription)")
            }
            
            do {
                let simpleActivity = try Activity<AreasIslandAttributes>.request(
                    attributes: self.attributes as! AreasIslandAttributes,
                    contentState: initialContentState,
                    pushType: nil)
                print("Requested an activity \(simpleActivity.id)")
            } catch (let error) {
                print("Error requesting Activity \(error.localizedDescription)")
            }
        }
    }
}


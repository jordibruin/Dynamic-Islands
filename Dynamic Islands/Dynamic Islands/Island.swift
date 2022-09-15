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
//                .padding(.horizontal)
                .frame(height: 80)
        }
    }
    
    @ViewBuilder
    var detailView: some View {
        switch self {
        case .phone:
            PhoneDetailView()
        }
    }
    
    var attributes: any ActivityAttributes {
        switch self {
        case .phone:
            return SimpleIslandAttributes(island: .phone)
        }
    }
    

    @ViewBuilder
    var leading: some View {
        switch self {
        case .phone:
            PhoneLeading()
        }
    }
    
    @ViewBuilder
    var trailing: some View {
        switch self {
        case .phone:
            PhoneTrailing()
        }
    }
    
    @ViewBuilder
    var center: some View {
        switch self {
        case .phone:
            PhoneCenter()
        }
    }
    
    @ViewBuilder
    var bottom: some View {
        switch self {
        case .phone:
            PhoneBottom()
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
                let simpleActivity = try Activity<SimpleIslandAttributes>.request(
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
        }
    }
}


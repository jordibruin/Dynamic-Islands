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
    case music
    
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
                        PhoneLeading(caller: "Jordi Bruin")
                        Spacer()
                        PhoneTrailing()
                    }
                    .padding(.horizontal, 12)
                    .foregroundColor(.white)
                )
                .frame(height: 80)
        case .areas:
            RoundedRectangle(cornerRadius: 40)
                .foregroundColor(.black)
                .overlay(
                    HStack(spacing: 0) {
                        Rectangle()
                            .foregroundColor(.blue)
                        Rectangle()
                            .foregroundColor(.green)
                    }
                        
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.red)
                            .frame(width: 100, height: 28)
                    )
                    .overlay(
                        Text("Areas")
                    )
                    
//                    .padding(.horizontal, 12)
                    .foregroundColor(.white)
                )
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .frame(height: 80)
        case .music:
            RoundedRectangle(cornerRadius: 40)
                .foregroundColor(.black)
                .overlay(
                    HStack {
                        MusicLeading()
                        Spacer()
                        MusicTrailing()
                    }
                    .padding(.top, -4)
                    .padding(.horizontal)
                    .foregroundColor(.white)
                )
                .clipShape(RoundedRectangle(cornerRadius: 20))
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
        case .music:
            MusicDetailView()
        }
    }

    var hasCenter: Bool {
        switch self {
        case .phone:
            return false
        case .areas:
            return true
        case .music:
            return true
        }
    }
    
    var hasBottom: Bool {
        switch self {
        case .phone:
            return false
        case .areas:
            return true
        case .music:
            return true
        }
    }
}


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
            commonBackground
                .overlay(
                    HStack {
                        PhoneLeading(caller: "Jordi Bruin")
                        Spacer()
                        PhoneTrailing()
                    }
                    .padding(.horizontal, 12)
                    .padding(2)
                )
        case .areas:
            commonBackground
                .overlay(
                    HStack(spacing: 0) {
                        Rectangle()
                            .foregroundColor(.blue)
                        Rectangle()
                            .foregroundColor(.green)
                    }
                    .clipShape(Capsule())
                    .overlay(
                        Capsule()
                            .foregroundColor(.red)
                            .frame(width: 100, height: 28)
                            .overlay(
                                Text("Areas")
                                    .foregroundColor(.white)
                            )
                    )
                    .padding(2)
                )
        case .music:
            commonBackground
                .overlay(
                    HStack {
                        MusicLeading()
                        Spacer()
                        MusicTrailing()
                    }
                    .padding(.top, -4)
                    .padding(.horizontal, 12)
                    .foregroundColor(.white)
                    .padding(2)
                )
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

    private var commonBackground: some View {
        Capsule()
            .foregroundColor(.white.opacity(0.18))
            .frame(height: 84)
            .overlay(
                Capsule()
                    .foregroundColor(.black)
                    .padding(2)
            )
    }
}


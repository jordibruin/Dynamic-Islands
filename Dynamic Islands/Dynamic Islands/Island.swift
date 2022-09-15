//
//  Island.swift
//  Dynamic Islands
//
//  Created by Jordi Bruin on 15/09/2022.
//

import Foundation
import SwiftUI


enum Island: String, CaseIterable, Identifiable {
    case phone
    
    var id: String {
        self.rawValue
    }

    var overviewView: some View {
        switch self {
        case .phone:
            return HStack {
                Text("Phone")
                Spacer()
                Text("Phone Right")
            }
        }
    }
}

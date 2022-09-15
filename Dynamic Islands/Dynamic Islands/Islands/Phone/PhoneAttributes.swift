//
//  PhoneAttributes.swift
//  Dynamic Islands
//
//  Created by Jordi Bruin on 15/09/2022.
//

import Foundation
import ActivityKit

@available(iOS 16.1, *)
struct AreasIslandAttributes: ActivityAttributes {
    public typealias Status = ContentState
    
    public struct ContentState: Codable, Hashable {}
    
    var island: Island
}

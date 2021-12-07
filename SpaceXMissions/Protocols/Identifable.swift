//
//  Identifable.swift
//  SpaceXMissions
//
//  Created by Krzysztof Kinal on 04/12/2021.
//

import Foundation

protocol Identifable: AnyObject {
    
    static var identifier: String { get }
}

extension Identifable {
    
    static var identifier: String {
        return String(describing: self)
    }
}

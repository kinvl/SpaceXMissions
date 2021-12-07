//
//  Collection.swift
//  SpaceXMissions
//
//  Created by Krzysztof Kinal on 04/12/2021.
//

import Foundation

extension Collection {
    
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

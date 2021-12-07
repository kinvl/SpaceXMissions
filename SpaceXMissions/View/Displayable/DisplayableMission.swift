//
//  DisplayableMission.swift
//  SpaceXMissions
//
//  Created by Krzysztof Kinal on 04/12/2021.
//

import Foundation

struct DisplayableMission {
    let missionName: String
    let missionId: String
    var manufacturers: [String]
    var payloadIds: [String]
    var wikipedia: String
    var website: String
    var twitter: String?
    var description: String
}

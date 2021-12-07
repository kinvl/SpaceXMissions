//
//  Mission.swift
//  SpaceXMissions
//
//  Created by Krzysztof Kinal on 03/12/2021.
//

import Foundation

struct Mission: Codable {
    var missionName: String
    var missionId: String
    var manufacturers: [String]
    var payloadIds: [String]
    var wikipedia: String
    var website: String
    var twitter: String?
    var description: String
}

extension Mission {
    func makeDisplayableMission() -> DisplayableMission {
        return DisplayableMission(missionName: missionName,
                                  missionId: missionId,
                                  manufacturers: manufacturers,
                                  payloadIds: payloadIds,
                                  wikipedia: wikipedia,
                                  website: website,
                                  twitter: twitter,
                                  description: description)
    }
}

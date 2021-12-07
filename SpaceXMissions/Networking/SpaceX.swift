//
//  Missions.swift
//  SpaceXMissions
//
//  Created by Krzysztof Kinal on 03/12/2021.
//

import Foundation
import Moya

enum SpaceX {
    case getMission
}

extension SpaceX: TargetType {
    var baseURL: URL { URL(string: "https://api.spacexdata.com/v3")! }
    
    var path: String {
        switch self {
        case .getMission:
            return "/missions"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMission:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getMission:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? { nil }
    var sampleData: Data { Data() }
    var validationType: ValidationType { .successCodes }
}

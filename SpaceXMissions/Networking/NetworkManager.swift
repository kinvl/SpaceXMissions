//
//  NetworkManager.swift
//  SpaceXMissions
//
//  Created by Krzysztof Kinal on 03/12/2021.
//

import Foundation
import Moya

protocol Networkable {
    var provider: MoyaProvider<SpaceX> { get }
    
    func getMissions(completion: @escaping ([Mission]?, Error?) -> ())
}

struct NetworkManager: Networkable {
    
    var provider: MoyaProvider<SpaceX> = MoyaProvider<SpaceX>()
    
    func getMissions(completion: @escaping ([Mission]?, Error?) -> ()) {
        provider.request(.getMission) { result in
            switch result {
            case .success(let value):
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    let missions = try decoder.decode([Mission].self, from: value.data)
                    completion(missions, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}

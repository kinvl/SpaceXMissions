//
//  MissionsViewModel.swift
//  SpaceXMissions
//
//  Created by Krzysztof Kinal on 03/12/2021.
//

import Foundation

protocol ViewModel {
    init(withManager manager: Networkable)
}

class MissionsViewModel: ViewModel {
    
    var manager: Networkable
    
    var missionsData: [Mission] = [] {
        didSet { adapter.items = missionsData.map { $0.makeDisplayableMission() } }
    }
    
    lazy var adapter: MissionsTableViewAdapter = {
        let items = missionsData.map { $0.makeDisplayableMission() }
        let adapter = MissionsTableViewAdapter(items: items)
        return adapter
    }()
    
    required init(withManager manager: Networkable) {
        self.manager = manager
    }
    
    func setAdapterDelegate(to delegate: MissionTableViewAdapterDelegate) {
        self.adapter.delegate = delegate
    }
    
    func websiteURLFrom(URLString: String?, completion: ((URL?, Error?) -> ())) {
        guard let URLString = URLString else {
            completion(nil, URLError.URLEmpty)
            return }
        
        let URL = URL(string: URLString)!
        completion(URL, nil)
    }
    
    func fetchMissions(completion: @escaping (Error?) -> ()) {
        manager.getMissions(completion: { missions, error in
            self.missionsData = missions ?? []
            completion(error)
        })
    }
}

enum URLError: Error, LocalizedError {
    case URLEmpty
    
    public var errorDescription: String? {
        switch self {
        case .URLEmpty:
            return NSLocalizedString("Website URL is empty.", comment: "URL empty")
        }
    }
}

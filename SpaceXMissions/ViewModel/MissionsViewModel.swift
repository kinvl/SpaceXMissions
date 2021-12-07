//
//  MissionsViewModel.swift
//  SpaceXMissions
//
//  Created by Krzysztof Kinal on 03/12/2021.
//

import Foundation
import UIKit

protocol ViewModel {
    init(withManager manager: Networkable)
}

class MissionsViewModel: ViewModel, MissionTableViewAdapterDelegate {
    
    var manager: Networkable
    
    var missionsData: [Mission] = [] {
        didSet { adapter.items = missionsData.map { $0.makeDisplayableMission() } }
    }
    
    lazy var adapter: MissionsTableViewAdapter = {
        let items = missionsData.map { $0.makeDisplayableMission() }
        let adapter = MissionsTableViewAdapter(items: items)
        adapter.delegate = self
        return adapter
    }()
    
    required init(withManager manager: Networkable) {
        self.manager = manager
    }
    
    func openWebsite(URLString: String?) {
        guard let URLString = URLString else { return }
        let URL = URL(string: URLString)!
        
        UIApplication.shared.open(URL)
    }
    
    func fetchMissions(completion: @escaping (Error?) -> ()) {
        manager.getMissions(completion: { missions, error in
            self.missionsData = missions ?? []
            completion(error)
        })
    }
}

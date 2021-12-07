//
//  MissionsTableViewAdapter.swift
//  SpaceXMissions
//
//  Created by Krzysztof Kinal on 03/12/2021.
//

import UIKit

typealias TableAdapterType = NSObject & UITableViewDataSource & UITableViewDelegate

class MissionsTableViewAdapter: TableAdapterType {
    
    var delegate: MissionTableViewAdapterDelegate?
    
    var items: [DisplayableMission]
    
    init(items: [DisplayableMission]) {
        self.items = items
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { items.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell() as MissionTableViewCell
        guard let item = items[safe: indexPath.row] else { return UITableViewCell() }
        
        cell.initializeCell(item)
        
        cell.buttonCallback = { [weak self] URLString in
            self?.delegate?.openWebsite(URLString: URLString)
        }
        
        return cell
    }
}

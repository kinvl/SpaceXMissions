//
//  UITableView.swift
//  SpaceXMissions
//
//  Created by Krzysztof Kinal on 04/12/2021.
//

import UIKit

extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: Identifable {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue table view cell with identifier \(T.identifier)")
        }
        
        return cell
    }
    
    func dequeueReusableCell<T: UITableViewCell>() -> T where T: Identifable {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier) as? T else {
            fatalError("Could not dequeue table view cell with identifier \(T.identifier)")
        }
        
        return cell
    }
    
    func registerCellClasses(_ cellClasses: [Identifable.Type]) {
        cellClasses.forEach { register($0, forCellReuseIdentifier: $0.identifier) }
    }
    
}

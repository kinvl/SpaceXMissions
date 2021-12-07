//
//  MissionsView.swift
//  SpaceXMissions
//
//  Created by Krzysztof Kinal on 04/12/2021.
//

import UIKit
import Then

class MissionsView: UIView {
    
    private lazy var missionsTableView = UITableView(frame: .zero, style: .insetGrouped).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.registerCellClasses([MissionTableViewCell.self])
        $0.allowsSelection = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubviews()
        setupSubviews()
        self.backgroundColor = .white
    }
    
    func setAdapter(_ adapter: TableAdapterType) {
        missionsTableView.dataSource = adapter
        missionsTableView.delegate = adapter
    }
    
    func reload() {
        DispatchQueue.main.async {
            self.missionsTableView.reloadData()
        }
    }
    
    private func addSubviews() {
        [missionsTableView].forEach { addSubview($0) }
    }
    private func setupSubviews() {
        setupMissionsTableViewLayout()
    }
    
    private func setupMissionsTableViewLayout() {
        NSLayoutConstraint.activate([
            missionsTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            missionsTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            missionsTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            missionsTableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

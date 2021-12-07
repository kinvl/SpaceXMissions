//
//  MissionsViewController.swift
//  SpaceXMissions
//
//  Created by Krzysztof Kinal on 03/12/2021.
//

import UIKit
import Moya

class MissionsViewController: BaseViewController<MissionsView> {
    
    var viewModel = MissionsViewModel(withManager: NetworkManager())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.setAdapter(viewModel.adapter)
        populateMissionsTable()
    }
    
    private func populateMissionsTable() {
        viewModel.fetchMissions { [weak self] error in
            guard let self = self else { return }
            
            if let error = error {
                self.presentErrorAlert(error: error)
            } else {
                self.customView.reload()
            }
        }
    }
}

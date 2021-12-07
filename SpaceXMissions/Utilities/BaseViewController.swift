//
//  BaseViewController.swift
//  SpaceXMissions
//
//  Created by Krzysztof Kinal on 04/12/2021.
//

import UIKit

class BaseViewController<CustomView: UIView>: UIViewController {
    var customView: CustomView {
        return view as! CustomView
    }
    
    override func loadView() {
        view = CustomView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func presentErrorAlert(error: Error) {
        let alert = UIAlertController(title: "An error occured", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

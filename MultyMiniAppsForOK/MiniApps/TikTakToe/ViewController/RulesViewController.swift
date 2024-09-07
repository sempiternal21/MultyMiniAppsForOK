//
//  RulesViewController.swift
//  MultyMiniAppsForOK
//
//  Created by Danil Antonov on 05.09.2024.
//

import UIKit

class RulesViewController: UIViewController {
    var mainView: RulesView { self.view as! RulesView }
    
    override func loadView() {
        view = RulesView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.button.addTarget(self, action: #selector(tapOnOkButton), for: .touchUpInside)
    }
    
    @objc func tapOnOkButton(){
        dismiss(animated: true)
    }
}

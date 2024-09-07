//
//  Router.swift
//  MultyMiniAppsForOK
//
//  Created by Danil Antonov on 05.09.2024.
//

import UIKit

final class Router {
    private var controller: UIViewController?
    
    func setRootController(controller: UIViewController) {
        self.controller = controller
    }
    
    func pushNextViewController(vc: UIViewController) {
        self.controller?.navigationController?.pushViewController(vc, animated: true)
    }
}

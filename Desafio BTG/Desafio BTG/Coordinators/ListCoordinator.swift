//
//  ListCoordinator.swift
//  Desafio BTG
//
//  Created by Pedro Feitosa on 25/05/21.
//

import Foundation
import UIKit

class ListCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    let factory: ModuleFactory
    var childCoordinators: [Coordinator] = []
    
    required init(navigationController: UINavigationController, factory: ModuleFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func start() {
        let listCurrencyViewController: ListCurrencyViewController = factory.makeListCurrencyModule()
        self.navigationController.pushViewController(listCurrencyViewController, animated: true)
    }
    
    
}

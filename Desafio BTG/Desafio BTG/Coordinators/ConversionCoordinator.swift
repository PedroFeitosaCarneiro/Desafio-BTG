//
//  ConversionCoordinator.swift
//  Desafio BTG
//
//  Created by Pedro Feitosa on 25/05/21.
//

import Foundation
import UIKit




class ConversionCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    let factory: ModuleFactory
    var childCoordinators: [Coordinator] = []
    
    required init(navigationController: UINavigationController, factory: ModuleFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    
    
    func start() {
        let conversionCurrencyViewController: ConversionCurrencyViewController = factory.makeConversionCurrencyModule()
        conversionCurrencyViewController.navigationDelegate = self
        self.navigationController.viewControllers = [conversionCurrencyViewController]
    }
    
    
}

extension ConversionCoordinator: ConversionCurrencyNavigation {
    func navigateToListPage() {
        let listCoordinator = ListCoordinator(navigationController: navigationController, factory: ModuleFactory())
        listCoordinator.start()
    }
}

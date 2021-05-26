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
        conversionCurrencyViewController.pickerNavigationDelegate = self
        self.navigationController.viewControllers = [conversionCurrencyViewController]
    }
    
    
}

extension ConversionCoordinator: PickerCurrencyNavigation {
    func navigateToPickerPage(from: ConversionCurrencyViewController, identifier: String) {
        let pickerCoorditor = PickerCoordinator(navigationController: navigationController, factory: ModuleFactory())
        pickerCoorditor.currencyReference = from
        pickerCoorditor.identifier = identifier
        pickerCoorditor.start()
    }
    
}

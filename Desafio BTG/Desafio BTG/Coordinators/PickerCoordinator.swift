//
//  PickerCoordinator.swift
//  Desafio BTG
//
//  Created by Pedro Feitosa on 26/05/21.
//

import Foundation
import UIKit

class PickerCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    let factory: ModuleFactory
    var childCoordinators: [Coordinator] = []
    var currencyReference: ConversionCurrencyViewController?
    var identifier: String?
    
    required init(navigationController: UINavigationController, factory: ModuleFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func start() {
        let pickerCurrencyViewController: PickerCurrencyViewController = factory.makePickerCurrencyModule()
        pickerCurrencyViewController.selectedCurrecyDelegate = currencyReference
        pickerCurrencyViewController.identifier = identifier

        self.navigationController.pushViewController(pickerCurrencyViewController, animated: true)
    }
    
    
}

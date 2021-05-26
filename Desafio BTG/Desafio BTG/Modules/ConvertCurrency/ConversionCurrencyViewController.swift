//
//  ConversionCurrencyViewController.swift
//  Desafio BTG
//
//  Created by Pedro Feitosa on 25/05/21.
//

import Foundation
import UIKit

protocol PickerCurrencyNavigation: AnyObject {
    func navigateToPickerPage(from: ConversionCurrencyViewController, identifier: String)
}

class ConversionCurrencyViewController: UIViewController {
    
    weak var pickerNavigationDelegate: PickerCurrencyNavigation?
    private let conversionView = ConversionCurrencyView()
    private let manager: ConversionCurrencyManager
    
    init(manager: ConversionCurrencyManager) {
        self.manager = manager
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        setupNavigation()
        self.view = conversionView
        buildViewModel()
        conversionView.didTapFirstCurrencyButton = { [self] in
            self.pickerNavigationDelegate?.navigateToPickerPage(from: self, identifier: "First")
        }
        
        conversionView.didTapSecondCurrencyButton = { [self] in
            self.pickerNavigationDelegate?.navigateToPickerPage(from: self, identifier: "Second")
        }
        
        conversionView.didTapConvertButton = { [self] first, second, times in
            conversionView.viewModel?.textFieldValue = "\(self.manager.parseCurrency(firstCoin: first, secondCoin: second, times: times))"
        }
        
        
    }
    
    private func buildViewModel(){
        manager.getCurrencies { currencyViewModel in
            self.conversionView.viewModel = currencyViewModel
        }
    }
    
    
    func setupNavigation(){
        self.navigationItem.title = "Currency Conversion"
        
    }
    
}


extension ConversionCurrencyViewController: DidSelectCurrency {
    func didSelect(currency: String, identifier: String) {
        
        
        if identifier == "First" {
            conversionView.viewModel?.fromButtonTittle = currency
        } else {
            conversionView.viewModel?.toButtonTittle = currency
        }
        
    }
    
    
}

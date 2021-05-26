//
//  CurrencyPickerViewController.swift
//  Desafio BTG
//
//  Created by Pedro Feitosa on 26/05/21.
//

import Foundation
import UIKit

protocol DidSelectCurrency: AnyObject{
    func didSelect(currency: String, identifier: String)
}

class PickerCurrencyViewController: UIViewController {
    
    private let pickerView = CurrencyPickerView()
    private let manager: PickerCurrencyManager
    weak var selectedCurrecyDelegate: DidSelectCurrency?
    var identifier: String?
    
    init(manager: PickerCurrencyManager) {
        self.manager = manager
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = pickerView
        manager.getCurrencyCodes { [weak self] currencyCodes in
            self?.pickerView.viewModel = currencyCodes
        }
        pickerView.didSelect = { [self] currency in
            self.selectedCurrecyDelegate?.didSelect(currency: currency, identifier: self.identifier ?? "")
            self.navigationController?.popViewController(animated: true)
        }
        
        
    }
    
    
}


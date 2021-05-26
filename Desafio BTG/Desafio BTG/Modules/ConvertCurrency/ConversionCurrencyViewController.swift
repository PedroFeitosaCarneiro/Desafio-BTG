//
//  ConversionCurrencyViewController.swift
//  Desafio BTG
//
//  Created by Pedro Feitosa on 25/05/21.
//

import Foundation
import UIKit

protocol ConversionCurrencyNavigation: AnyObject {
    func navigateToListPage()
}

class ConversionCurrencyViewController: UIViewController {
    
    weak var navigationDelegate: ConversionCurrencyNavigation?
    
    private let conversionView = ConversionCurrencyView()
    
    override func viewDidLoad() {
        setupNavigation()
        self.view = conversionView
    }
    
    @objc
    func navigateToListPage(){
        navigationDelegate?.navigateToListPage()
    }
    
    func setupNavigation(){
        self.navigationItem.title = "Currency Conversion"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "List", style: .plain, target: self, action: #selector(navigateToListPage))
    }
    
}


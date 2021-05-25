//
//  ConversionCurrencyViewController.swift
//  Desafio BTG
//
//  Created by Pedro Feitosa on 25/05/21.
//

import Foundation
import UIKit


class ConversionCurrencyViewController: UIViewController {
    
    
    private let conversionView = ConversionCurrencyView()
    
    override func viewDidLoad() {
        setupNavigation()
        self.view = conversionView
    }
    
    
    func setupNavigation(){
        self.navigationItem.title = "Currency Conversion"
    }
    
}

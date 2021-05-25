//
//  ListCurrencyViewController.swift
//  Desafio BTG
//
//  Created by Pedro Feitosa on 25/05/21.
//

import Foundation
import UIKit

class ListCurrencyViewController: UIViewController {
    
    let listView = ListCurrencyView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = listView
        setupNavigation()
    }
    
    func setupNavigation(){
        self.navigationItem.title = "Currency List"
        self.navigationController?.title = "Currency List"
    }
    
    
}

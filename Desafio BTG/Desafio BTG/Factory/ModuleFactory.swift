//
//  ModuleFactory.swift
//  Desafio BTG
//
//  Created by Pedro Feitosa on 25/05/21.
//

import Foundation


protocol ConversionModuleFactory{
    func makeConversionCurrencyModule() -> ConversionCurrencyViewController
}

protocol ListModuleFactory{
    func makeListCurrencyModule() -> ListCurrencyViewController
}

class ModuleFactory: ConversionModuleFactory, ListModuleFactory{
    func makeConversionCurrencyModule() -> ConversionCurrencyViewController {
        return ConversionCurrencyViewController()
    }
    
    func makeListCurrencyModule() -> ListCurrencyViewController {
        return ListCurrencyViewController()
    }
    
}

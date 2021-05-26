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

protocol PickerModuleFactory{
    func makePickerCurrencyModule() -> PickerCurrencyViewController
}

class ModuleFactory: ConversionModuleFactory,PickerModuleFactory{

    func makeConversionCurrencyModule() -> ConversionCurrencyViewController {
        let manager = TConversionCurrencyManager()
        return ConversionCurrencyViewController(manager: manager)
    }
    
    
    func makePickerCurrencyModule() -> PickerCurrencyViewController {
        let manager = TPickerCurrencyManager()
        return PickerCurrencyViewController(manager: manager)
    }
    
}

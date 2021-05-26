//
//  PickerCurrencyManager.swift
//  Desafio BTG
//
//  Created by Pedro Feitosa on 26/05/21.
//

import Foundation

protocol PickerCurrencyManager{
    typealias ConversionCurrencyCompletion = (PickerCurrencyViewModel) -> Void
    func getCurrencyCodes(completion: @escaping ConversionCurrencyCompletion )
}

class TPickerCurrencyManager: PickerCurrencyManager {
    
    var service = CurrencyListRequest()
    
    func getCurrencyCodes(completion: @escaping ConversionCurrencyCompletion) {
        
        var currencyCodes : [(String,String)] = []
        
        if let currencies = UserDefaults.standard.object(forKey: "CurrenciesList") as? Currency {
            currencies.currencies.forEach { currencyCodes.append(($0.key, $0.value)) }
            currencyCodes.sort { $0.0 < $1.0}
            completion(TPickerCurrencyViewModel(currencyCodes: currencyCodes))
            return
        }
        
        service.makeCurrencyLiveRequest { Currency, error in
            if error != nil {
                return
            }
            guard let currency = Currency else { return }
            UserDefaults.standard.setValue(currency.currencies, forKey: "CurrenciesList")
            currency.currencies.forEach { currencyCodes.append(($0.key, $0.value)) }
            currencyCodes.sort { $0.0 < $1.0}
            completion(TPickerCurrencyViewModel(currencyCodes: currencyCodes))
        }
    }
    
    
    
    
}

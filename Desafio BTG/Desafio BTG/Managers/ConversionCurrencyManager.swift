//
//  ConversionCurrencyManager.swift
//  Desafio BTG
//
//  Created by Pedro Feitosa on 25/05/21.
//

import Foundation

protocol ConversionCurrencyManager{
    typealias ConversionCurrencyCompletion = (ConversionCurrencyViewModel) -> Void
    func getCurrencies(completion: @escaping ConversionCurrencyCompletion)
    func parseCurrency(firstCoin: String, secondCoin: String, times: Float) -> Float
    var parser : CurrencyParser { get }
}

class TConversionCurrencyManager: ConversionCurrencyManager {
    
    var parser: CurrencyParser = .init()
    var service = CurrencyLiveRequest()
    
    
    func getCurrencies(completion: @escaping ConversionCurrencyCompletion) {
        
        var currencyCodes : [String] = []
        
        if let currencies = UserDefaults.standard.object(forKey: "CurrenciesLive") as? CurrencyQuotes {
            currencies.quotes.forEach { currencyCodes.append($0.key) }
            completion(TConversionCurrencyViewModel(fromButtonTittle: "N/A",
                                                    toButtonTittle: "N/A",
                                                    currencyCodes: currencyCodes))
            return
        }
        
        service.makeCurrencyLiveRequest { Currency, error in
            if error != nil {
                return
            }
            guard let currency = Currency else { return }
            
            currency.quotes.forEach { currencyCodes.append($0.key) }
            UserDefaults.standard.setValue(currency.quotes, forKey: "CurrenciesLive")
            completion(TConversionCurrencyViewModel(fromButtonTittle: "N/A",
                                                    toButtonTittle: "N/A",
                                                    currencyCodes: currencyCodes))
        }
    }
    
    func parseCurrency(firstCoin: String, secondCoin: String, times: Float) -> Float{
        
        do {
             return try parser.convertCurrency(from: firstCoin, to: secondCoin, times: times)
        } catch  {
            print(error)
        }
        
        return 0.0
    }
    
    
    
    
}

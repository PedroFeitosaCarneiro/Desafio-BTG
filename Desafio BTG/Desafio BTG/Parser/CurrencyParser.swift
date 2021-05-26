//
//  CurrencyParser.swift
//  Desafio BTG
//
//  Created by Pedro Feitosa on 25/05/21.
//

import Foundation

enum BadCurrency: Error {
    case notFound
    case unkown
}


class CurrencyParser{
    typealias CurrencyCode = String?
    private let BaseCurrencyCode = "USDUSD"
    
    private var stashedCurrencies: [String:Float]?
    
    
    init() {
        if let currencies = UserDefaults.standard.object(forKey: "CurrenciesLive") as? [String:Float] {
            self.stashedCurrencies = currencies
        }
    }
    
    func convertCurrency(from oldCurrency: CurrencyCode,
                         to newCurrency: CurrencyCode,
                         times: Float) throws -> Float{
        
        var calculatedCurrency: (Float,Float) = (0,0)
        guard let stashedCurrencies = stashedCurrencies else { throw BadCurrency.notFound }
        stashedCurrencies.forEach { (key,value) in
            if key == "USD\(newCurrency ?? "")"{
                calculatedCurrency.0 = value
            } else if key == "USD\(oldCurrency ?? "")" {
                calculatedCurrency.1 = value
            }
        }
        if oldCurrency == BaseCurrencyCode {
            return times * calculatedCurrency.1
        }
        
        if calculatedCurrency.0 == 0 {
            return times * (calculatedCurrency.1/calculatedCurrency.1)
        } else if calculatedCurrency.1 == 0 {
            return times * (calculatedCurrency.0/calculatedCurrency.0)
        }
        
        return(times * (calculatedCurrency.0/calculatedCurrency.1))
        
    }
    
    
    
    
}

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
        
    }
    
    func convertCurrency(from oldCurrency: CurrencyCode,
                         to newCurrency: CurrencyCode,
                         times: Float) throws -> Float{
        
        var calculatedCurrency: (Float,Float) = (0,0)
        guard let stashedCurrencies = stashedCurrencies else { throw BadCurrency.notFound }
        stashedCurrencies.forEach { (key,value) in
            if key == oldCurrency{
                calculatedCurrency.0 = value
            } else if key == newCurrency {
                calculatedCurrency.1 = value
            }
        }
        if oldCurrency == BaseCurrencyCode {
            return times * calculatedCurrency.1
        }
        return(times * (calculatedCurrency.0/calculatedCurrency.1))
        
    }
    
    
    
    
}

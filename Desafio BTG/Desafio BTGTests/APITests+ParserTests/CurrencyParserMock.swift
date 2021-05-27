//
//  CurrencyParserMock.swift
//  Desafio BTGTests
//
//  Created by Pedro Feitosa on 27/05/21.
//

@testable import Desafio_BTG
import Foundation

class CurrencyParserMock {
    
    typealias CurrencyCode = String?
    private let BaseCurrencyCode = "USDUSD"
    
    private var stashedCurrencies: [String:Float]?
    
    
    
    init() {
        
        let dataJson = liveJson.data(using: .utf8)!
        let decoder = JSONDecoder()
        let currencies = try? decoder.decode(TCurrencyQuotes.self, from: dataJson)
        stashedCurrencies = currencies?.quotes
    }
    
    func convertCurrency(from oldCurrency: CurrencyCode,
                         to newCurrency: CurrencyCode,
                         times: Float) -> Float {
        var calculatedCurrency: (Float,Float) = (0,0)
        guard let stashedCurrencies = stashedCurrencies else { return -1.0 }
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

//
//  ConversionCurrencyViewModel.swift
//  Desafio BTG
//
//  Created by Pedro Feitosa on 25/05/21.
//

import Foundation

protocol ConversionCurrencyViewModel {
    var currencyCodes: [String] { get }
    var fromButtonTittle: String { get set }
    var toButtonTittle: String { get set }
    var textFieldValue: String? { get set }
}

struct TConversionCurrencyViewModel: ConversionCurrencyViewModel {
    var fromButtonTittle: String
    var toButtonTittle: String
    var currencyCodes: [String]
    var textFieldValue: String? = ""
}

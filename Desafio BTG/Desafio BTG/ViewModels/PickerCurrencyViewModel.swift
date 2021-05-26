//
//  PickerCurrencyViewModel.swift
//  Desafio BTG
//
//  Created by Pedro Feitosa on 26/05/21.
//

import Foundation

protocol PickerCurrencyViewModel {
    var currencyCodes: [(String,String)] { get }
}

struct TPickerCurrencyViewModel: PickerCurrencyViewModel {
    var currencyCodes: [(String,String)]
}

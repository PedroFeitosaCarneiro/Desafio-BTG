//
//  Currency.swift
//  Desafio BTG
//
//  Created by Pedro Feitosa on 25/05/21.
//

import Foundation

protocol CurrencyQuotes: Codable{
    var success: Bool { get }
    var terms: String { get }
    var privacy: String { get }
    var timestamp: Int { get }
    var source: String { get }
    var quotes: [String:Float] { get }
}

struct TCurrencyQuotes: CurrencyQuotes, Codable{
    var success: Bool
    var terms: String
    var privacy: String
    var timestamp: Int
    var source: String
    var quotes: [String:Float]
}


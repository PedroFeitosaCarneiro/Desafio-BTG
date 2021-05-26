//
//  Currency.swift
//  Desafio BTG
//
//  Created by Pedro Feitosa on 26/05/21.
//

import Foundation

protocol Currency: Codable {
    var success: Bool { get }
    var terms: String { get }
    var privacy: String { get }
    var currencies: [String:String] { get }
}

struct TCurrency: Currency, Codable {
    var success: Bool
    var terms: String
    var privacy: String
    var currencies: [String : String]
}

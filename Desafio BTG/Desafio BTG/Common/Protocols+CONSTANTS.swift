//
//  Protocols.swift
//  Desafio BTG
//
//  Created by Pedro Feitosa on 25/05/21.
//

import Foundation

class CONSTANTS {
    static let APIKEY = "79eeaddff87d7e8dda32f1370a6663cc"
}


public protocol ViewCoding {
    
    func buildViewHierarchy()

    func setupConstraints()

    func setupAdditionalConfiguration()

    func setupView()
}

extension ViewCoding {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }

    func setupAdditionalConfiguration() {}
}

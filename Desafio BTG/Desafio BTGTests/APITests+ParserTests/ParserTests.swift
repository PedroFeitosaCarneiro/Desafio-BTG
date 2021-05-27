//
//  ParserTests.swift
//  Desafio BTGTests
//
//  Created by Pedro Feitosa on 26/05/21.
//

import XCTest
@testable import Desafio_BTG

class ParserTests: XCTestCase {

    var parser: CurrencyParserMock!
    
    override func setUpWithError() throws {
        parser = CurrencyParserMock()
    }
    
    func testParsingWithSuccess(){
        let parsedCurrency = parser.convertCurrency(from: "USD", to: "BRL", times: 5)
        XCTAssertEqual(parsedCurrency, 26.560509)
    }

    override func tearDownWithError() throws {
        parser = nil
    }


}

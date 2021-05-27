//
//  CurrencyListServiceTests.swift
//  Desafio BTGTests
//
//  Created by Pedro Feitosa on 26/05/21.
//

import XCTest
@testable import Desafio_BTG

class CurrencyListServiceTests: XCTestCase {

    var requester : CurrencyListRequest!
    
    
    
    override func setUpWithError() throws {
        requester = CurrencyListRequest()
    }
    
    
    func testFetchCurrencyListwithSuccess(){
        
        var currenciesCount = 0
        let expectation = expectation(description: "Fetching Currencies List")
        
        requester.makeCurrencyLiveRequest { Currency, error in
            
            if (error != nil){
                guard let error = error else {return}
                XCTFail(error.localizedDescription)
            }
            
            guard let currency = Currency else { return XCTFail(error!.localizedDescription) }
            currenciesCount = currency.currencies.count
            XCTAssertNotNil(currency.currencies)
            XCTAssertNotNil(currency.privacy)
            XCTAssertNotNil(currency.success)
            XCTAssertNotNil(currency.terms)
            expectation.fulfill()

        }
        
        wait(for: [expectation], timeout: 5.0)
        
        XCTAssertEqual(currenciesCount, 168, "Should've loaded 168 currencies.")
    }

    

    override func tearDownWithError() throws {
        requester = nil
    }

}

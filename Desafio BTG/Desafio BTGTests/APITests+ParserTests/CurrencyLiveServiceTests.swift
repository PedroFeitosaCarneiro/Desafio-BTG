//
//  CurrencyLiveServiceTests.swift
//  Desafio BTGTests
//
//  Created by Pedro Feitosa on 26/05/21.
//

import XCTest
@testable import Desafio_BTG

class CurrencyLiveServiceTests: XCTestCase {

    var requester: CurrencyLiveRequest!
    
    override func setUpWithError() throws {
       requester = CurrencyLiveRequest()
    }
    
    
    func testFetchquotesWithSuccess(){
        var quotesCount = 0
        let expectation = expectation(description: "Fetching Quotes")
        
        requester.makeCurrencyLiveRequest { Currency, error in
            if (error != nil){
                guard let error = error else {return}
                XCTFail(error.localizedDescription)
            }
            
            guard let currency = Currency else { return XCTFail(error!.localizedDescription) }
            quotesCount = currency.quotes.count
            XCTAssertNotNil(currency.privacy)
            XCTAssertNotNil(currency.quotes)
            XCTAssertNotNil(currency.source)
            XCTAssertNotNil(currency.success)
            XCTAssertNotNil(currency.terms)
            XCTAssertNotNil(currency.timestamp)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
        
        XCTAssertEqual(quotesCount, 168, "Should've loaded 168 Quotes.")
        
        
    }
    

    override func tearDownWithError() throws {
        requester = nil
    }


}

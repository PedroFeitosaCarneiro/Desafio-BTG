//
//  CurrencyLiveRequest.swift
//  Desafio BTG
//
//  Created by Pedro Feitosa on 25/05/21.
//

import Foundation

class CurrencyLiveRequest{
    typealias ResponseHandler = (CurrencyQuotes?, Error?) -> ()
    
    let request = CurrencyLiveService()
    
    func makeCurrencyLiveRequest(completionHandler: @escaping ResponseHandler){
        let apiLoader = APILoader(apiRequest: request)
        let queryParameters : KeyValuePairs<Any,Any> = ["access_key":CONSTANTS.APIKEY]
        
        apiLoader.loadAPIRequest(requestData: queryParameters) { (response, error) in
                if let error = error {
                    completionHandler(nil, error)
                } else {
                    guard let response = response else { return }
                    let currencyResponse: CurrencyQuotes = response
                    completionHandler(currencyResponse, nil)
                }
            }

    }
}

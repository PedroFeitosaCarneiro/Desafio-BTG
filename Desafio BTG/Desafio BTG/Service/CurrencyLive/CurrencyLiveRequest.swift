//
//  CurrencyLiveRequest.swift
//  Desafio BTG
//
//  Created by Pedro Feitosa on 25/05/21.
//

import Foundation

class CurrencyLiveRequest{
    typealias ResponseHandler = (Currency?, Error?) -> ()
    
    let request = CurrencyLiveService()
    
    func makeCurrencyLiveRequest(completionHandler: @escaping (Currency?, Error?) -> ()){
        let apiLoader = APILoader(apiRequest: request)
        let queryParameters : KeyValuePairs<Any,Any> = ["access_key":Utils.APIkey]
        
        apiLoader.loadAPIRequest(requestData: queryParameters) { (response, error) in
                if let error = error {
                    completionHandler(nil, error)
                } else {
                    guard let response = response else { return }
                    let currencyResponse: Currency = response
                    completionHandler(currencyResponse, nil)
                }
            }

    }
}

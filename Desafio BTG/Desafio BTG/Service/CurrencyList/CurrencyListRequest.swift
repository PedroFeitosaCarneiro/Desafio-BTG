//
//  CurrencyListRequest.swift
//  Desafio BTG
//
//  Created by Pedro Feitosa on 26/05/21.
//

import Foundation

class CurrencyListRequest{
    typealias ResponseHandler = (Currency?, Error?) -> ()
    
    let request = CurrencyListService()
    
    func makeCurrencyLiveRequest(completionHandler: @escaping ResponseHandler){
        let apiLoader = APILoader(apiRequest: request)
        let queryParameters : KeyValuePairs<Any,Any> = ["access_key":Utils.APIkey]
        
        apiLoader.loadAPIRequest(requestData: queryParameters) { (response, error) in
                if let error = error {
                    completionHandler(nil, error)
                } else {
                    guard let response = response else { return }
                    let currencyResponse: TCurrency = response
                    completionHandler(currencyResponse, nil)
                }
            }

    }
}

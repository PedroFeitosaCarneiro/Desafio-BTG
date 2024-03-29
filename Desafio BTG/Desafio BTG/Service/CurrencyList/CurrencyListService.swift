//
//  CurrencyListService.swift
//  Desafio BTG
//
//  Created by Pedro Feitosa on 26/05/21.
//

import Foundation

struct CurrencyListService: APIHandler{
    
    private var requestURL: URLComponents {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "api.currencylayer.com"
        components.path = "/list"
        return components
    }
    
    func makeRequest(from param: KeyValuePairs<Any, Any>) -> URLRequest? {
        if var url = requestURL.url {
            url = setQueryParams(parameters: param, url: url)
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            return urlRequest
        }
        return nil
    }
    
    func parseResponse(data: Data, response: HTTPURLResponse) throws -> TCurrency? {
        return try defaultParseResponse(data: data,response: response)
    }
    
}

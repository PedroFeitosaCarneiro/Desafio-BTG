//
//  APIHandler.swift
//  Desafio BTG
//
//  Created by Pedro Feitosa on 25/05/21.
//

import Foundation

public enum HTTPMethod: String{
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}

typealias APIHandler = RequestHandler & ResponseHandler

protocol RequestHandler {
    associatedtype RequestDataType
    func makeRequest(from data: RequestDataType) -> URLRequest?
}

protocol ResponseHandler {
    associatedtype ResponseDataType
    func parseResponse(data: Data, response: HTTPURLResponse) throws -> ResponseDataType?
}

extension RequestHandler{
    
    func setQueryParams(parameters:KeyValuePairs<Any, Any>, url: URL) -> URL {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        components?.queryItems = parameters.map { element in URLQueryItem(name: element.key as! String, value: String(describing: element.value) ) }
        
        return components?.url ?? url
    }
    
}

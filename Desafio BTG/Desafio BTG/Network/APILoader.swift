//
//  APILoader.swift
//  Desafio BTG
//
//  Created by Pedro Feitosa on 25/05/21.
//

import Foundation

class APILoader<T: APIHandler>{
    
    let apiRequest: T
    
    init(apiRequest: T) {
        self.apiRequest = apiRequest
    }
    func loadAPIRequest(requestData: T.RequestDataType, completionHandler: @escaping (T.ResponseDataType?, Error?) -> ()){
        
        if let urlRequest = apiRequest.makeRequest(from: requestData){
            URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                guard let data = data, let response = response as? HTTPURLResponse else {
                    return completionHandler(nil, error)
                }
                do {
                    let parsedResponse = try self.apiRequest.parseResponse(data: data, response: response)
                    completionHandler(parsedResponse,nil)
                } catch {
                    completionHandler(nil,error)
                }
            }.resume()
            

            
        }
    }
    
    
    
}

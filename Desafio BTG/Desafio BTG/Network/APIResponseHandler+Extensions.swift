//
//  APIResponseHandler+Extensions.swift
//  Desafio BTG
//
//  Created by Pedro Feitosa on 25/05/21.
//

import Foundation

import Foundation

/// Estrutura de Erro.
struct ServiceError: Error,Codable {
    let httpStatus : Int
    let message: String
}

extension ResponseHandler{
    
    func defaultParseResponse<T: Codable>(data: Data, response: HTTPURLResponse) throws -> T{
        let decoder = JSONDecoder()
        do {
            let body = try decoder.decode(T.self, from: data)
            if response.statusCode == 200 {
                return body
            } else {
                throw ServiceError(httpStatus: response.statusCode, message: "Erro desconhecido")
            }
        } catch  {
            throw ServiceError(httpStatus: response.statusCode, message: error.localizedDescription)
        }
    }
}

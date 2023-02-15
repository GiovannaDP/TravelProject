//
//  LoginRequest.swift
//  DanellisTravel
//
//  Created by Giovanna Danelli Pau on 13/02/23.
//

import Foundation

enum ServiceErrorr: Error {
    case invalidURL
    case network(Error?)
}

class LoginRequest {
    
    func apiCall(model: LoginModel, callback: @escaping(Result<Any, ServiceError>) -> Void) {
        guard let url = URL(string: "http://localhost:8080/travel/user") else {
            return
        }
        
        var urlComponents = URLComponents(string: "http://localhost:8080/travel/user")!
        
        var components = URLComponents(string: "http://localhost:8080/travel/user")!
            components.queryItems = [
                URLQueryItem(name: "username", value: model.username),
                URLQueryItem(name: "password", value: model.password)
            ]
        
        var request = URLRequest(url: components.url!)
        
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")


        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                callback(.failure(.network(error)))
                return
            }
            
            let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
            callback(.success(json))
        }
        task.resume()
    }
}

//
//  VoosRequest.swift
//  DanellisTravel
//
//  Created by Giovanna Danelli Pau on 22/02/23.
//

import Foundation
import UIKit

class VoosRequest {
    
    func apiCall(callback: @escaping(Result<Any, ServiceError>) -> Void) {
        
        var listaVoos: [VooViewModel.Voo] = []
        let url = Bundle.main.url(forResource: "voos-response", withExtension: "json")
        let data = NSData(contentsOf: url!)
        
        do {
            let object = try JSONSerialization.jsonObject(with: data! as Data, options: .allowFragments)
            if let dictionary = object as? [String: AnyObject] {
                readJSONObject(object: dictionary)
            }
        } catch {
            // Handle Error
        }
        
        func readJSONObject(object: [String: AnyObject]) {
            guard let voos = object["voo"] as? [[String: AnyObject]] else { return }
            for voo in voos {
                guard let id = voo["id"] as? Int,
                    let origem = voo["origem"] as? String,
                let destino = voo["destino"] as? String,
                let asset = voo["asset"] as? String,
                let compainha = voo["compainha"] as? String,
                let preco = voo["preco"] as? Int,
                let cancelamento = voo["cancelamento"] as? String else { break }
                let response = VooViewModel.Voo(id: id, origem: origem, destino: destino, asset: asset, companhia: compainha, preco: preco, cancelamento: cancelamento)
                listaVoos.append(response)
            }
            
            debugPrint(listaVoos)
        }
        //        guard let url = URL(string: "http://localhost:8080/travel/user") else {
        //            return
        //        }
        //
        //        var urlComponents = URLComponents(string: "http://localhost:8080/travel/user")!
        //
        //
        //        var request = URLRequest(url: url)
        //
        //        request.httpMethod = "POST"
        //        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //        let body : [String: AnyHashable] = [
        //            "email": model.email,
        //            "name": model.name,
        //            "password": model.password,
        //            "phone": model.phone,
        //            "username": model.username
        //        ]
        //        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        //        guard let operation = "voos-response" else { return }
        //        guard let response = VooViewModel.Voo.parse(jso)
        //        let task = URLSession.shared.dataTask(with: request) { data, response, error in
        //            guard let data = data else {
        //                callback(.failure(.network(error)))
        //                return
        //            }
        //
        //            let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
        //            callback(.success(json))
        //        }
        //        task.resume()
        //    }
    }
}

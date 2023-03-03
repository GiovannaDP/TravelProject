//
//  PacotesRequest.swift
//  DanellisTravel
//
//  Created by Giovanna Danelli Pau on 22/02/23.
//

import Foundation
import UIKit

class PacotesRequest {
    
    func apiCall(callback: @escaping(Result<Any, ServiceError>) -> Void) {
        
        var listaPacotes: [VooViewModel.Voo] = []
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
                guard let adicionais = voo["adicionais"] as? [[String: AnyObject]] else { return }
                
                var adicionaisVoo: VooViewModel.Adicionais = VooViewModel.Adicionais(malaDespachada: false, wifi: false)
                
                for adicional in adicionais {
                    guard let malaDespachada = adicional["malaDespachada"] as? Bool,
                          let wifi = adicional["wifi"] as? Bool else { return }
                    adicionaisVoo = VooViewModel.Adicionais(malaDespachada: malaDespachada, wifi: wifi)
                    
                }
                
                guard let id = voo["id"] as? Int,
                    let origem = voo["origem"] as? String,
                let destino = voo["destino"] as? String,
                let asset = voo["asset"] as? String,
                let compainha = voo["compainha"] as? String,
                let preco = voo["preco"] as? Int,
                let data = voo["data"] as? String,
                let horario = voo["horario"] as? String,
                let classe = voo["classe"] as? String else { break }
                
                
                
                let response = VooViewModel.Voo(id: id, origem: origem, destino: destino, data: data, horario: horario, asset: asset, companhia: compainha, preco: preco, adicionais: adicionaisVoo, classe: classe)
                
                listaVoos.append(response)
            }
            
            debugPrint(listaVoos)
        }
       
    }
}

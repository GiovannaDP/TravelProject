//
//  PacotesViewModel.swift
//  DanellisTravel
//
//  Created by Giovanna Danelli Pau on 22/02/23.
//

import Foundation

enum PacotesViewModel {
    
    struct pacote: Codable {
        let id: Int
        let nome: String
        let local: String
        let dataChegada: String
        let dataSaida: String
        let asset: String
        let nota: Double
        let precoDiaria: Double
    
        enum CodingKeys: String, CodingKey {
            case id
            case nome = "name"
            case local = "location"
            case dataChegada = "departureDate"
            case dataSaida = "returnDate"
            case asset
            case nota = "rate"
            case precoDiaria = "dailyPrice"
        }
    }
}

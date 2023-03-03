//
//  HotelViewModel.swift
//  DanellisTravel
//
//  Created by Giovanna Danelli Pau on 22/02/23.
//

import Foundation

enum HotelViewModel {
    
    struct hotel: Codable {
        let id: Int
        let nome: String
        let local: String
        let dataChegada: String
        let dataSaida: String
        let nota: Double
        let precoDiaria: Double
        let images: [Imagens]
        let additional: [Adicionais]?
    
        enum CodingKeys: String, CodingKey {
            case id
            case nome = "name"
            case local = "location"
            case dataChegada = "departureDate"
            case dataSaida = "returnDate"
            case nota = "rate"
            case precoDiaria = "dailyPrice"
            case images
            case additional
        }
    }
    
    struct Adicionais: Codable {
        let id: Int
        let title: Bool
        let information: Bool
        
        enum CodingKeys: String, CodingKey {
            case id
            case title
            case information
        }
    }
    
    struct Imagens: Codable {
        let id: Int
        let image: String
        
        enum CodingKeys: String, CodingKey {
            case id
            case image
        }
    }
}

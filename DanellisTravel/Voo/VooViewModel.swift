//
//  VooViewModel.swift
//  DanellisTravel
//
//  Created by Giovanna Danelli Pau on 22/02/23.
//

import Foundation

enum VooViewModel {
    
    struct Voo: Codable {
        let id: Int
        let name: String
        let origin: String
        let destiny: String
        let departureDate: String
        let returnDate: String
        let images: [Imagens]
        let airline: String
        let price: Double
        let vacancies: Int
        let additional: [Adicionais]?
        let classType: String
        let error: String?
    
        enum CodingKeys: String, CodingKey {
            case id
            case name
            case origin
            case destiny
            case departureDate
            case returnDate
            case images
            case airline
            case price
            case vacancies
            case additional
            case classType
            case error
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

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
        let voo: VooViewModel.Voo
        let hotel: HotelViewModel.hotel
    
        enum CodingKeys: String, CodingKey {
            case id
            case voo
            case hotel
        }
    }
}

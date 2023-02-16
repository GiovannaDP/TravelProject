//
//  LoginModel.swift
//  DanellisTravel
//
//  Created by Giovanna Danelli Pau on 14/02/23.
//

import Foundation

struct LoginModel: Codable {
    let password: String
    let username: String
}

struct UserResponse: Codable {
    let userId: Int
    let name: String
    let profileType: String
    let username: String
    
    enum CodingKeys: String, CodingKey {
        case userId = "id"
        case name
        case profileType
        case username
    }
}

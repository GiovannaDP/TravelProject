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

struct UserModel: Codable {
    let id: Int
    let name: String
    let type: String
    let username: String
}

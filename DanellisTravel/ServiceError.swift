//
//  ServiceError.swift
//  DanellisTravel
//
//  Created by Giovanna Danelli Pau on 15/02/23.
//

import Foundation

enum ServiceError: Error {
    case invalidURL
    case decodeFail(Error?)
    case network(Error?)
}

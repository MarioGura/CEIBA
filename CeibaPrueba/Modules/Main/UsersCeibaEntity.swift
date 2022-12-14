//
//  UsersCeibaEntity.swift
//  CeibaPrueba
//
//  Created by JOSE MARIO GUTIERREZ RAYA on 31/08/22.
//

import Foundation

struct ResponseUser: Codable {
    let id: Int
    let name: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company
}

struct Address: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
}

struct Geo: Codable {
    let lat: String
    let lng: String
}

struct Company: Codable {
    let name: String
    let catchPhrase: String
    let bs: String
}

struct ResponsePosts: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

struct dataPosts: Codable {
    var name: String
    var phone: String
    var email: String
}

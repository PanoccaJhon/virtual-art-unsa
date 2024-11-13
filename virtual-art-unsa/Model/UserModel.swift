//
//  UserModel.swift
//  virtual-art-unsa
//
//  Created by panocca on 11/13/24.
//

import Foundation

struct User: Identifiable, Codable {
    let id: Int
    let name: String
    let email: String
    let phone: String
    let password: String
    let photoURL: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case email
        case phone
        case password
        case photoURL = "photo_url"
    }
}


struct UserPreferences: Identifiable, Codable {
    let id: Int
    let userId: Int
    let darkTheme: Bool
    let language: String

    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case darkTheme = "dark_theme"
        case language
    }
}

struct LoginResponse: Decodable {
    let exists: Bool
}


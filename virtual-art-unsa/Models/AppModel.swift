//
//  AppModel.swift
//  virtual-art-unsa
//
//  Created by panocca on 11/13/24.
//

import Foundation

struct Work: Identifiable, Codable {
    let id: Int
    let title: String
    let exhibitionId: Int
    let technique: String
    let description: String
    let dimension: String
    let year: Int
    let image: String
    let positionX: String
    let positionY: String

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case exhibitionId = "exhibition_id"
        case technique
        case description
        case dimension
        case year
        case image
        case positionX = "position_x"
        case positionY = "position_y"
    }
}

struct Artist: Identifiable, Codable {
    let id: Int
    let name: String
    let lastname: String
    let specialty: String
    let photo: String
    let biography: String
    let awards: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case lastname
        case specialty
        case photo
        case biography
        case awards
    }
}

struct Gallery: Identifiable, Codable {
    let id: Int
    let name: String
    let description: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
    }
}


struct Exhibition: Identifiable, Codable {
    let id: Int
    let name: String
    let galleryId: Int
    let artistId: Int
    let period: String
    let descriptionText: String
    let descriptionAudio: String
    let state: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case galleryId = "gallery_id"
        case artistId = "artist_id"
        case period
        case descriptionText = "description_text"
        case descriptionAudio = "description_audio"
        case state
    }
}



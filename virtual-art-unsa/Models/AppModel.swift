//
//  AppModel.swift
//  virtual-art-unsa
//
//  Created by panocca on 11/13/24.
//

import Foundation

struct RandomWorkImage:Identifiable, Codable {
    let id: Int??
    let image: String
}

struct WorkDetail: Identifiable, Codable {
    let id: Int??
    let title: String
    let image: String
    let description: String
    let technique: String
    let dimension: String
    let year: Int
    let exhibition: String
    let artistname: String
    let artistslastname: String
    let gallery: String
}

struct ExhibitionItem: Identifiable, Codable {
    let id: Int??
    let name: String
    let gallery_id: Int
}

struct ExhibitionDetail: Identifiable, Codable {
    let id: Int??
    let name: String
    let artistname: String
    let artistlastname: String
    let gallery: String
    let period: String
    let description_text: String
    let description_audio: String
    let state: Bool
}

struct ImageExhibition: Identifiable, Codable {
    let id: Int??
    let title: String
    let image: String
}


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



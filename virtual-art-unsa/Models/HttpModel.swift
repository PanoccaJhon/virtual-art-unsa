//
//  HttpModel.swift
//  virtual-art-unsa
//
//  Created by panocca on 11/13/24.
//

import Foundation

struct WorkResponse: Decodable {
    let success: Bool
    let data: [Work]
    let count: Int
    let offset: Int
    let limit: Int
}

struct RandomWorksResponse: Decodable {
    let success: Bool
    let data: [RandomWorkImage]

}

struct WorkDetailResponse: Decodable {
    let success: Bool
    let data: WorkDetail
}

struct ExhibitionsListResponse: Decodable {
    let success: Bool
    let data: [ExhibitionItem]
    let count: Int
    let offset: Int
    let limit: Int}

struct ExhibitionDetailResponse: Decodable {
    let success: Bool
    let data: ExhibitionDetail
}

struct ImagesExhibitionListResponse: Decodable {
    let success: Bool
    let data: [ImageExhibition]
}

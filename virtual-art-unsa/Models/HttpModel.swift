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

<<<<<<< HEAD
=======
struct RandomWorksResponse: Decodable {
    let success: Bool
    let data: [RandomWorkImage]

}
>>>>>>> 58fa396 (Initial Commit)

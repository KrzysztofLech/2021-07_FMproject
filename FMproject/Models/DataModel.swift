//
//  DataModel.swift
//  FMproject
//
//  Created by KL on 10/07/2021.
//

import Foundation

struct DataModel: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case title
        case description
        case modificationDate
        case orderId
        case imageUrl = "image_url"
    }
    
    let title: String
    let description: String
    let modificationDate: String
    let orderId: Int
    let imageUrl: String
}

//
//  Movie.swift
//  TrailerApp
//
//  Created by Rick De Vries on 15/04/2019.
//  Copyright © 2019 Rick De Vries. All rights reserved.
//

import UIKit

struct Movie: Codable {
    let id: Int
    let title: String
    let trailer: String
    let posterImage: String
    let stillImage: String
    let genre: [String]
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case trailer = "url"
        case posterImage = "posterImage"
        case stillImage = "stillImage"
        case genre = "genre"
        case description = "description"
    }
}

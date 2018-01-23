//
//  APIMovie.swift
//  ViperTest
//
//  Created by santi on 22/1/18.
//  Copyright © 2018 santiagofranco. All rights reserved.
//

import Foundation

struct APIMovie: Codable {
    
    let identifier: String
    let name: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case identifier = "imdbID"
        case name = "Title"
        case image = "Poster"
    }
}

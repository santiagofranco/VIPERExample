//
//  Movie.swift
//  ViperTest
//
//  Created by santi on 21/1/18.
//  Copyright © 2018 santiagofranco. All rights reserved.
//

import Foundation

struct MovieModel: Codable {
    
    let id: String
    let poster: String
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case id = "imdbID"
        case poster = "Poster"
        case title = "Title"
    }
    
}

struct SearchMovie: Codable {
    
    let search: [MovieModel]
    
    enum CodingKeys: String, CodingKey {
        case search = "Search"
    }
    
}

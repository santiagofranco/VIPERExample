//
//  APIMovieSearch.swift
//  ViperTest
//
//  Created by santi on 22/1/18.
//  Copyright © 2018 santiagofranco. All rights reserved.
//

import Foundation

struct APIMovieSearch: Codable {
    
    let movies: [APIMovie]
    
    enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
    
}

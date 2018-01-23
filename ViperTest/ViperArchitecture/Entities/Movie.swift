//
//  Movie.swift
//  ViperTest
//
//  Created by santi on 22/1/18.
//  Copyright © 2018 santiagofranco. All rights reserved.
//

import Foundation

struct Movie {
    let id: String
    let title: String
    let poster: String
    
    init(id: String, title: String, poster: String) {
        self.id = id
        self.title = title
        self.poster = poster
    }
}

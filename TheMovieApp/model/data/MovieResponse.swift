//
//  MovieResponse.swift
//  TheMovieApp
//
//  Created by Carlos Mancilla on 26-11-20.
//

import Foundation

struct MovieResponse: Decodable {
    let page: Int?
    let totalPages: Int?
    let results: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case results
    }
}

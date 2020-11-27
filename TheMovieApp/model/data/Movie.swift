//
//  Movie.swift
//  TheMovieApp
//
//  Created by Carlos Mancilla on 26-11-20.
//

import Foundation

struct Movie: Decodable {
    let originalLanguage: String?
    let originalTitle: String?
    let posterPath: String?
    let video: Bool?
    let voteAverage: Double?
    let popularity: Double?
    let voteCount: Int?
    let releaseDate: Date?
    let overview: String?
    let adult: Bool?
    let backdropPath: String?
    let id: Int?
    let genreIds: [Int]?
    let title: String?
    
    enum CodingKeys: String, CodingKey {
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case video
        case voteAverage = "vote_average"
        case popularity
        case voteCount = "vote_count"
        case releaseDate = "release_date"
        case overview
        case adult
        case backdropPath = "backdrop_path"
        case id
        case genreIds = "genre_ids"
        case title
    }
}


/*
 {
             "original_language": "en",
             "original_title": "Hard Kill",
             "poster_path": "/ugZW8ocsrfgI95pnQ7wrmKDxIe.jpg",
             "video": false,
             "vote_average": 4.9,
             "popularity": 1089.982,
             "vote_count": 172,
             "release_date": "2020-10-23",
             "overview": "The work of billionaire tech CEO Donovan Chalmers is so valuable that he hires mercenaries to protect it, and a terrorist group kidnaps his daughter just to get it.",
             "adult": false,
             "backdrop_path": "/86L8wqGMDbwURPni2t7FQ0nDjsH.jpg",
             "id": 724989,
             "genre_ids": [
                 28,
                 53
             ],
             "title": "Hard Kill"
         },
 */

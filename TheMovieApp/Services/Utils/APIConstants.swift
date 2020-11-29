//
//  Constants.swift
//  TheMovieApp
//
//  Created by Carlos Mancilla on 26-11-20.
//

import Foundation

enum APIConstants: String {
    case apiKey = "de18e9daa4bfe05fa07c4ee22ea301b2"
    case urlBase = "https://api.themoviedb.org/3/"
    case urlDiscoverMovie = "discover/movie?sort_by=popularity.desc"
    case urlBasePoster = "https://image.tmdb.org/t/p/w500"
}

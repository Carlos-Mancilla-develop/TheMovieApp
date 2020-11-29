//
//  MovieTest.swift
//  TheMovieAppTests
//
//  Created by Carlos Mancilla on 28-11-20.
//

import XCTest
@testable import TheMovieApp

class MovieTest: XCTestCase {
    
    var sut: Movie!

    func testMovie_SetGet() {
        let sut = Movie(originalLanguage: "Castellano", originalTitle: "Prueba de Movie Set y Get", posterPath: "/poster-movie.jpg", video: false, voteAverage: 4.5, popularity: 4.5, voteCount: 300, releaseDate: Calendar.current.date(byAdding: .year, value: -1, to: Date())!, overview: "Estas son pruebas unitarias de Movie", adult: false, backdropPath: "/poster.jpg", id: 1, genreIds: [1], title: "Prueba Movie")
        XCTAssertEqual(sut.title, "Prueba Movie")
        XCTAssertEqual(sut.id, 1)
        XCTAssertEqual(sut.posterPath, "/poster-movie.jpg")
        XCTAssertEqual(sut.originalLanguage, "Castellano")
        XCTAssertEqual(sut.originalTitle, "Prueba de Movie Set y Get")
        XCTAssertEqual(sut.video, false)
        XCTAssertEqual(sut.voteAverage, 4.5)
        XCTAssertEqual(sut.popularity, 4.5)
        XCTAssertEqual(sut.voteCount, 300)
        XCTAssertEqual(sut.overview, "Estas son pruebas unitarias de Movie")
        XCTAssertEqual(sut.adult, false)
        XCTAssertEqual(sut.backdropPath, "/poster.jpg")
        XCTAssertEqual(sut.genreIds, [1])
    }

}

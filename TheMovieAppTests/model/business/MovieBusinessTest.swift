//
//  MovieBUsinessTest.swift
//  TheMovieAppTests
//
//  Created by Carlos Mancilla on 28-11-20.
//

import XCTest
@testable import TheMovieApp

class MovieBusinessTest: XCTestCase {
    
    var sut: MovieBusiness!

    func testMovieBusiness_SetGet() {
        let sut = MovieBusiness(id: 1, title: "Prueba Movie Business", overview: "Esta película es para probar el set y get", releaseDate: Calendar.current.date(byAdding: .year, value: -1, to: Date())!, posterPath: "/poster-prueba.jpg")
        XCTAssertEqual(sut.title, "Prueba Movie Business")
        XCTAssertEqual(sut.id, 1)
        XCTAssertEqual(sut.posterPath, "/poster-prueba.jpg")
        XCTAssertEqual(sut.overview, "Esta película es para probar el set y get")
    }
}

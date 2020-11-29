//
//  MovieApiTest.swift
//  TheMovieAppTests
//
//  Created by Carlos Mancilla on 28-11-20.
//

import XCTest
@testable import TheMovieApp

class MovieApiTest: XCTestCase {
    
    var sut: MovieApi!
    
    override func setUp() {
        sut = MovieApi.shared
        super.setUp()
    }
      
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testMovieApi_externalGetMovies_whenCallMethod_thenArrayMoviesNotEmpthy() {
        // Given
        let expectation = self.expectation(description: "Se espera tamaño array  mayor que 0")
        
        // When
        sut.externalGetMovies()
        var arrayMovies = sut.arrayMovies
        if (arrayMovies.count > 0) {
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 5.0, handler: nil)
        arrayMovies = sut.arrayMovies
        
        // Then
        XCTAssertGreaterThan(arrayMovies.count, 0)
        
    }
    
    

}

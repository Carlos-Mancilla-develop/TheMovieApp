//
//  MainInteractorTest.swift
//  TheMovieAppTests
//
//  Created by Carlos Mancilla on 28-11-20.
//

import XCTest
@testable import TheMovieApp

class MainInteractorTest: XCTestCase {
    
    var sut: MockMainInteractor?
    
    override func setUp() {
        sut = MockMainInteractor()
        super.setUp()
    }
      
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testMainInteractor_interactorGetMovies_whenCallMethod_thenArrayMoviesNotEmpthy() {
        
        // Given
        let expectation = self.expectation(description: "Se espera tamaño array mayor que 0")
        
        // When
        sut?.interactorGetMovies()
        var arrayMovies = sut!.arrayMovies
        if (arrayMovies.count > 0) {
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 1.0, handler: nil)
        arrayMovies = sut!.arrayMovies
        print("MovieApiTest: arrayMovies.count: \(arrayMovies.count)")
        
        // Then
        XCTAssertGreaterThan(arrayMovies.count, 0)
    }
    
    func testMainInteractor_repositoryCallBackMovies_givenArrayMovies_whenCallMethod_thenArrayMoviesBusinessNotEmpthy() {
        
        // Given
        let expectation = self.expectation(description: "Se espera tamaño array 1")
        let movieTest = Movie(originalLanguage: "", originalTitle: "", posterPath: "", video: false, voteAverage: 0.0, popularity: 0.0, voteCount: 0, releaseDate: Calendar.current.date(byAdding: .year, value: -100, to: Date()), overview: "", adult: false, backdropPath: "", id: -1, genreIds: [0], title: "Test testMainInteractor_repositoryCallBackMovies. Es un caso de pruebas")
        
        // When
        sut?.repositoryCallBackMovies(with: [movieTest])
        var arrayMovies = sut!.arrayMovieBusiness
        if (arrayMovies.count > 0) {
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 1.0, handler: nil)
        arrayMovies = sut!.arrayMovieBusiness
        print("MovieApiTest: arrayMovies.count: \(arrayMovies.count)")
        
        // Then
        XCTAssertGreaterThan(arrayMovies.count, 0)
    }

}


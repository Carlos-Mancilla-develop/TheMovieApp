//
//  MainRouterTest.swift
//  TheMovieAppTests
//
//  Created by Carlos Mancilla on 28-11-20.
//

import XCTest
@testable import TheMovieApp

class MainRouterTest: XCTestCase {
    
    var sut: MainRouter!

    override func setUp() {
        super.setUp()
        sut = MainRouter()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testMainRouter_presentNewViewDetail_givenMainViewArrayMovieBusiness_whenCallMethod_thenDetailView() {
        //Given
        let mockMainView = MockmainView()
        let movieBusiness = MovieBusiness(id: 1, title: "Test en Main Router", overview: "Prueba en el router", releaseDate: Calendar.current.date(byAdding: .year, value: -1, to: Date())!, posterPath: "/poster-router.jpg")
        
        // When
        sut.presentNewViewDetail(from: mockMainView, withMovie: movieBusiness)
        
        // Then
        XCTAssertTrue(sut.newDetailView is DetailView)
    }

}

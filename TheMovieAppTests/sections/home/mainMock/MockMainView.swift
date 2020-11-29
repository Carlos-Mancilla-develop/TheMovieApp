//
//  MockMainView.swift
//  TheMovieAppTests
//
//  Created by Carlos Mancilla on 28-11-20.
//

import Foundation
@testable import TheMovieApp

class MockmainView: MainViewProtocol {
    var loading = false
    
    var presenter: MainPresenterProtocol?
    
    func presenterPushMoviesView(receivedMovies: [MovieBusiness]) {
        //
    }
    
    func cargarActivity() {
        loading = true
    }
    
    func stopAndHideActivity() {
        loading = false
    }
    
    
}

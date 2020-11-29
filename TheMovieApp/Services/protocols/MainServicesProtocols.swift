//
//  MainServicesProtocol.swift
//  TheMovieApp
//
//  Created by Carlos Mancilla on 26-11-20.
//

import Foundation

//Vista principal
protocol MainRemoteDataManagerInputProtocol: class {
    // REPOSITORY -> REMOTEDATAMANAGER
    var remoteRequestHandler: MainRemoteDataManagerOutputProtocol? { get set }
    
    func externalGetMovies()
    
}

protocol MainRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> REPOSITORY
    func remoteDataManagerCallBackMovies(with movies: [Movie])
}

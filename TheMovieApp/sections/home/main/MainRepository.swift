//
//  MainRepository.swift
//  TheMovieApp
//
//  Created by Carlos Mancilla on 27-11-20.
//

import Foundation

class MainRepository: MainRepositoryInputProtocol {
    var interactor: MainRepositoryOutputProtocol?
    
    var remoteDatamanager: MainRemoteDataManagerInputProtocol?
    
    func repositoryGetMovies() {
        print("MainRepository: Decirle al remote data manager que tiene que traer unos datos")
        remoteDatamanager?.externalGetMovies()
    }
    
}

extension MainRepository: MainRemoteDataManagerOutputProtocol {
    func remoteDataManagerCallBackMovies(with movies: [Movie]) {
        print("MainRepository: El repository debe enviarle los datos al interactor.")
        interactor?.repositoryCallBackMovies(with: movies)
    }
}

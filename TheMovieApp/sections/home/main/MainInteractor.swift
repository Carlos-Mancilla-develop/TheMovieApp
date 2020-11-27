//
//  MainInteractor.swift
//  TheMovieApp
//
//  Created by Carlos Mancilla on 27-11-20.
//

import Foundation

class MainInteractor: MainInteractorInputProtocol {
    var presenter: MainInteractorOutputProtocol?
    
    var repositoryInputProtocol: MainRepositoryInputProtocol?
    
    var arrayMovieBusiness = [MovieBusiness]()
    
    func interactorGetMovies() {
        print("MainInteractor: Decirle al repository que tiene que traer las peliculas")
        repositoryInputProtocol?.repositoryGetMovies()
    }
    
}

extension MainInteractor: MainRepositoryOutputProtocol {
    func repositoryCallBackMovies(with movies: [Movie]) {
        print("MainInteractor: El interactor debe enviarle los datos procesados al presenter.")
        print("MainInteractor: Estoy obteniendo estos datos, movies: \(movies)")
        print("MainInteractor:Recorrer el objeto movies y conformar el objeto MovieBusiness, para entregar al presenter un dato listo para desplegar")
        
        //Se realiza Mapper
        for movie in movies {
            let movieBusiness = MovieBusiness(id: movie.id, title: movie.title, overview: movie.overview, releaseDate: movie.releaseDate, posterPath: movie.posterPath)
            self.arrayMovieBusiness.append(movieBusiness)
        }
        print("HomeInteractor: Le paso al presenter self.arrayMovieBusiness: \(self.arrayMovieBusiness)")
        presenter?.interactoPushMoviesPresenter(receivedMovies: self.arrayMovieBusiness)
    }
    
}

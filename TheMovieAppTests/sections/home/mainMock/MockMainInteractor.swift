//
//  MockMainInteractor.swift
//  TheMovieAppTests
//
//  Created by Carlos Mancilla on 28-11-20.
//

import Foundation
@testable import TheMovieApp

class MockMainInteractor: MainInteractorInputProtocol {
    public var arrayMovies = [Movie]()
    public var arrayMovieBusiness = [MovieBusiness]()
    
    var presenter: MainInteractorOutputProtocol?
    
    var repositoryInputProtocol: MainRepositoryInputProtocol?
    
    func interactorGetMovies() {
        let movieTest = Movie(originalLanguage: "", originalTitle: "", posterPath: "", video: false, voteAverage: 0.0, popularity: 0.0, voteCount: 0, releaseDate: Calendar.current.date(byAdding: .year, value: -100, to: Date()), overview: "", adult: false, backdropPath: "", id: -1, genreIds: [0], title: "Test Interactor. Es un caso de pruebas")
        self.arrayMovies = [movieTest]
        //self.repositoryCallBackMovies(with: self.arrayMovies)
    }
 
}

extension MockMainInteractor: MainRepositoryOutputProtocol {
    func repositoryCallBackMovies(with movies: [Movie]) {
        print("MockMainInteractor: El interactor debe enviarle los datos procesados al presenter.")
        print("MockMainInteractor: Estoy obteniendo estos datos, movies: \(movies)")
        print("MockMainInteractor: Recorrer el objeto movies y conformar el objeto MovieBusiness, para entregar al presenter un dato listo para desplegar")
        
        //Se realiza Mapper
        for movie in movies {
            let movieBusiness = MovieBusiness(id: movie.id!, title: movie.title!, overview: movie.overview!, releaseDate: movie.releaseDate!, posterPath: movie.posterPath!)
            self.arrayMovieBusiness.append(movieBusiness)
        }
        print("MockMainInteractor: Le paso al presenter self.arrayMovieBusiness: \(self.arrayMovieBusiness)")
    }
    
    
}

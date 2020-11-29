//
//  MovieApi.swift
//  TheMovieApp
//
//  Created by Carlos Mancilla on 26-11-20.
//

import Foundation
import Alamofire

final class MovieApi: MainRemoteDataManagerInputProtocol {
    var remoteRequestHandler: MainRemoteDataManagerOutputProtocol?
    private let statusOK = 200...299
    static let shared = MovieApi()
    
    public var url = "\(APIConstants.urlBase.rawValue)\(APIConstants.urlDiscoverMovie.rawValue)&api_key=\(APIConstants.apiKey.rawValue)"
    
    public var arrayMovies = [Movie]() //Para que sea testeable con XCTest sin usar framework de mock
    
    func externalGetMovies() {
        //print("MainRemoteDataManager(MovieApi) url: \(url)")
        
        AF.request(url, method: .get).validate(statusCode: statusOK).responseDecodable (of: MovieResponse.self, decoder: DateDecoder()){ response in
            
            if let movies = response.value?.results, movies.count > 0 {
                //print("MainRemoteDataManager: Peliculas encontradas: \(movies.count)" )
                //print("MainRemoteDataManager: Enviar datos de vuelta al Repository")
                self.arrayMovies = movies
            } else {
                //print("error: \(response.error?.responseCode ?? 500)")
                let movieError = Movie(originalLanguage: "", originalTitle: "", posterPath: "", video: false, voteAverage: 0.0, popularity: 0.0, voteCount: 0, releaseDate: Calendar.current.date(byAdding: .year, value: -100, to: Date()), overview: "", adult: false, backdropPath: "", id: -1, genreIds: [0], title: "Películas no encontradas. Código http error: \(response.error?.responseCode ?? 500)")
                self.arrayMovies = [movieError]
            }
            self.remoteRequestHandler?.remoteDataManagerCallBackMovies(with: self.arrayMovies)
        }
    } 
    
}

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
    
    func externalGetMovies() {
        let url = "\(APIConstants.urlBase)?/\(APIConstants.urlDiscoverMovie)&api_key=\(APIConstants.apiKey)"
        print("url: \(url)")
        
        AF.request(url, method: .get).validate(statusCode: statusOK).responseDecodable (of: MovieResponse.self, decoder: DateDecoder()){ response in
            
            if let movies = response.value?.results, movies.count > 0 {
                print("MainRemoteDataManager: Peliculas encontradas: \(movies.count)" )
                print("MainRemoteDataManager: Enviar datos de vuelta al Repository")
                self.remoteRequestHandler?.remoteDataManagerCallBackMovies(with: movies)
                //success(movies)
            } else {
                print("error: \(response.error?.responseCode ?? 500)")
                //failure(response.error)
            }
        }
    }
    
    
    
    static let shared = MovieApi()
    
    func getMovies(success: @escaping (_ movies: [Movie]) -> (),
                   failure: @escaping (_ error: Error?) -> ()){
        let url = "\(APIConstants.urlBase)?/\(APIConstants.urlDiscoverMovie)&api_key=\(APIConstants.apiKey)"
        print("url: \(url)")
        
        AF.request(url, method: .get).validate(statusCode: statusOK).responseDecodable (of: MovieResponse.self, decoder: DateDecoder()){ response in
            
            if let movies = response.value?.results, movies.count > 0 {
                print("Peliculas encontradas: \(movies.count)" )
                success(movies)
            } else {
                print("error: \(response.error?.responseCode ?? 500)")
                failure(response.error)
            }
        }
        
    }
    
}

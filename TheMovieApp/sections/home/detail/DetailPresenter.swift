//
//  DetailPresenter.swift
//  TheMovieApp
//
//  Created by Carlos Mancilla on 28-11-20.
//

import Foundation

class DetailPresenter {
    var view: DetailViewProtocol?
    var router: DetailRouterProtocol?
    
    var movieRecibida: MovieBusiness?

}

extension DetailPresenter: DetailPresenterProtocol {
    func viewDidLoad() {
        //print("DetailPresenter: Hola, soy el presenter y tengo la pelicula \(self.movieRecibida!.title)")
        let urlString = "\(APIConstants.urlBasePoster.rawValue)\(movieRecibida!.posterPath)"
        //print("DetailPresenter: urlString: \(urlString)")
        
        view?.setUrlPoster(url: URL(string: urlString)!)
        
        view?.muestraDetalle(movie: movieRecibida!)
        
    }
    
    
}

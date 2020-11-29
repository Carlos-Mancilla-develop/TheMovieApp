//
//  DetailProtocol.swift
//  TheMovieApp
//
//  Created by Carlos Mancilla on 27-11-20.
//

import Foundation
import UIKit

protocol DetailViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: DetailPresenterProtocol? { get set }
    
    func muestraDetalle(movie: MovieBusiness)
    func setUrlPoster(url: URL)
}

protocol DetailPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: DetailViewProtocol? { get set }
    var router: DetailRouterProtocol? { get set }
    var movieRecibida: MovieBusiness? { get set }
    
    func viewDidLoad()
}

protocol DetailRouterProtocol: class {
    // PRESENTER -> ROUTER
    static func createDetailModule(with movie: MovieBusiness) -> UIViewController
}


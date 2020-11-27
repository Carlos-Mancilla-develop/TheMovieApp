//
//  MainProtocol.swift
//  TheMovieApp
//
//  Created by Carlos Mancilla on 25-11-20.
//

import Foundation
import UIKit

protocol MainViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: MainPresenterProtocol? { get set }
    func presenterPushMoviesView(receivedMovies: [MovieBusiness])
    func cargarActivity()
    func stopAndHideActivity()
}

protocol MainRouterProtocol: class {
    // PRESENTER -> ROUTER
    static func createMainModule() -> UIViewController
    
    func presentNewViewDetail(from view: MainViewProtocol, withMovie: MovieBusiness)
}

protocol MainPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: MainViewProtocol? { get set }
    var interactor: MainInteractorInputProtocol? { get set }
    var router: MainRouterProtocol? { get set }
    
    func viewDidLoad()
    func showDetailView(with movie: MovieBusiness)
}

protocol MainInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func interactoPushMoviesPresenter(receivedMovies:[MovieBusiness])
}

protocol MainInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: MainInteractorOutputProtocol? { get set }
    var repositoryInputProtocol: MainRepositoryInputProtocol? { get set }
    
    func interactorGetMovies()
}
 
protocol MainRepositoryInputProtocol: class {
    // INTERACTOR -> REPOSITORY
    var interactor: MainRepositoryOutputProtocol? { get set }
    var remoteDatamanager: MainRemoteDataManagerInputProtocol? { get set }
    
    func repositoryGetMovies()
}

protocol MainRepositoryOutputProtocol: class {
    // REPOSITORY -> INTERACTOR
    func repositoryCallBackMovies(with movies: [Movie])
}

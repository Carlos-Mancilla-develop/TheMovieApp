//
//  MainPresenter.swift
//  TheMovieApp
//
//  Created by Carlos Mancilla on 27-11-20.
//

import Foundation

class MainPresenter {
    
    // MARK: Properties
    weak var view: MainViewProtocol?
    var interactor: MainInteractorInputProtocol?
    var router: MainRouterProtocol?
}

extension MainPresenter: MainPresenterProtocol {
    func viewDidLoad() {
        print("MainPresenter:: viewDidLoad: Decirle al interactor que quiere traer unos datos")
        interactor?.interactorGetMovies()
        print("MainPresenter:: viewDidLoad: Decirle al view que cargue el loading")
        view?.cargarActivity()
    }
    
    func showDetailView(with movie: MovieBusiness) {
        print("MainPresenter:: DetailPresenter: Aquí vamos a llamar al router")
        router?.presentNewViewDetail(from: view!, withMovie: movie)
    }
}

extension MainPresenter: MainInteractorOutputProtocol {
    func interactoPushMoviesPresenter(receivedMovies: [MovieBusiness]) {
        print("MainPresenter: Recibido desde el Interactor, receivedMovies: \(receivedMovies)")
        print("MainPresenter: Ahora se debe enviar a HomeView para desplegarlo en la vista")
        view?.stopAndHideActivity()
        view?.presenterPushMoviesView(receivedMovies: receivedMovies)
    }
}

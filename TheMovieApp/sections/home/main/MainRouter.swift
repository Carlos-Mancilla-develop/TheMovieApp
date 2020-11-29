//
//  MainRouter.swift
//  TheMovieApp
//
//  Created by Carlos Mancilla on 26-11-20.
//

import Foundation
import UIKit

class MainRouter: MainRouterProtocol {
    public var newDetailView: UIViewController?

    class func createMainModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "navigation")
        
        if let view = navController.children.first as? MainView {
            let presenter: MainPresenterProtocol & MainInteractorOutputProtocol = MainPresenter()
            let interactor: MainInteractorInputProtocol & MainRepositoryOutputProtocol = MainInteractor()
            let remoteDataManager: MainRemoteDataManagerInputProtocol = MovieApi.shared
            let router: MainRouterProtocol = MainRouter()
            let repository: MainRepositoryInputProtocol & MainRemoteDataManagerOutputProtocol = MainRepository()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.repositoryInputProtocol = repository
            repository.interactor = interactor
            repository.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = repository
         
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "MainView", bundle: Bundle.main)
    }
    
    func presentNewViewDetail(from view: MainViewProtocol, withMovie: MovieBusiness) {
        //print("MainRouter: Presentar el detalle de la vista, crear nuevo modulo e instanciarlo")
        newDetailView = DetailRouter.createDetailModule(with: withMovie)
        
        if let newView = view as? UIViewController {
            newView.navigationController?.pushViewController(newDetailView!, animated: true)
        }
    }
}

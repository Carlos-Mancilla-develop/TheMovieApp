//
//  MainRouter.swift
//  TheMovieApp
//
//  Created by Carlos Mancilla on 26-11-20.
//

import Foundation
import UIKit

class MainRouter: MainRouterProtocol {

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
        print("MainRouter: Presentar el detalle de la vista, crear nuevo modulo e instanciarlo")
    }
    
    /*
    func presentNewViewDetail(from view: MainViewProtocol, withData: DatoURL) {
        print("MainRouter: Presentar el detalle de la vista, crear nuevo modulo e instanciarlo")
        let newDetailView = DetailTestRouter.createDetailTestModule(with: withData)
        
        if let newView = view as? UIViewController {
            newView.navigationController?.pushViewController(newDetailView, animated: true)
        }
    }
    */
}

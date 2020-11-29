//
//  DetailRouter.swift
//  TheMovieApp
//
//  Created by Carlos Mancilla on 28-11-20.
//

import Foundation
import UIKit

class DetailRouter: DetailRouterProtocol {
    static func createDetailModule(with movie: MovieBusiness) -> UIViewController {
        //print("DetailRouter: Se crea detalle ViewController")
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "DetailView")
        
        if let view = navController as? DetailView {
            let presenter: DetailPresenterProtocol  = DetailPresenter()
            let router: DetailRouterProtocol = DetailRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.movieRecibida = movie
            presenter.router = router
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "DetailView", bundle: Bundle.main)
    }
    
}

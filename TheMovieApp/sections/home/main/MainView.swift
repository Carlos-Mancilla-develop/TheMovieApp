//
//  MainView.swift
//  TheMovieApp
//
//  Created by Carlos Mancilla on 26-11-20.
//

import Foundation
import UIKit

class MainView: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var tabla: UITableView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    var presenter: MainPresenterProtocol?
    var arrayMovies = [MovieBusiness]()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Se comunica la vista con el presenter
        presenter?.viewDidLoad()
    }
}

extension MainView: MainViewProtocol {
    func presenterPushMoviesView(receivedMovies: [MovieBusiness]) {
        print("MainView: Recibido desde el Presenter, receivedMovies: \(receivedMovies)")
        print("MainView: Ahora se debe desplegar en la vista")
        arrayMovies = receivedMovies
        DispatchQueue.main.async {
            self.tabla.reloadData()
        }
    }
    
    func cargarActivity() {
        DispatchQueue.main.async {
            self.activity.startAnimating()
        }
    }
    
    func stopAndHideActivity() {
        DispatchQueue.main.async {
            self.activity.stopAnimating()
            self.activity.hidesWhenStopped = true
        }
    }
}

extension MainView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = arrayMovies[indexPath.row].title
        return cell
    }
    
    
}

extension MainView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //presenter?.showDetailView(with: DatoURL(datosURL: arrayViewURL[indexPath.row].datosURL))
        print("didSelectRowAt indexPath: \(indexPath)")
    }
    
}

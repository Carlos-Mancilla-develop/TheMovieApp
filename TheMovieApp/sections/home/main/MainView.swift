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
        //print("MainView: Recibido desde el Presenter, receivedMovies: \(receivedMovies)")
        //print("MainView: Ahora se debe desplegar en la vista")
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
        //print("MainView: arrayMovies.count: \(arrayMovies.count)")
        return arrayMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        //print("MainView: movie.title: \(arrayMovies[indexPath.row].title)")
        cell.textLabel?.text = arrayMovies[indexPath.row].title
        return cell
    }
    
    
}

extension MainView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = MovieBusiness(id: arrayMovies[indexPath.row].id, title: arrayMovies[indexPath.row].title, overview: arrayMovies[indexPath.row].overview, releaseDate: arrayMovies[indexPath.row].releaseDate, posterPath: arrayMovies[indexPath.row].posterPath)
        
        print("MainView: selected movie,title: \(movie.title)")
        presenter?.showDetailView(with: movie)
    }
    
}

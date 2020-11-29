//
//  DetailView.swift
//  TheMovieApp
//
//  Created by Carlos Mancilla on 28-11-20.
//

import Foundation
import UIKit
import Kingfisher

class DetailView: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var idValLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var resumeTextView: UITextView!
    @IBOutlet weak var dateReleaseLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    var url: URL?
    
    
    var presenter: DetailPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension DetailView: DetailViewProtocol {
    func setUrlPoster(url: URL) {
        self.url = url
    }
    
    func muestraDetalle(movie: MovieBusiness) {
        DispatchQueue.main.async {
            self.idValLabel.text = "\(movie.id)"
            self.titleLabel.text = movie.title
            self.resumeTextView.text = movie.overview
            self.dateReleaseLabel.text = "\(movie.releaseDate)"
            self.posterImageView.kf.setImage(with: self.url)
        }
    }
    
    
}

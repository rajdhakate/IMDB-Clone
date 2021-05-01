//
//  DetailViewController.swift
//  IMDB Clone
//
//  Created by Raj Dhakate on 01/05/21.
//

import UIKit

class DetailViewController: UIViewController {

    var movieDetailVM: MovieDetailViewModel?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        titleLabel.textColor = .darkGray
        
        dateLabel.font = .systemFont(ofSize: 14)
        dateLabel.textColor = .lightGray
        
        overviewLabel.font = .systemFont(ofSize: 16)
        overviewLabel.textColor = .darkGray
        
        ratingLabel.font = .systemFont(ofSize: 18)
        ratingLabel.textColor = .darkGray
        ratingLabel.addBorder()
        
        popularityLabel.font = .systemFont(ofSize: 18)
        popularityLabel.textColor = .darkGray
        popularityLabel.addBorder()
        
        updateViews()
    }
    
    private func updateViews() {
        if let movieDetailVM = movieDetailVM {
            titleLabel.text = movieDetailVM.title
            dateLabel.text = movieDetailVM.releaseDate
            
            posterImageView.kf.setImage(with: movieDetailVM.posterURL)
            overviewLabel.text = movieDetailVM.overview
            
            ratingLabel.text = movieDetailVM.ratings
            popularityLabel.text = movieDetailVM.popularity
        }
    }
}

extension UIView {
    func addBorder() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
}

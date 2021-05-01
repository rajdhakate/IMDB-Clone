//
//  MovieTableViewCell.swift
//  IMDB Clone
//
//  Created by Raj Dhakate on 01/05/21.
//

import UIKit
import Kingfisher

class MovieTableViewCell: UITableViewCell {
    
    static let cellID = description()
    
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var ratingsLabel: UILabel!
    
    var cellVM: CellViewModel? {
        didSet {
            updateViews()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupViews() {
        // initialize with nil
        titleLabel.text = nil
        dateLabel.text = nil
        ratingsLabel.text = nil
        
        titleLabel.font = .systemFont(ofSize: 16)
        dateLabel.font = .systemFont(ofSize: 14)
        ratingsLabel.font = .systemFont(ofSize: 16)
        
        titleLabel.textColor = .black
        dateLabel.textColor = .gray
        ratingsLabel.textColor = .darkGray
        
        posterImageView.kf.cancelDownloadTask()
    }
    
    private func updateViews() {
        if let cellVM = cellVM {
            titleLabel.text = cellVM.title
            dateLabel.text = cellVM.releaseDate
            ratingsLabel.text = cellVM.rating
            
            posterImageView.kf.cancelDownloadTask()
            
            posterImageView.kf.setImage(with: cellVM.posterURL)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        // initialize nil
        setupViews()
    }
}

//
//  CellViewModel.swift
//  IMDB Clone
//
//  Created by Raj Dhakate on 01/05/21.
//

import Foundation

class CellViewModel {
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    // accessible properties and methods
    var title: String {
        return movie.title
    }
    
    var rating: String {
        return "⭐️ \(movie.vote_average)"
    }
    
    var releaseDate: String {
        return movie.release_date
    }
    
    var posterURL: URL? {
        return URL(string: Constants.baseURL + movie.poster_path)
    }
    
}

//
//  MovieDetailViewModel.swift
//  IMDB Clone
//
//  Created by Raj Dhakate on 01/05/21.
//

import Foundation

class MovieDetailViewModel {
    private var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    var title: String {
        return movie.title
    }
    
    var releaseDate: String {
        return movie.release_date
    }
    
    var overview: String {
        return movie.overview
    }
    
    var posterURL: URL? {
        return URL(string: Constants.baseURL + movie.poster_path)
    }
    
    var ratings: String {
        return "⭐️ \(movie.vote_average)"
    }
    
    var popularity: String {
        return "🔥 \(movie.popularity)"
    }
}

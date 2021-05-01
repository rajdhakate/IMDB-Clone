//
//  Movie.swift
//  IMDB Clone
//
//  Created by Raj Dhakate on 01/05/21.
//

import Foundation

struct Movie: Codable {
    let poster_path: String
    let title: String
    let release_date: String
    let vote_average: Float
    let overview: String
    let popularity: Float
}

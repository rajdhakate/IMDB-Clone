//
//  ListingViewModel.swift
//  IMDB Clone
//
//  Created by Raj Dhakate on 01/05/21.
//

import Foundation

class ListingViewModel {
    
    private var cellVMs: [CellViewModel] = []
    
    var numberOfCells: Int {
        return cellVMs.count
    }
    
    func getCellVMAt(_ indexPath: IndexPath) -> CellViewModel {
        return cellVMs[indexPath.row]
    }
    
    func fetchMovies(completion: ((Bool, Error?) -> Void)?) {
        if let path = Bundle.main.path(forResource: "movies", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let movies = try JSONDecoder().decode([Movie].self, from: data)
                for movie in movies {
                    cellVMs.append(CellViewModel(movie: movie))
                }
                completion?(true, nil)
            } catch {
                // handle error
                completion?(false, error)
            }
        }
    }
    
    func getDetailVMAt(_ indexPath: IndexPath) -> MovieDetailViewModel {
        return MovieDetailViewModel(movie: getCellVMAt(indexPath).movie)
    }
}

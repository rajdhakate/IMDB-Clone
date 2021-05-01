//
//  ViewController.swift
//  IMDB Clone
//
//  Created by Raj Dhakate on 01/05/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var listingVM = ListingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movies"
        setupViews()
        loadData()
    }
    
    private func setupViews() {
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: MovieTableViewCell.cellID)
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func loadData() {
        listingVM.fetchMovies { [weak self] (success, error) in
            // handle error
            if let error = error {
                // update UI to show error
                print(error.localizedDescription)
            } else {
                if success {
                    self?.tableView.reloadData()
                }
            }
        }
    }
    
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listingVM.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.cellID, for: indexPath) as? MovieTableViewCell else {
            fatalError("\(MovieTableViewCell.cellID) not found")
        }
        cell.cellVM = listingVM.getCellVMAt(indexPath)
        return cell
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailVM = listingVM.getDetailVMAt(indexPath)
        
        let detailVC = DetailViewController()
        detailVC.movieDetailVM = detailVM
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}


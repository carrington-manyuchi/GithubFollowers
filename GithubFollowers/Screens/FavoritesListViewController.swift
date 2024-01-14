//
//  FavoritesListViewController.swift
//  GithubFollowers
//
//  Created by DA MAC M1 157 on 2024/01/05.
//

import UIKit

class FavoritesListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        PersistenceManager.retrieveFavorites { result in
            switch result {
                
            case .success(let favorites):
                print(favorites)
            case .failure(let error):
                break
            }
        }  
    }
}

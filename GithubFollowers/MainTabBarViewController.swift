//
//  MainTabBarViewController.swift
//  GithubFollowers
//
//  Created by DA MAC M1 157 on 2024/01/05.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    func setupTabs() {
        
        let favorites = UINavigationController(rootViewController: FavoritesListViewController())
        let search = UINavigationController(rootViewController: SearchViewController())
        
        favorites.title = "Favorites"
        search.title = "Search"
        
        favorites.tabBarItem.title = "Favorites"
        search.tabBarItem.title = "Search"
        
        favorites.tabBarItem.image = UIImage(systemName: "star")
        search.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        favorites.tabBarItem.selectedImage = UIImage(systemName: "star.fill")
        search.tabBarItem.selectedImage = UIImage(systemName: "magnifyingglass.fill")
                
        UITabBar.appearance().tintColor = .systemGreen
        UITabBar.appearance().backgroundColor = .systemBackground
        
        setViewControllers([favorites, search], animated: true)
    }

}

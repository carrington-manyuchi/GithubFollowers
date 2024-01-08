//
//  ViewController.swift
//  GithubFollowers
//
//  Created by DA MAC M1 157 on 2024/01/03.
//

import UIKit

class FollowersListViewController: UIViewController {
    
    
    var username: String! 

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        NetworkManager.shared.getFollwers(for: username, page: 1) { (followers, errorMessage) in
            guard let followers = followers else {
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happened", message: "Error", buttonTitle: "Ok")
                return
            }
            
            print("Followers.count = \(followers.count)")
            print(followers
            )
        }
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}


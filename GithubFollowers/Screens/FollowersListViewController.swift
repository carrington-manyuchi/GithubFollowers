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
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }


}


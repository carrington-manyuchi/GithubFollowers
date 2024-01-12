//
//  UserInfoViewController.swift
//  GithubFollowers
//
//  Created by DA MAC M1 157 on 2024/01/11.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem  = doneButton

        NetworkManager.shared.getFollwers(for: username) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let user):
                print(user)
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Somthing went wrong", message: "No user found", buttonTitle: "Ok")
            }
        }
    }
    
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
}

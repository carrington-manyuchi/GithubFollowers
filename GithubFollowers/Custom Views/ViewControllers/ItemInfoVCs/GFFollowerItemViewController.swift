//
//  GFFollowerViewController.swift
//  GithubFollowers
//
//  Created by DA MAC M1 157 on 2024/01/12.
//

import UIKit

class GFFollowerItemViewController: GFItemInfoViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGetFollwers(for: user)
    }
    
    
}

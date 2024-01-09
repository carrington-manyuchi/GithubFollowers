//
//  UIHelper.swift
//  GithubFollowers
//
//  Created by DA MAC M1 157 on 2024/01/09.
//

import UIKit

struct UIHelper {
    
    static func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSPacing: CGFloat = 10
        let availableWidth = width - (padding * 2) - (minimumItemSPacing * 2)
        let itemWidth =  availableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        return flowLayout
    }
    
}

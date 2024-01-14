//
//  UserInfoViewController.swift
//  GithubFollowers
//
//  Created by DA MAC M1 157 on 2024/01/11.
//

import UIKit

protocol UserInfoVCDelegate: AnyObject {
    func didTapGitHubProfile(for user: User)
    func didTapGetFollwers(for user: User)
}

class UserInfoViewController: UIViewController {
    
    let headerView = UIView()
    let itemViewOne = UIView()
    let itemViewTwo = UIView()
    let dateLabel = GFBodyLabel(textAlignment: .center)
    var username: String!
    weak var delegate: FollowerListVCDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureConstraints()
        getUserInfo()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem  = doneButton
    }
    
    func getUserInfo() {
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let user):
                //print(user)
                DispatchQueue.main.async { self.configureUIElements(with: user)  }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Somthing went wrong", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
    
    func configureUIElements(with user: User) {
        let repoItemVC = GFRepoItemViewController(user: user)
        repoItemVC.delegate = self
        
        let followerItemVC = GFFollowerItemViewController(user: user)
        followerItemVC.delegate = self
        self.add(childVC: repoItemVC, to: self.itemViewOne)
        self.add(childVC: followerItemVC, to: self.itemViewTwo)
        self.add(childVC: GFUserInfoHeaderViewController(user: user), to: self.headerView)
        self.dateLabel.text = "GiHhub Since  \(user.createdAt.convertToDisplayFormat())"
        
//        self.add(childVC: GFRepoItemViewController(user: user), to: self.itemViewOne)
//        self.add(childVC: GFFollowerViewController(user: user), to: self.itemViewTwo)
//        self.add(childVC: GFUserInfoHeaderViewController(user: user), to: self.headerView)
//        self.dateLabel.text = "GiHhub Since  \(user.createdAt.convertToDisplayFormat())"
    }
    
    func add(childVC: UIViewController, to containerview: UIView) {
        addChild(childVC)
        containerview.addSubview(childVC.view)
        childVC.view.frame = containerview.bounds
        childVC.didMove(toParent: self)
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
    func configureConstraints() {
        
        /** anoother way of adding subviews
         ** subViews = ['headerView, itemViewOne, itemViewTwo, dateLabel ]
         
         ** for itemView in itemViews {
         **        view.addSubview(itemView)
         *     itemView.translatesAutoresizingMaskIntoConstraints = false
         **
         **   NSLayoutConstraint.activate([
         **             itemView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         **             itemView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         **        ])
        
        **/
        view.addSubview(headerView)
        view.addSubview(itemViewOne)
        view.addSubview(itemViewTwo)
        view.addSubview(dateLabel)
        
        //itemViewOne.backgroundColor = .systemRed
        
        itemViewTwo.backgroundColor = .systemGreen
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        itemViewOne.translatesAutoresizingMaskIntoConstraints = false
        itemViewTwo.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 20
        let itemHeight: CGFloat = 140
        
        let headerViewConstraints = [
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 180)
        ]
        
        let itemViewOneConstraints = [
            itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            itemViewOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            itemViewOne.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            itemViewOne.heightAnchor.constraint(equalToConstant: itemHeight)
        ]
        
        let itemViewTwoConstraints = [
            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: padding),
            itemViewTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            itemViewTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: itemHeight)
        ]
        
        let dateLabelConstraints = [
            dateLabel.topAnchor.constraint(equalTo: itemViewTwo.bottomAnchor, constant: padding),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            dateLabel.heightAnchor.constraint(equalToConstant: 18)
        ]
        
        NSLayoutConstraint.activate(headerViewConstraints)
        NSLayoutConstraint.activate(itemViewOneConstraints)
        NSLayoutConstraint.activate(itemViewTwoConstraints)
        NSLayoutConstraint.activate(dateLabelConstraints)
    }
   
}

extension UserInfoViewController: UserInfoVCDelegate {
    
    func didTapGitHubProfile(for user: User) {
        // SHow safari view controller
        print("My button was tapped!!!")
        guard let url  = URL(string: user.htmlUrl) else {
            presentGFAlertOnMainThread(title: "Invalid URL", message: "The url attached to this user is invalid.", buttonTitle: "ok")
            return
        }
        presentSafariVC(with: url)
    }
    
    func didTapGetFollwers(for user: User) {
        //dismissVC
        // tell follower list screen the neew user
        
        guard  user.followers != 0 else {
            presentGFAlertOnMainThread(title: "No followers", message: "This user has no followers", buttonTitle: "Ok")
            return
        }
        delegate.didRequestFollowers(for: user.login)
        dismissVC()
    }
    
    
}

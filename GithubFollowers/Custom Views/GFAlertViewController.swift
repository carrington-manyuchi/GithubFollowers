//
//  GFAlertViewController.swift
//  GithubFollowers
//
//  Created by DA MAC M1 157 on 2024/01/07.
//

import UIKit

class GFAlertViewController: UIViewController {
        
    let containerView = GFContainerView()
    let titleLabel = GFTitleLabel(textAlignment: .center, fontSize: 20)
    let messageLabel = GFBodyLabel(textAlignment: .center)
    let actionButton = GFButton(backgroundColor: .systemPink, title: "Ok")
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    let padding: CGFloat = 20
    
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = title
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureViews()
    }
    
    private func configureUI() {
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        titleLabel.text = alertTitle ?? "Something went wrong"
        messageLabel.text = message ?? "Unable to complete request"
        messageLabel.numberOfLines = 4
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        actionButton.setTitle(buttonTitle ?? "Ok", for: .normal)
    }
    
    @objc  func dismissVC() {
        dismiss(animated: true)
    }
    
    private func configureViews() {
        view.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(messageLabel)
        containerView.addSubview(actionButton)
        configureConstraints()
    }
    
    private func configureConstraints() {
        let containerViewConstraints = [
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220)
        ]
        
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 28),
        ]
        
        let actionButtonConstraints = [
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ]
        
        let messageLabelConstraints = [
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
        ]
        
        NSLayoutConstraint.activate(containerViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(actionButtonConstraints)
        NSLayoutConstraint.activate(messageLabelConstraints)
    }

}

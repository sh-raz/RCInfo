//
//  RCAlertViewController.swift
//  RCInfo
//
//  Created by shilani on 23/03/2024.
//

import UIKit

class RCAlertViewController: UIViewController {
    
    let containerView = RCAlertContainerView()
    let titleLabel = RCTitleLabel(textAlignment: .center, fontSize: 24)
    let messageLabel = RCBodyLabel(textAlignment: .center)
    let button = RCButton(backgroundColor: .systemPink, title: "OK")
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    
    init(title: String, message: String, buttonTitle: String){
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
        view.backgroundColor = .black.withAlphaComponent(0.75)
        configureUI()
        setUIElements()
    }
    
    func configureUI(){
        view.addSubview(containerView)
        view.addSubview(titleLabel)
        view.addSubview(messageLabel)
        view.addSubview(button)

        
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 28),
            
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            messageLabel.heightAnchor.constraint(equalToConstant: 60),
            
            button.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            button.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 50)
            
            
        ])
    }
    
    
    
    func setUIElements(){
        titleLabel.text = alertTitle
        messageLabel.text = message ?? "Unable to complete request"
        messageLabel.numberOfLines  = 4
        button.setTitle(buttonTitle, for: .normal)
        button.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
    }
    
    
    @objc func dismissVC(){
        dismiss(animated: true)
    }

}

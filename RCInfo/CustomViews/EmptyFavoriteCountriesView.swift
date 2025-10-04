//
//  EmptyFavoriteCountriesView.swift
//  RCInfo
//
//  Created by shilani on 30/03/2024.
//

import UIKit

class EmptyFavoriteCountriesView: UIView {

    let messageLabel = RCTitleLabel(textAlignment: .center, fontSize: 25)
    let logoImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(message: String){
        super.init(frame: .zero)
        messageLabel.text = message
        configure()
    }
    
    func configure(){
        self.addSubview(messageLabel)
        self.addSubview(logoImageView)
        
        logoImageView.image = UIImage(systemName: "house.and.flag.fill")
        logoImageView.tintColor = UIColor(resource: .darkBlue)
        logoImageView.layer.opacity = 0.5
        messageLabel.numberOfLines = 2
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor,constant: -80),
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -30),
            messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 30),
            messageLabel.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -170),
            logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 80),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
    }

}

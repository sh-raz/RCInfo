//
//  CountryCollectionViewCell.swift
//  RCInfo
//
//  Created by shilani on 16/03/2024.
//

import UIKit

class CountryCollectionViewCell: UICollectionViewCell {
    static let reuseId = "CountryCell"
    var flagImageView = FlagImageView(frame:.zero)
    var nameLabel = RCTitleLabel(textAlignment: .center, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
   private func configure(){
       contentView.addSubview(flagImageView)
       contentView.addSubview(nameLabel)
       let padding: CGFloat = 10
       
        NSLayoutConstraint.activate([
            flagImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            flagImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            flagImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            flagImageView.heightAnchor.constraint(equalTo: flagImageView.widthAnchor, constant: -25),
            
            nameLabel.topAnchor.constraint(equalTo: flagImageView.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            nameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func set(urlString: String, name: String){
        self.flagImageView.downloadImage(from: urlString)
        self.nameLabel.text = name
    }
}

//
//  FavoritesTableViewCell.swift
//  RCInfo
//
//  Created by shilani on 30/03/2024.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {
    let reuseId = "FavoriteCell"
    let flagImageView = FlagImageView(frame: .zero)
    var nameLabel = RCTitleLabel(textAlignment: .left, fontSize: 20)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(){
        addSubview(flagImageView)
        addSubview(nameLabel)
        accessoryType = .disclosureIndicator
        let padding : CGFloat = 12
        
        NSLayoutConstraint.activate([
            flagImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            flagImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            flagImageView.widthAnchor.constraint(equalToConstant: 70),
            flagImageView.heightAnchor.constraint(equalToConstant: 70),
            
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: flagImageView.trailingAnchor, constant: padding),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            nameLabel.heightAnchor.constraint(equalToConstant: 60)
        
        ])
    }
    
    
    func set(with favorite: Country){
        self.flagImageView.downloadImage(from: favorite.flags.png)
        self.nameLabel.text = favorite.name.common
    }

}

//
//  FlagImageView.swift
//  RCInfo
//
//  Created by shilani on 17/03/2024.
//

import UIKit

class FlagImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        clipsToBounds = true
        image =  UIImage(named: "flag.square.fill")
        image?.withTintColor(.secondaryLabel)
    }
    
    func downloadImage(from urlString: String){
            NetworkManager.shared.downloadImage(fromUrl: urlString) { [weak self] image in
                guard let self = self else { return }
                DispatchQueue.main.async { self.image = image }
            }
        }
}

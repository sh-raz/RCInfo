//
//  RCButton.swift
//  RCInfo
//
//  Created by shilani on 14/03/2024.
//

import UIKit

class RCButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title: String){
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }

    
    func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 15
        titleLabel?.textAlignment = .center
    }
    
    func set(backgroundColor: UIColor, title: String){
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
    }

}

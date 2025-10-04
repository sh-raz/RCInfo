//
//  RCTextField.swift
//  RCInfo
//
//  Created by shilani on 14/03/2024.
//

import UIKit

class RCTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 15
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray.cgColor
        
        placeholder = "Enter a country name"
        textColor = .label
        tintColor = .label
    
        backgroundColor = .secondarySystemBackground
        textAlignment = .center
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        
        returnKeyType = .go
        font = UIFont.preferredFont(forTextStyle: .title2)
    }
}

//
//  RCBodyLabel.swift
//  RCInfo
//
//  Created by shilani on 18/03/2024.
//

import UIKit

class RCBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment){
        super.init(frame: .zero)
        self.textAlignment  = textAlignment
        configure()
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont.preferredFont(forTextStyle: .body)
        textColor = .secondaryLabel
        lineBreakMode = .byWordWrapping
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.8
    }
}

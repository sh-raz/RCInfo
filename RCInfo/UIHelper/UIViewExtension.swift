//
//  UIViewExtension.swift
//  RCInfo
//
//  Created by shilani on 21/03/2024.
//

import UIKit
 
extension UIView{
    func pinToEdges(of superview: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                self.topAnchor.constraint(equalTo: superview.topAnchor),
                self.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
                self.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
                self.bottomAnchor.constraint(equalTo: superview.bottomAnchor)
            ])
        
       
    }
}


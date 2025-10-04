//
//  UIViewControllerExtension.swift
//  RCInfo
//
//  Created by shilani on 23/03/2024.
//

import UIKit
import SafariServices

extension UIViewController {
    func presentAlertControllerOnTheMainThread(title:String, message: String, buttonTitle: String){
        let alertVC = RCAlertViewController(title: title, message: message, buttonTitle: buttonTitle)
        alertVC.modalPresentationStyle = .overFullScreen
        alertVC.modalTransitionStyle = .crossDissolve
        present(alertVC, animated: true)
    }
    
    
    
    func presentSafariVC(for url: URL){
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .systemGreen
        present(safariVC, animated: true)
    }
}

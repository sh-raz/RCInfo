//
//  RCDataLoadingViewController.swift
//  RCInfo
//
//  Created by shilani on 30/03/2024.
//

import UIKit

class RCDataLoadingViewController: UIViewController {
    var containerView: UIView!
    
    func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        UIView.animate(withDuration: 0.25) {
            self.containerView.alpha = 0.8
        }
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
        activityIndicator.startAnimating()
    }
    
    func dismissLoadingView() {
        DispatchQueue.main.async {
            self.containerView.removeFromSuperview()
            self.containerView = nil
        }
    }
    
    
    func showEmptyFavoriteCountriesView(with message: String, in view: UIView){
        let emptyFavoritesView = EmptyFavoriteCountriesView(message: message)
        emptyFavoritesView.frame = view.bounds
        view.addSubview(emptyFavoritesView)
    }
      

}

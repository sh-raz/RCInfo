//
//  RCInfoDetailsVC.swift
//  RCInfo
//
//  Created by shilani on 19/03/2024.
//

import UIKit

class RCInfoDetailsVC: UIViewController {
    
    var infoViewOne = RCInfoDetailView()
    var infoViewTwo = RCInfoDetailView()
    var stackView = UIStackView()
    var button = RCButton()
    
    var country: Country!
    
    init(country: Country){
        super.init(nibName: nil, bundle: nil)
        self.country = country
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 16
        configureStackView()
        configure()
        configureButton()
    }
    
    
    func configureStackView() {
        stackView.axis = .horizontal
        stackView.frame.size.width = view.frame.size.width - 40
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.addArrangedSubview(infoViewOne)
        stackView.addArrangedSubview(infoViewTwo)
    }
    
    
    private func configure() {
        view.addSubview(stackView)
        view.addSubview(button)
        let padding: CGFloat = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        

        configureTrailings(for: stackView, superView: view, padding: -padding)
        configureTrailings(for: button, superView: view, padding: -padding)
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
                stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23),
                //stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
                stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                stackView.heightAnchor.constraint(equalToConstant: 60),
                
                button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
                button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                //button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
                button.heightAnchor.constraint(equalToConstant: 37)
             ])
    }
    
    
    private func configureTrailings(for view: UIView, superView: UIView, padding: CGFloat) {
        let trailing = view.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: padding)
        trailing.priority = UILayoutPriority(750)
    }
    
    
    
    
    
    private func configureButton() {
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed() {}
    
}

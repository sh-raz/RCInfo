//
//  HeaderInfoViewController.swift
//  RCInfo
//
//  Created by shilani on 20/03/2024.
//

import UIKit

class HeaderInfoViewController: UIViewController {
    
    let flagImageView = FlagImageView(frame: .zero)
    let countryNameLabel = RCTitleLabel(textAlignment: .left, fontSize: 34)
    let capitalLabel = RCSecondaryLabel(textAlignment: .left, textSize: 18)
    let symbolImageView = UIImageView()
    let continentLabel = RCSecondaryLabel(textAlignment: .left, textSize: 18)
    
    var country: Country!
    
    init(country: Country) {
        super.init(nibName: nil, bundle: nil)
        self.country = country
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setUIElements(on: country)
    }
    
    func configureUI() {
        symbolImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(flagImageView)
        view.addSubview(countryNameLabel)
        view.addSubview(capitalLabel)
        view.addSubview(symbolImageView)
        view.addSubview(continentLabel)
        
        continentLabel.numberOfLines = 1
        
        NSLayoutConstraint.activate([
            flagImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            flagImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            flagImageView.widthAnchor.constraint(equalToConstant: 90),
            flagImageView.heightAnchor.constraint(equalToConstant: 90),
            
            countryNameLabel.topAnchor.constraint(equalTo: flagImageView.topAnchor),
            countryNameLabel.leadingAnchor.constraint(equalTo: flagImageView.trailingAnchor, constant: 10),
            //countryNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            countryNameLabel.heightAnchor.constraint(equalToConstant: 38),
            
            capitalLabel.topAnchor.constraint(equalTo: countryNameLabel.bottomAnchor,constant: 10),
            capitalLabel.leadingAnchor.constraint(equalTo: countryNameLabel.leadingAnchor),
            //capitalLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            capitalLabel.heightAnchor.constraint(equalToConstant: 30),
            
            symbolImageView.topAnchor.constraint(equalTo: flagImageView.bottomAnchor,constant: 10),
            symbolImageView.leadingAnchor.constraint(equalTo: flagImageView.leadingAnchor),
            symbolImageView.heightAnchor.constraint(equalToConstant: 30),
            symbolImageView.widthAnchor.constraint(equalToConstant: 30),
            
            continentLabel.topAnchor.constraint(equalTo: symbolImageView.topAnchor),
            continentLabel.leadingAnchor.constraint(equalTo: symbolImageView.trailingAnchor, constant: 5),
            //continentLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            continentLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    
    func setUIElements(on country: Country) {
         NetworkManager.shared.downloadImage(fromUrl: country.flags.png, completed: { [weak self] image in
             guard let self = self else { return }
                 DispatchQueue.main.async {
                     self.flagImageView.image = image
             }
        })
        countryNameLabel.text = country.name.common
        if let capital = country.capital{
            capitalLabel.text = capital[0]
        }
//        if let currencies = country.currencies {
//            //print("key \(currencies)")
//            //print(value(forKey: currencies.currency?.keys))
//        }
        symbolImageView.image = UIImage(systemName: "pencil.circle.fill" )
        symbolImageView.tintColor = .secondaryLabel
        continentLabel.text = country.continents[0]
    }

}

//
//  RCInfoDetailView.swift
//  RCInfo
//
//  Created by shilani on 18/03/2024.
//

import UIKit

enum DetailInfoViewType {
    case population, timezones, languages, region, subregion, currencies
}


class RCInfoDetailView: UIView {
    
    let symbolImageView = UIImageView()
    let titleLabel = RCTitleLabel(textAlignment: .left, fontSize: 14)
    let detailLabel = RCTitleLabel(textAlignment: .center, fontSize: 14)


    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure(){
        self.addSubview(symbolImageView)
        self.addSubview(titleLabel)
        self.addSubview(detailLabel)
        
        symbolImageView.contentMode = .scaleAspectFill
        symbolImageView.tintColor = .label
        symbolImageView.translatesAutoresizingMaskIntoConstraints = false
        
        configureTrailings(for: titleLabel, superView: self)
        configureTrailings(for: detailLabel, superView: self)
        NSLayoutConstraint.activate([
            symbolImageView.topAnchor.constraint(equalTo: self.topAnchor),
            symbolImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            symbolImageView.widthAnchor.constraint(equalToConstant: 23),
            symbolImageView.heightAnchor.constraint(equalToConstant: 23),
            
            titleLabel.centerYAnchor.constraint(equalTo: symbolImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: symbolImageView.trailingAnchor, constant: 6),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            detailLabel.topAnchor.constraint(equalTo: symbolImageView.bottomAnchor, constant: 5),
            detailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            detailLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            detailLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            detailLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    
    
    private func configureTrailings(for view: UIView, superView: UIView) {
        let trailing = view.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: 0)
        trailing.priority = UILayoutPriority(999)
    }
    
   
    func set(detailTitle: DetailInfoViewType, with detail: String){
        print("seeeeeetttttttttttttt")
        switch detailTitle {
        case .population:
            symbolImageView.image = UIImage(systemName: "person.3.fill" )
            titleLabel.text = "Population"
            print(detailTitle)
        case .timezones:
            symbolImageView.image = UIImage(systemName: "clock.arrow.2.circlepath")
            titleLabel.text = "Timezone"
            print(detailTitle)
        case .languages:
            symbolImageView.image = UIImage(systemName: "person.line.dotted.person.fill")
            titleLabel.text = "Language"
        case .region:
            symbolImageView.image = UIImage(systemName: "map.circle.fill")
            titleLabel.text = "Region"
            
        case .subregion:
            symbolImageView.image = UIImage(systemName: "map.circle")
            titleLabel.text = "Subregion"
            
        case .currencies:
            symbolImageView.image = UIImage(systemName: "dollarsign.arrow.circlepath")
            titleLabel.text = "Currency"
        }
        detailLabel.text = String(detail)
    }
        
    
  

}

//
//  RCPopulationDetailsVC.swift
//  RCInfo
//
//  Created by shilani on 19/03/2024.
//

import UIKit

protocol RCPopulationVCDelagate{
    func didTapReadMoreButton(country: Country)
}


class RCPopulationDetailsVC: RCInfoDetailsVC {
    
    var delegate : RCPopulationVCDelagate?
    
    init(country: Country, delegate: RCPopulationVCDelagate){
        super.init(country: country)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
            configure()
     }
    
    
    private func configure() {
        infoViewOne.set(detailTitle: .region, with: country.region)
        infoViewTwo.set(detailTitle: .subregion, with: country.subregion ?? "No subregion")
        button.set(backgroundColor: UIColor(resource: .darkBlue), title: "Read on Wikipedia")
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    }
    
    override func buttonPressed() {
        delegate?.didTapReadMoreButton(country: country)
    }
}

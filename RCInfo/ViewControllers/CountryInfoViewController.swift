//
//  CountryInfoViewController.swift
//  RCInfo
//
//  Created by shilani on 20/03/2024.
//

import UIKit

class CountryInfoViewController: UIViewController {

    let headerView  = UIView()
    let detailViewOne = UIView()
    let detailViewTwo = UIView()
    let contentView = UIView()
    let scrollView = UIScrollView()
    
    var countryName: String? {
        didSet{
            getCountryInfo(countryName: countryName!)
        }
    }
    
    var country: Country? {
        didSet{
            configureUIElements(on: country!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        configureScrollView()
        layoutUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    func configureViewController(){
        view.backgroundColor = .systemBackground
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.leftBarButtonItem = doneBarButton
        let addTOFavoritesBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addToFavorites))
        navigationItem.rightBarButtonItem = addTOFavoritesBarButton
    }
    
    
    
    @objc func addToFavorites(){
        if let country = country {
            PersistenceManager.updateWith(favorite: country, actionType: .add) { error in
                if let error = error {
                    self.presentAlertControllerOnTheMainThread(title: "error", message: error.rawValue, buttonTitle: "OK")
                    return
                }
            }
            //Todo: show message to user
            print("data saved")
        }
    }
    
    
    
    
    func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.pinToEdges(of: view)
        contentView.pinToEdges(of: scrollView)
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 600)
        ])
    }
    
    
    
    func layoutUI() {
        let padding: CGFloat    = 20
        let itemHeight: CGFloat = 140
        
        let itemViews = [headerView, detailViewOne]
        
        for itemView in itemViews {
            contentView.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
            ])
        }
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 150),
            
            detailViewOne.topAnchor.constraint(equalTo:  headerView.bottomAnchor, constant: padding),
            detailViewOne.heightAnchor.constraint(equalToConstant: itemHeight),
        ])
    }
    
    
    
    func configureUIElements(on country: Country) {
        self.add(childVC: HeaderInfoViewController(country: country), to: self.headerView)
        self.add(childVC: RCPopulationDetailsVC(country: country, delegate: self), to: self.detailViewOne)
    }
    
    
    func getCountryInfo(countryName: String){
        NetworkManager.shared.getCountryInfo(for: countryName) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let countries):
                DispatchQueue.main.async {
                    self.configureUIElements(on: countries[0])
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    
    
    @objc func dismissVC() {
        //dismiss(animated: true)
        navigationController?.popViewController(animated: true)
    }
    

}


extension CountryInfoViewController: RCPopulationVCDelagate {
    
    func didTapReadMoreButton(country: Country) {
        let string = "https://en.wikipedia.org/wiki/\(country.name.common)"
        guard let urlString = string.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: urlString) else {
             presentAlertControllerOnTheMainThread(title: "Invalid URL", message: "It has an wrong URL.", buttonTitle: "OK")
            return
        }
        presentSafariVC(for: url)
    }
}

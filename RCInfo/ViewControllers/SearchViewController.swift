//
//  SearchViewController.swift
//  RCInfo
//
//  Created by shilani on 14/03/2024.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate {
    
    let logoImageView = UIImageView(image: UIImage(named: "world"))
    let searchTextField = RCTextField()
    let button = RCButton(backgroundColor: UIColor(resource: .darkBlue), title: "Search")
    var isTextfieldEntered: Bool { return !searchTextField.text!.isEmpty }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        searchTextField.delegate = self
        configureLogoImageView()
        configureTextfield()
        configureButton()
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchTextField.text = ""
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    func configureLogoImageView(){
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -180),
            logoImageView.widthAnchor.constraint(equalToConstant: 300),
            logoImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    
    func configureTextfield(){
        view.addSubview(searchTextField)
        NSLayoutConstraint.activate([
            searchTextField.heightAnchor.constraint(equalToConstant: 50),
            searchTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 80),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
    
    
    func configureButton(){
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -140),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        button.addTarget(self, action: #selector(searchForCountry), for: .touchUpInside)
    }
    
    
    
    @objc func searchForCountry(){
        searchTextField.resignFirstResponder()
        guard isTextfieldEntered else {
            presentAlertControllerOnTheMainThread(title: "Empty Search Field", message: "Please Enter a Country Name", buttonTitle: "Ok")
            return
        }
        let countryVC = CountryInfoViewController()
        countryVC.countryName = searchTextField.text
        navigationController?.pushViewController(countryVC, animated: true)       
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       searchForCountry()
        return true
    }
 
    
}




//
//  CountriesViewController.swift
//  RCInfo
//
//  Created by shilani on 14/03/2024.
//

import UIKit

class CountriesViewController: UIViewController {
    
    var countries: [Country] = []
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Country>!
    enum Section { case main }
    
    var filteredCountries: [Country] = []
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        configureCollectionView()
        getCountriesInfo()
        configureDataSource()
        configureSearchController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func configureCollectionView(){
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.configureCollectionViewFlowLayout(in: view))
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.register(CountryCollectionViewCell.self, forCellWithReuseIdentifier: "CountryCell")
    }
    
    
    func getCountriesInfo(){
        NetworkManager.shared.getAllCountriesInfo { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                print(error)
            case .success(let countries):
                self.updateUI(with: countries)
            }
        }
    }
    
    
    func updateUI(with countries: [Country]){
        self.countries.append(contentsOf: countries)
        if self.countries.isEmpty {
            return
        }
        self.updateData(with: self.countries)
    }
    
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Country>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, country) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CountryCell", for: indexPath) as! CountryCollectionViewCell
            let imageUrlString = country.flags.png
            let countryName = country.name.common
            cell.set(urlString: imageUrlString, name: countryName)
            return cell
        })
    }
    
    
    func updateData(with countries: [Country]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Country>()
        snapshot.appendSections([.main])
        snapshot.appendItems(countries)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true) }
    }
    
    func configureSearchController(){
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search a country name"
        navigationItem.searchController = searchController
        
    }
}






extension CountriesViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let activeArray     = isSearching ? filteredCountries : countries
        let country        = activeArray[indexPath.item]
        
        let countryVC = CountryInfoViewController()
        countryVC.country = country
        navigationController?.pushViewController(countryVC, animated: true)
    }
}

extension CountriesViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchPhrase = searchController.searchBar.text, !searchPhrase.isEmpty else {
            filteredCountries.removeAll()
            isSearching = false
            updateData(with: countries)
            return
        }
        isSearching = true
        filteredCountries = countries.filter {$0.name.common.lowercased().contains(searchPhrase.lowercased()) }
        updateData(with: filteredCountries)
    }
}

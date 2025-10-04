//
//  FavoritesViewController.swift
//  RCInfo
//
//  Created by shilani on 14/03/2024.
//

import UIKit

class FavoritesViewController: RCDataLoadingViewController, UITableViewDelegate, UITableViewDataSource {
    
    var favorites: [Country] = []
    let favoritesTable = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        getFavorites()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func configureViewController(){
        view.backgroundColor = .systemBackground
        title = "Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureTableView(){
        view.addSubview(favoritesTable)
        favoritesTable.frame = view.bounds
        favoritesTable.rowHeight = 90
        favoritesTable.delegate = self
        favoritesTable.dataSource = self
        favoritesTable.register(FavoritesTableViewCell.self, forCellReuseIdentifier: "FavoriteCell")
    }
    
    
    func getFavorites(){
        PersistenceManager.retrieveFavorites { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let countries):
                self.updateUIWithData(favorites: countries)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func updateUIWithData(favorites: [Country]){
        if favorites.isEmpty {
            showEmptyFavoriteCountriesView(with: "You do not have a favorite country so far!", in: view)
            //self.showEmptyStateView(with: "No Favorites?\nAdd one on the follower screen.", in: self.view)
        } else  {
            self.favorites = favorites
            DispatchQueue.main.async {
                self.favoritesTable.reloadData()
                self.view.bringSubviewToFront(self.favoritesTable)
            }
        }
    }
    
    
    
    
    
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell") as! FavoritesTableViewCell
        let favorite = favorites[indexPath.row]
        cell.set(with: favorite)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favorite = favorites[indexPath.row]
        let countryInfoVC = CountryInfoViewController()
        countryInfoVC.country = favorite
        navigationController?.pushViewController(countryInfoVC, animated: true)
    }
        
    
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            guard editingStyle == .delete else { return }
            PersistenceManager.updateWith(favorite: favorites[indexPath.row], actionType: .remove) { rcError in
                guard let error = rcError else {
                    self.favorites.remove(at: indexPath.row)
                    self.favoritesTable.deleteRows(at: [indexPath], with: .left)
                    return
                }
                self.presentAlertControllerOnTheMainThread(title: "Error Deleting", message: error.rawValue, buttonTitle: "OK")
            }
        }
        
        
    }


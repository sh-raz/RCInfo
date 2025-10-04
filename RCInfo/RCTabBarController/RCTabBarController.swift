//
//  RCTabBarController.swift
//  RCInfo
//
//  Created by shilani on 14/03/2024.
//

import UIKit

class RCTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = UIColor(resource: .darkBlue)
        viewControllers = [createSearchNC(), createCountriesNC(), createFavoritesNC()]
    }
    
    func createSearchNC() -> UINavigationController {
        let searchVC = SearchViewController()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        return UINavigationController(rootViewController: searchVC)
    }
    
    func createCountriesNC() -> UINavigationController {
        let countriesVC = CountriesViewController()
        countriesVC.title = "Countries"
        countriesVC.tabBarItem = UITabBarItem(title: "Countries", image: UIImage(systemName: "globe.europe.africa.fill"), tag: 1)
        return UINavigationController(rootViewController: countriesVC)
    }
    
    func createFavoritesNC() -> UINavigationController {
        let favoritesVC = FavoritesViewController()
        favoritesVC.title = "Favorites"
        favoritesVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
        return UINavigationController(rootViewController: favoritesVC)
    }
    
    func createTabBar() -> UITabBarController{
        let tabBar = UITabBarController()
        
        return tabBar
    }

}

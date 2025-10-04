//
//  PersistenceManager.swift
//  RCInfo
//
//  Created by shilani on 30/03/2024.
//

import Foundation

enum PersistenceManager{
    static let defaults = UserDefaults.standard
    enum ActionTypes { case add, remove}
    enum Keys { static let favorites = "favorites"}
    
    
    static func updateWith(favorite: Country, actionType: ActionTypes, completed: @escaping (RCError?) -> Void) {
        retrieveFavorites { result in
            switch result {
            case .success(var favorites):
                switch actionType{
                case .add:
                    guard !favorites.contains(favorite) else {
                        completed(.alreadyInFavorites)
                        return
                    }
                    favorites.append(favorite)
                
                case .remove:
                    favorites.removeAll { $0.name.common == favorite.name.common }
                }
                completed(save(favorites: favorites))
            
            case .failure(let rcError):
                completed(rcError)
            }
        }
    }
    

    static func retrieveFavorites(completed: @escaping (Result<[Country], RCError>) -> Void){
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }
        do{
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Country].self, from: favoritesData)
            completed(.success(favorites))
        }catch{
            completed(.failure(.unableToFavorite))
        }
    }
    
    
    static func save(favorites: [Country]) -> RCError? {
        do{
            let encoder = JSONEncoder()
            let favoritesData = try encoder.encode(favorites)
            defaults.set(favoritesData, forKey: Keys.favorites)
            return nil
        }catch{
            return .unableToFavorite
        }
    }
    
    
}

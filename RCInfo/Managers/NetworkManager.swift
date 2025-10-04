//
//  NetworkManager.swift
//  RCInfo
//
//  Created by shilani on 15/03/2024.
//


import UIKit

class NetworkManager{
    static let shared = NetworkManager()
    let baseUrl = "https://restcountries.com/v3.1/"
    let fields = "?fields=name,unMember,capital,region,flag,population,timezones,continents,flags"
    
    func getCountryInfo(for country: String, completed: @escaping (Result<[Country], RCError>) -> Void) {
        let stringUrl = "\(baseUrl)name/\(country)"
        print(stringUrl)
        
        guard let url = URL(string: stringUrl) else {
            completed(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                print(error)
                completed(.failure(.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let countries = try decoder.decode([Country].self, from: data)
                completed(.success(countries))
            } catch {
                print(error)
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    
    
    func getAllCountriesInfo(completed: @escaping (Result<[Country], RCError>) -> Void) {
        let stringUrl = "\(baseUrl)all\(fields)"
        
        guard let url = URL(string: stringUrl) else {
            completed(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            print("data here\(data)")
            do {
                let decoder = JSONDecoder()
                let countries = try decoder.decode([Country].self, from: data)
                print(countries)
                completed(.success(countries))
            } catch {
                print(error)
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    
    
    func downloadImage(fromUrl urlString: String, completed: @escaping (UIImage?)-> Void) {
        guard let url = URL(string: urlString) else{
            completed(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let _ = self,
                error == nil,
                let response = response as? HTTPURLResponse, response.statusCode == 200,
                let data = data,
                let image = UIImage(data: data) else {
                    completed(nil)
                    return
                }
            
            completed(image)
            
        }
        task.resume()
    }
    
    
}
    

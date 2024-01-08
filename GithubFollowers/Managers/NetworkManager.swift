//
//  NetworkManager.swift
//  GithubFollowers
//
//  Created by DA MAC M1 157 on 2024/01/07.
//

import Foundation

class NetworkManager {
    // End of part one
    static let shared = NetworkManager()
    let baseURL = "https://api.github.com/users/"
    
    private init() {}
    
    func getFollwers(for username: String, page: Int, completed: @escaping ([Follower]?, String?) -> Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=100=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(nil, "This username created an invalid request. Please try again.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(nil, "Unable to complete your request. Please check your internet connection.")
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, "Invalid response from the server. Please try again.")
                return
            }
            
            guard let data = data else {
                completed(nil, "The data received from the server was invalid. Please try again.")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers, nil)
            } catch {
                completed(nil, "The data received was invalid. Please try again.")
            }
        }
        
        task.resume()
    }
}

//
//   NetworkManager.swift
//  recipesAppMvp
//
//  Created by Alena on 05.09.2024.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchRecipes(for category: String, completion: @escaping ([Recipe]?, Error?) -> Void) {
        guard let url = URL(string: "http://127.0.0.1:8080/recipes/\(category)") else {
            completion(nil, NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"]))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data"]))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let jsonString = String(data: data, encoding: .utf8)
                print("JSON Response: \(jsonString ?? "No Data")")
                
                let recipes = try decoder.decode([Recipe].self, from: data)
                completion(recipes, nil)
            } catch {
                print("Decoding error: \(error)")
                completion(nil, error)
            }
        }
        
        task.resume()
    }
}

//
//  Recipe.swift
//  recipesAppMvp
//
//  Created by Alena on 05.09.2024.
//

import Foundation

struct Recipe: Codable {
    let id: UUID
    let title: String
    let image: String?
    let preparation: Int
    let cooking: Int
    let complexity: Int
    let ingredients: [String]
    let instructions: String
    let сategory: String
}

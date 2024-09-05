//
//  RootProtocols.swift
//  recipesAppMvp
//
//  Created by Alena on 31.07.2024.
//

import Foundation

struct RecipesViewModel {
    let title: String
}

protocol RecipesViewInput: ViewInput {
    func update()
    
}

protocol RecipesViewOutput: AnyObject {
    var viewModel: RecipesViewModel { get }
    
}



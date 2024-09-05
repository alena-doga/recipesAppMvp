//
//  CategoriesProtocols.swift
//  recipesAppMvp
//
//  Created by Alena on 31.07.2024.
//

import Foundation

struct CategoriesViewModel {
    let title: String
}

protocol CategoriesViewInput: ViewInput {
    func update()
    
}

protocol CategoriesViewOutput: AnyObject {
    var viewModel: CategoriesViewModel { get }
    
}

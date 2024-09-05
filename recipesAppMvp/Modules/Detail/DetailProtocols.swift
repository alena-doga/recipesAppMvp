//
//  DetailProtocols.swift
//  recipesAppMvp
//
//  Created by Alena on 05.09.2024.
//

import Foundation

struct DetailViewModel {
    let title: String
}

protocol DetailViewInput: ViewInput {
    func update()
    
}

protocol DetailViewOutput: AnyObject {
    var viewModel: DetailViewModel { get }
    
}

//
//  CategoriesPresenter.swift
//  recipesAppMvp
//
//  Created by Alena on 31.07.2024.
//

import Foundation

class CategoriesPresenter: ViewPresenter, ViewContainer, CategoriesViewOutput {
    func loadData(completion: VoidClosure?) {
        
    }
    
    weak var view: CategoriesViewInput?
    
    let viewModel: CategoriesViewModel
    
    init(viewModel: CategoriesViewModel) {
        self.viewModel = viewModel
    }
    
    func appear() {
        view?.update()
    }
}

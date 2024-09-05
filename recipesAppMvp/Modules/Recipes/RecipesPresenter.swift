//
//  RootPresenter.swift
//  recipesAppMvp
//
//  Created by Alena on 31.07.2024.
//

import Foundation


class RecipesPresenter: ViewPresenter, ViewContainer, RecipesViewOutput {
                
    weak var view: RecipesViewInput?
    
    let viewModel: RecipesViewModel
    
    init(viewModel: RecipesViewModel) {
        self.viewModel = viewModel
    }
    
    func appear() {
        view?.update()
    }
    
    func loadData(completion: VoidClosure?) {
        
    }
    

}

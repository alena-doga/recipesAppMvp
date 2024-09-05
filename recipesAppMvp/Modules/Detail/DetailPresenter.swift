//
//  DetailPresenter.swift
//  recipesAppMvp
//
//  Created by Alena on 05.09.2024.
//

import Foundation

class DetailPresenter: ViewPresenter, ViewContainer, DetailViewOutput {
    func loadData(completion: VoidClosure?) {
        
    }
    
    
    
    weak var view: DetailViewInput?
    
    let viewModel: DetailViewModel
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
    
    func appear() {
        view?.update()
    }
    
    

}

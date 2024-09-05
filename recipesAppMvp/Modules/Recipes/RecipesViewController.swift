//
//  RootViewController.swift
//  recipesAppMvp
//
//  Created by Alena on 31.07.2024.
//

import UIKit

final class RecipesViewController: ViewController, PresenterContainer, RecipesViewInput {
    
    var presenter: RecipesViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        
    }
                
    func update() {
    }
    
    var viewModel: RecipesViewModel {
        return presenter.viewModel
    }
    
}

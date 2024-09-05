//
//  ViewFactory.swift
//  recipesAppMvp
//
//  Created by Alena on 31.07.2024.
//

import Foundation
import UIKit

class ViewFactory: NSObject {
    
    static let shared = ViewFactory()
    
    
    
    func createRecipesScreen(title: String) -> RecipesViewController {
        
        let storyboard = UIStoryboard(storyboard: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: RecipesViewController.self)) as! RecipesViewController
        let viewModel = RecipesViewModel(title: title)
        let presenter = RecipesPresenter(viewModel: viewModel)
        bind(view: controller, presenter: presenter)
        return controller
        
    }
    
    func createCategoriesScreen(title: String) -> CategoriesViewController {
        
        let storyboard = UIStoryboard(storyboard: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: CategoriesViewController.self)) as! CategoriesViewController
        let viewModel = CategoriesViewModel(title: title)
        let presenter = CategoriesPresenter(viewModel: viewModel)
        bind(view: controller, presenter: presenter)
        return controller
        
    }
    
    func createTabBarScreen(title: String) -> UITabBarController {
        let recipes = createRecipesScreen(title: "")
        let categories = createCategoriesScreen(title: "")
        
        let recipesNavController = UINavigationController(rootViewController: recipes)
        let categoriesNavController = UINavigationController(rootViewController: categories)
        
        let controller = UITabBarController()
      
        controller.setViewControllers([recipesNavController, categoriesNavController], animated: true)
        
        controller.tabBar.tintColor = .orange

        if let items = controller.tabBar.items {
                items[0].title = "Рецепти"
                items[0].image = UIImage(systemName: "frying.pan")
                
                items[1].title = "Категорії"
                items[1].image = UIImage(systemName: "text.aligncenter")
            }
        
        
        return controller
        
    }
    
    func createDetailScreen(title: String) -> DetailViewController {
        
        let storyboard = UIStoryboard(storyboard: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: DetailViewController.self)) as! DetailViewController
        let viewModel = DetailViewModel(title: title)
        let presenter = DetailPresenter(viewModel: viewModel)
        bind(view: controller, presenter: presenter)
        return controller
        
    }
}

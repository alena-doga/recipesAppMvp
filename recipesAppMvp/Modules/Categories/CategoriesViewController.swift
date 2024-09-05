//
//  CategoriesViewController.swift
//  recipesAppMvp
//
//  Created by Alena on 31.07.2024.
//

import UIKit



final class CategoriesViewController: ViewController, PresenterContainer, CategoriesViewInput {
    
    @IBOutlet weak var tablView: UITableView!
    
    private let  categories: [String] = [
            "  Каші",
            "  Салати",
            "  Супи",
            "  Мʼясо",
            "  Риба",
            "  Морепродукти",
            "  Выпічка"
        ]
    private let images = [" person", " person.fill"," person", " person.fill"," person", " person.fill","  person"]
    
    var presenter: CategoriesViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tablView.delegate = self
        tablView.dataSource = self
        
        
        configure()
    }
    
    private func configure() {
        
    }
                
    func update() {
    }
    
    var viewModel: CategoriesViewModel {
        return presenter.viewModel
    }
    
}

extension CategoriesViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row]
        cell.imageView?.image = UIImage(systemName: images[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category: String
        switch categories[indexPath.row] {
            case "  Каші":
                category = "porridge"
            case "  Салати":
                category = "salads"
            case "  Супи":
                category = "soups"
            case "  Мʼясо":
                category = "meat"
            case "  Риба":
                category = "fish"
            case "  Морепродукти":
                category = "seafood"
            default:
                category = "bakingMulticooker"
        }
        
        NetworkManager.shared.fetchRecipes(for: category) { [weak self] recipes, error in
            guard let recipes = recipes, error == nil else {
                print("Failed to fetch data: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            DispatchQueue.main.async {
                let detailVC = DetailViewController(recipes: recipes)
                self?.navigationController?.pushViewController(detailVC, animated: true)
            }
        }
    }
}

    




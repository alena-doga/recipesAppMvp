//
//  DetailViewController.swift
//  recipesAppMvp
//
//  Created by Alena on 05.09.2024.
//


import UIKit

final class DetailViewController: ViewController, PresenterContainer, DetailViewInput {
    
    var presenter: DetailViewOutput!
    
    private var recipes: [Recipe]
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 300, height: 250)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    init(recipes: [Recipe]) {
        self.recipes = recipes
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        view.backgroundColor = .white
        setupCollectionView()
    }
    
    private func configure() {
        
    }
                
    func update() {
    }
    
    var viewModel: DetailViewModel {
        return presenter.viewModel
    }
    private func setupCollectionView() {
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(RecipeCollectionViewCell.self, forCellWithReuseIdentifier: "RecipeCell")

        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -10)
        ])
    }
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCell", for: indexPath) as! RecipeCollectionViewCell
               let recipe = recipes[indexPath.row]
               cell.configure(with: recipe)
            
               return cell
    }
}



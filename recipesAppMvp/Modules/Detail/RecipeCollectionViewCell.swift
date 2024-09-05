//
//  RecipeCollectionViewCell.swift
//  recipesAppMvp
//
//  Created by Alena on 05.09.2024.
//

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
    
    private let titleLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 16)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 0
            return label
        }()
        
        private let instructionLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 14)
            label.textAlignment = .left
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 0
            return label
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
            self.layer.cornerRadius = 5
            self.layer.borderWidth = 2
            self.layer.cornerCurve = .continuous
            self.layer.borderColor = UIColor.gray.cgColor
            
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupViews() {
            contentView.addSubview(titleLabel)
            contentView.addSubview(instructionLabel)
            
            
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
                        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),


                        
                        instructionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
                        instructionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
                        instructionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
            ])
        }
        
        func configure(with recipe: Recipe) {
            titleLabel.text = recipe.title
            instructionLabel.text = recipe.instructions
        }
    }


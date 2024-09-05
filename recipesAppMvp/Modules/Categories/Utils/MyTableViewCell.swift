//
//  MyTableViewCell.swift
//  recipesAppMvp
//
//  Created by Alena on 31.07.2024.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        categoryLabel.layer.cornerRadius = 10
        categoryLabel.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
